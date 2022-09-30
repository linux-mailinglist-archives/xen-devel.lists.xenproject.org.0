Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD95F05F8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 09:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414048.658115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeAjX-0008VA-T1; Fri, 30 Sep 2022 07:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414048.658115; Fri, 30 Sep 2022 07:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeAjX-0008SP-QJ; Fri, 30 Sep 2022 07:46:55 +0000
Received: by outflank-mailman (input) for mailman id 414048;
 Fri, 30 Sep 2022 07:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrHG=2B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oeAjW-0008S7-Aw
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 07:46:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c0b5d02-4094-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 09:46:52 +0200 (CEST)
Received: from AS9PR06CA0270.eurprd06.prod.outlook.com (2603:10a6:20b:45f::31)
 by AS8PR08MB8802.eurprd08.prod.outlook.com (2603:10a6:20b:5bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 07:46:50 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::5c) by AS9PR06CA0270.outlook.office365.com
 (2603:10a6:20b:45f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 07:46:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 07:46:49 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Fri, 30 Sep 2022 07:46:49 +0000
Received: from 1b106df4208a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F915DF3-7D1D-4D61-82FD-D5EEF1E372DA.1; 
 Fri, 30 Sep 2022 07:46:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b106df4208a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 07:46:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6541.eurprd08.prod.outlook.com (2603:10a6:102:15a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 07:46:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 07:46:40 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0c0b5d02-4094-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CxV5N4XlJEWIvnXf/0sB4SEo/zwhrdIR8obLbJxMoKUds7Ss04iIC9vHum5RPhhiD01S/cTYkOz9tGTNP9UPZffGusM6HCvKIZD1J4fYpgXov4zS+L64/qBeSvN26HybUMpjX2LpfOMr1tMcChu3Yr48EYbLoS9AeqyyZm1CnfdKb2Ewd8E8DTw4A5iLFbU5ny0pRT4qEywbaNlrvrcFxXvy/7Lrk7HOWiheR9smKTeOlIfzR+R85tWFA1tczkDJWPAZ47duXMV0H8UadIf/ttXF6hZ/yKcEzBSTXiuEu76RinVP3I6b3bwd/8RVj7IJwQIvjMtdfxtN2cIlA6qH4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duczp9xmZ1EtJaoMyzJypPcQrxGkGzVNp++Mc8qTau4=;
 b=IEeyP/XwjkcZ9u6ljFQ1e+ZNsWHUyABoLoibdSzAd3SObBRhbW2qnR9Lal7avj+nxW4oUqYCiF55JjFjKQis/KzXeteCwM4WiCh+6oFLG2ekL1A5kGj0Q4Xni9RU0MTxUw/LlWkubKwVndz1cyMqDPiYP0BT3xLmSU3ZxGFbEuwmsMGn3izaP3fHb+4fKXE2ATFWnR2+MSnJZ1rFVite3S/LlBGBdzztHcbLuhulBZanZy1tCrnJzvj2q2Eyaev2Q12Upiy2CzcasMbmdolgCbSMYQTRKX6SSkpTWg/Os/RfvypXAzHqQ73wR6+rxXWOUoGCb9ZcKrwZw5wMXJFFfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duczp9xmZ1EtJaoMyzJypPcQrxGkGzVNp++Mc8qTau4=;
 b=CnIL5m1qYIcRLt1hT+VO/AI03B2f0wdv6j/SEjBbbFRFIsiaXCEGAioI2GvjczYY2BVKxwXEQcpFYquOH1NMessbvkG5Kq0+/xsGwN6e4aikl2tjnyvY1SW9cmssqrLXu5eNHoQNDK6WqYaM/ZlHYcz4ouLzsMR4BCukzofY8Fg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1bd59b1bcf44b60c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLmnM1ceSkbAwwoRw5dzOelsF3yMuKpr4JG0dx4+2boNq6tdvwIMAjYlDBulnspTO3R+m+MmgmFTL27xADl28HaRj5d/Q709UDl8DOJ6QwThUhVx7lNMRZZqf3FzXwSnFpwm5+80CqZTaC56ms1EQ+XtICQadeRTHrD5WamqAkhJsJUg+HhGbWaFJGvgnq0qHAH6Yp0Afv0bleywn8RYbzPuEBXsf+CZnW3N2LNHvPaC9upYbnyHr+EDZx78HpX3eDV9IIKD7UdRMIFb4B+p53SqHRE9euYM1tEd4cQreZcP2Ti/iAHvaasO7PGB9+CW+TDKxlMa68NJrTeByFYBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duczp9xmZ1EtJaoMyzJypPcQrxGkGzVNp++Mc8qTau4=;
 b=iD6kPTdinW4nk2vGBRlKp6fOYgCOGarIAnEe4F5ZlN834jxYDPquFP4qBJD1+p3zej29h6gWC1SY9ktTeOO84w2YZorPQVu3kPRpiGtqLxtCAcD3Uolrojq15iiF9KJ+BXhQxcK8B3WrZ3vZjN8Ijq+K7KD/ZQn6zLQBmW1TIzkzZO2GzcETQig95J4qNFxj4kPw/cBLQclo9TdfHgyTQVpKYuidpK/1lH90a0/5qkbYXY8xn1vNagOXv+XeYKlm11hfzpjOgUuuJi0Tx8mDbmcUCIZubBYTj0RvlQn8VSjZxOwPm7o8mXsqbRjz2J98IXlrGwKd6rmWMNbkaHz4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duczp9xmZ1EtJaoMyzJypPcQrxGkGzVNp++Mc8qTau4=;
 b=CnIL5m1qYIcRLt1hT+VO/AI03B2f0wdv6j/SEjBbbFRFIsiaXCEGAioI2GvjczYY2BVKxwXEQcpFYquOH1NMessbvkG5Kq0+/xsGwN6e4aikl2tjnyvY1SW9cmssqrLXu5eNHoQNDK6WqYaM/ZlHYcz4ouLzsMR4BCukzofY8Fg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH] Arm/vGIC: adjust gicv3_its_deny_access() to fit other
 gic*_iomem_deny_access(
Thread-Topic: [PATCH] Arm/vGIC: adjust gicv3_its_deny_access() to fit other
 gic*_iomem_deny_access(
Thread-Index: AQHY1JW5H0TZSlF74UKUACaulgO1oa33mGCA
Date: Fri, 30 Sep 2022 07:46:39 +0000
Message-ID: <D8A3FCEE-DE7B-4BF3-91D0-70525B90AEAB@arm.com>
References: <d255a6e6-01c6-c1b3-eecb-71898b3a5554@suse.com>
In-Reply-To: <d255a6e6-01c6-c1b3-eecb-71898b3a5554@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB6541:EE_|VE1EUR03FT016:EE_|AS8PR08MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e7dcda-3818-4758-e3c2-08daa2b7eef8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LxSJ8V34OWczJU49vrtowmJ/z6LQEbrfVhYSS2i8fVUT4g96pTla7TB27fOMagR8WKVT9SjlvTNH2B66RFUVKN4zM5I4zkaX4qi943VdGPCv/LjaUPW8ofoPK3k7HOQpIOtMWXTa0Faaax36ulUC2WEnP0EHvC2TRjhrl/MXBJ2fNkPTDI95PCWD/Vb6oWPSA6pWlVLTRHkDA4M40MIa3Eym/UqOmoLKacdJvRk/Muq6HnvpJG5QrOmxe9dgqt7zmR83vJKcnGw/kAG01ivmQHt4t3jur+8rgFH6eP9cPT0mCilDZmbA2R0NKzKbUUfEwqgiYfWxzsPrqS8KPIYmVEiyQRcUpQ9kB5TuAlohDRSKmrwOLnkg1dmhwomOi+BliEY0Aa7ZhjNUVvx6FefkwaRWqOLjX2gx0nVz+3w6g+DKc+pdLCvUSg/RIF63ofbsqBJtsO3H+fFnCo4uJtEUHO0WIpEOdmviktptaO1eVklRldiYYdw+6obcMzX90lon5KZsR8kaxD0FFz/5Z/P14Rfl/qdFmf1lZccBkCd924Rpr4UsMD6A+rbE2D4GDYyn1Dje9TtlM2eET1OrHhwTOebCmcX8jehicc+uHeQWBvaXZ3Auh8IJIH2ShMweQgGswQftINX9wDQ/NKZUlWcz67m0a9q291p50aYqDrOZXFYFkO96FwPKQnPqFjVl8UUL4pVLejjYqwpKZADKsr7k5ROVHeMYaoATIVjUaPDGutU+i2DKa8UONR+4DoHOawWWXmjhCG4BfSzDOl7MR97pLQRE8qlUeVgAHUAMZUssmPs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(71200400001)(8936002)(5660300002)(38070700005)(6512007)(6506007)(53546011)(316002)(478600001)(41300700001)(2906002)(91956017)(36756003)(8676002)(4326008)(2616005)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(38100700002)(186003)(86362001)(6916009)(33656002)(83380400001)(122000001)(6486002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <618859E48F4F2247A67ED3A55DA7D968@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6541
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a7daed3-9548-46ea-ffa3-08daa2b7e929
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ISsk7Yj2RMsg+4kwnZB+0o1MH306d//ZmZVlV26l8LqPviKvNM3OOYWgHd9AwtA9r1hYMuO0ehiPhahByaQfa3x35ZWooBuKA1vR0I4K7OFmSwqjTNIlIIRp/oYJ2oAer20WbeHRs5TaSmhoS70aQUuOuI3q31uSvoS93/0qw6B5hkFd7FAyRa6128uFMrT5FnILVWIs0k5uL8XPSDdWlIhRRQgXLSciIjGtTKYgNpxyg7X8/RW8+HPf0FO+RXba6zOQwM9CRdlQJbgNK3oueZkhNnjUtZ0AQQk9LKzNC7TuQsYSVwvrB6JaMFMR9layuEAQWQXCF9DnPryz9BhVqO2P6KbBCJtKEJdlyKovIXq11Gjf649NaLDE/lqhe+9hQrQwJJrKD8J5EyDZm0wsuR1z4UYZRwKoTPEYuH+i/QWYq/8XopTorgq5WnRkkL2hY8Xd/sMwl0/UZIXbGUyfWkUeprnv7z7XphlkNnodQmY2vH1ST15iW2MVKLnPgR9F/XsxiilM7FtuaCJDSDO6jy03VyfKlqYCvdmY9K+e9louJYJjogWYEiBvblPEvKDBFy9PUt0C7h37aU+QKF5XXgDjqJVzPylkUT5LZTa9Ud3Yy48ui3ejZUJnK2jwHq/F9Tcv3UhwUbtLq7cuKi1BlJqNIZAfu7YwGytNefFhic6KQX+X646nz3qnQ3NZZ+BU1N3ZHLIWdvDjKKeuLHiT67xA2XvsbNuHPiXal5holQe7OOANT1mwW3+TZVuvodqPpYj6I2FoqpVso5idpy8Rw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(2906002)(82740400003)(33656002)(36756003)(70586007)(70206006)(8676002)(4326008)(41300700001)(83380400001)(6486002)(40460700003)(478600001)(356005)(6512007)(6506007)(40480700001)(53546011)(47076005)(107886003)(26005)(82310400005)(316002)(54906003)(186003)(2616005)(81166007)(86362001)(336012)(6862004)(8936002)(5660300002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 07:46:49.7256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e7dcda-3818-4758-e3c2-08daa2b7eef8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8802

Hi Jan,

> On 30 Sep 2022, at 08:27, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> While an oversight in 9982fe275ba4 ("arm/vgic: drop const attribute
> from gic_iomem_deny_access()"), the issue really became apparent only
> when iomem_deny_access() was switched to have a non-const first
> parameter.
>=20
> Fixes: c4e5cc2ccc5b ("x86/ept: limit calls to memory_type_changed()")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -892,7 +892,7 @@ struct pending_irq *gicv3_assign_guest_e
>     return pirq;
> }
>=20
> -int gicv3_its_deny_access(const struct domain *d)
> +int gicv3_its_deny_access(struct domain *d)
> {
>     int rc =3D 0;
>     unsigned long mfn, nr;
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -139,7 +139,7 @@ unsigned long gicv3_its_make_hwdom_madt(
> #endif
>=20
> /* Deny iomem access for its */
> -int gicv3_its_deny_access(const struct domain *d);
> +int gicv3_its_deny_access(struct domain *d);
>=20
> bool gicv3_its_host_has_its(void);
>=20
> @@ -206,7 +206,7 @@ static inline unsigned long gicv3_its_ma
> }
> #endif
>=20
> -static inline int gicv3_its_deny_access(const struct domain *d)
> +static inline int gicv3_its_deny_access(struct domain *d)
> {
>     return 0;
> }


