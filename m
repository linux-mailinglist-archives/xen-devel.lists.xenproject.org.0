Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA76574877
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 11:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367136.598198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBuzS-0003Dn-K6; Thu, 14 Jul 2022 09:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367136.598198; Thu, 14 Jul 2022 09:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBuzS-0003Bu-GT; Thu, 14 Jul 2022 09:18:34 +0000
Received: by outflank-mailman (input) for mailman id 367136;
 Thu, 14 Jul 2022 09:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZjPX=XT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBuzR-0003Bb-38
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 09:18:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20045.outbound.protection.outlook.com [40.107.2.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edd024b7-0355-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 11:18:31 +0200 (CEST)
Received: from FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::23)
 by AM0PR08MB3844.eurprd08.prod.outlook.com (2603:10a6:208:101::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Thu, 14 Jul
 2022 09:18:29 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::9d) by FR0P281CA0018.outlook.office365.com
 (2603:10a6:d10:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Thu, 14 Jul 2022 09:18:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Thu, 14 Jul 2022 09:18:29 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Thu, 14 Jul 2022 09:18:28 +0000
Received: from 40f132e111b6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 336090EA-058F-4BC7-A274-C60EAEFB24CC.1; 
 Thu, 14 Jul 2022 09:18:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40f132e111b6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 09:18:22 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB4270.eurprd08.prod.outlook.com (2603:10a6:803:f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Thu, 14 Jul
 2022 09:18:21 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 09:18:20 +0000
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
X-Inumbo-ID: edd024b7-0355-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mSANp9ELcYoSR5k2dNGaA01H2HC+qZ7hvjiepgwE5oYVZCm9VjW95gnEMEyp++VbYtSKxzH0qf73U9GuAy14pFCv1GDMA/3gQefqRMjRSveB2Y8YyoFqMR1zKAqlQm/3gyBrt+01T8zKvF9yUfTOWdZXocTinyjh8ZlXIIxZpCsyWvri00umGDFAyS+h6vCf+Twba1Jwb5uxSg2GXMBJQGQj3NXio0iqtbc5LlGiyzBC1TcJLDNsrntf7I+UViDS/F8fOuciT8ClyBLip6g9wNEVHiooF6BDwccRHQroXktzPCbWDNVX/Ypl11px+IioOf8vAi81SKHFcJZGj3DnSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RLBzkFkt2bartYGr5T9EvpA4ljTjXS/JEPyvVx+Kmw=;
 b=dDkLaisiAPNFUSiwX9FbP+BlCOYjxV9PdVGbhX20YwH4f16m+86B8bDImOp01QhBVpyaFTvhrdAMz0gkcMgvOJeRha++mOCQkiEYVGzzlNuhe5VH5v56/SAY/DT40vCrNju0o+NvHZJk68tEhkZPP/KqkED4SjtJCnQLKR9kQAPeEJq7Lpy0B6e9tnQcWfEK7u3ExcDm0D5BmR7BOzXy2FMmNxEcuRly3hLfKcEm2h+0L2C83zEHAcvf/D6iX+Ifaw3BVDWJ8z+dibFZTorH0u1jzKuh8Bp0h3VWyDYyH+rGZp7Z+0n7lLWCYsIcb8CVDDqi3BH390sYXpCmSmsHJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RLBzkFkt2bartYGr5T9EvpA4ljTjXS/JEPyvVx+Kmw=;
 b=stX4iRE7gqe25R4MzmPwKr81lLs8bzLSLiqCFFEbyJBMl0OdNrlqmuAbcLPaCKHuF4BznVEC7HmuJm9gaCKGrTpGn+LepARF9eR3sPI+bvnVVzpUISOlSvY3AGYHffvnbNFHDnrKZcU0z0qS61R5Cy6jqPvxuk6FbUser8eetc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSvDvMJxkMy9fVLV8t+DvCYTxo4TZ4JhLO1vv1ySO4zYBYyoI21KpHtjq5NLKW0oPtm9C8gYR8xT2gJ1ZkspkwvD+tIUz1WMg2PDKP6QXKp3uhL8f/QCBtKatqH00KxXo3+AyhVx915hj2CUO40UZeH2or96E8YiJCsuUQ9NIX8mPnIu0sa22v7RTkzJwD2/riRZSgf2c96zZTUodFcts0lFkOc7gk8IXeS7m4p4MCF+kUVF3z8Kta5hO5Vt9n8+1NVnuX08z/aLjsYswO8gpTgrMJXVyT1iQ09l1wtWo/KG+3aOLufV1f/1bdOUJP76SHbje5L7ZbtChCbYwLaB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RLBzkFkt2bartYGr5T9EvpA4ljTjXS/JEPyvVx+Kmw=;
 b=is3xsWQWtBVsIYgqGekg9ACHAyIvMJEp9fTZkCvTAlPX/dH9jhKPOl4Ah/ScoRlElAPBDCuzCROXD3rouf93PAZPlBfaqMDtQifQOtoHSf+lHPM7EMfoCU83N5faOejnvgRWuiNBiGra/uVMSIk0BTV0DydUMD2wWH+G/LMNYDY/jf7zeMnDogaSnoJtLBqGpLaP7weF4iBWu7vWiVPqexGzr9TlrxMDnhOmUO9k8M7rM9dRtTM8hlA25JeVJTlc8yNd+FA68FXSdiNDg0ypfUR8E2zkTSrzFH3MW22h/84QHj8bJ/J81AbcoIXZOI5WqsjgLwgCXqgNceAUOxTfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RLBzkFkt2bartYGr5T9EvpA4ljTjXS/JEPyvVx+Kmw=;
 b=stX4iRE7gqe25R4MzmPwKr81lLs8bzLSLiqCFFEbyJBMl0OdNrlqmuAbcLPaCKHuF4BznVEC7HmuJm9gaCKGrTpGn+LepARF9eR3sPI+bvnVVzpUISOlSvY3AGYHffvnbNFHDnrKZcU0z0qS61R5Cy6jqPvxuk6FbUser8eetc8=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 8/9] xen: rename acpi_scan_nodes to numa_scan_nodes
Thread-Topic: [PATCH v2 8/9] xen: rename acpi_scan_nodes to numa_scan_nodes
Thread-Index: AQHYktrQSxGeD9dw606vij1sbUd1TK160UiAgALOLvA=
Date: Thu, 14 Jul 2022 09:18:20 +0000
Message-ID:
 <PAXPR08MB7420E9817C03365083FAD2829E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-9-wei.chen@arm.com>
 <1796ff82-6c48-8eb5-9c68-1e84de51bb2a@suse.com>
In-Reply-To: <1796ff82-6c48-8eb5-9c68-1e84de51bb2a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 827D698F2AE9774BA70FE17F47D8D10D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ea095d8a-9d28-4b25-76cc-08da6579d0c3
x-ms-traffictypediagnostic:
	VI1PR08MB4270:EE_|VE1EUR03FT032:EE_|AM0PR08MB3844:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Uft/I/CG4Af4Tm6UzyhOyfS7wRJDMZwMp9JhdRJK/Bbzl7SHxyoXO5gW+8t0g/iYcILGkRnAgdi/GHlTf78DQdveMJRz3Kg3EadceaRS1tH8hid4Hmq8urYWL2aq0+/PsNV4FsV4q2XbqPn1zKhZZm1G3/Ck0973htdx4c0dJOUnucjloAEkAdwZlNeUXoGFP9kMWEY035lY868KiGRiuzG7+xm/MoRKNFOwfMjjpn4zW9UUDhQYz0SEe+0DMO+kIuOOGsfgjcAZKNP+ty6rtYXTvY+h6vKU/3kVrFunV/cdroxHh4HSTkcanpX2GDhjEkX25kCmwXBPGx4ce5yoqSq1hxH7I18vLgQGIuLsiTFFtHHCkN/0xItCKgTcmjxOGJhtpN9xVUWeeplB3sh4w/wUTc+I7NlKX9CyFSLYXVWjPJuajRW3bnAJVNouTRFPkmHBladCYxDpAXG9p2dGGltNU/ckxt2wV4Gv2AWsWMxEcphY1b7hu0CX3Ge+GNe4WN0BKyhwc96gUN8xXBoEaPTseTdlDmQ9+ey/5OzdNx45JWmO6fAs+0IDfijyh7u39tgYIwZiRYqL8SapfW3LOJNvcibY08l36FMtSiYcKoJSwHDcDvdjZCGFx65IIfPlX1+4lUKJ4zUsFXLxa6CrrEL/Fr6JAwZpxRfJl1ikVJyQck+361spZ95smzL7SnwJ34ZfsuTU1QZ6vDeVpMtnJCUCxr3ZetiZzf9toOgJhPJ4vpaKwHuZUueMDFeJw9oOkFlCGVoOWZ9y4YoYmRspnis2flbo4UQptFRucEIb18T7T+9W1oPDvTcxQfiUFaKp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(6506007)(478600001)(9686003)(7696005)(8936002)(52536014)(4744005)(26005)(53546011)(122000001)(2906002)(5660300002)(38070700005)(33656002)(86362001)(41300700001)(186003)(38100700002)(55016003)(83380400001)(4326008)(66946007)(66476007)(66556008)(316002)(64756008)(66446008)(8676002)(76116006)(71200400001)(54906003)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4270
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d90f0db5-9948-40e5-25be-08da6579cbb8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dn49P6tezm6DLhLtN1TAeyhpPINMrfX/ixUlhvuK6ASKvjZRKbJUNZ4XBVYkyYDfOURBIpuyFsox2aRs+gW7Bkez7sduxFGwAb5w/DsxjRhgdrGuG9BJpHvbo4KaV/nNZ2jpSmxjbqvfwmaNpWp+GWwrZiKwtvpW+onAwu7mpMafJY2cnBwdbRPNLRcMGG2Ws2fwQ5UMpM24M/yu5bk6+6D1FDtI73EWfjumTbH82rlQ09ljsn3xZNu/TUGxyhF/Kc8JjvqgsLFDgOqTDrTsuLs9dRiJ6mN7DbnfQ2vZIBCGqVU6Z/cYH6SxhWQpA8Y5CAlQ7qc9t2iJgVD6+talWm3hLMMppWV5D/DRrHwFHEdvYE0An+0QcjC+w72GSWzrNXcu9gBsGDL0C2+r0i7uls+YJRp1GiXaaWtxKSbA3WXeFKTzTxpXIR7b2cS4LU/3dBTddCvBkdt4Wxj1OqgrVjVv8Du4T3/A1QdmwfUwokDsn1pU8oIYAoNfnBJiq1Ylrs+BHzB7sJt9IFj7FtaQSmzZJ0sGVmcO4uwYVlYsnfmnrC+azioFc9jM0o+OrYg1j4u28Qyh7wUXtXg486J/O3izk1YyLxcqF7aEu2oDOF0G+p0u+5iKewHax8jV49QiquK6QmY3c6WPqslZuJ2kNxkeiSuDAdMN2aiCis/+kg57u6Pq2XLwHd9xbrPzoSXbj0Td062zbTT/v89vr8VwAJMuS5XY5WkaT+qTG7totxhiqHkqm5YiGwSv9bP33xDnLBvzZm1MuZRsguGhnLmlTF3MBcFQK0WBJ92snb1FXno8OGG6VSgUJ8z4PUD5CLfy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(54906003)(52536014)(478600001)(316002)(4744005)(55016003)(8936002)(6862004)(8676002)(83380400001)(36860700001)(33656002)(7696005)(5660300002)(40480700001)(40460700003)(9686003)(41300700001)(81166007)(356005)(53546011)(47076005)(82740400003)(2906002)(6506007)(70206006)(70586007)(86362001)(186003)(4326008)(336012)(82310400005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:18:29.3015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea095d8a-9d28-4b25-76cc-08da6579d0c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3844

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMuaXpSAyMjoyNw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgOC85XSB4ZW46IHJlbmFtZSBhY3BpX3NjYW5fbm9kZXMgdG8gbnVtYV9zY2FuX25vZGVz
DQo+IA0KPiBPbiAwOC4wNy4yMDIyIDE2OjU0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBXZSBoYXZl
IG1vdmVkIGFjcGlfc2Nhbl9ub2RlcyBmcm9tIHg4NiB0byBjb21tb24uIEJlY2F1c2Ugb2YNCj4g
PiBvZiBvdXIgcHJldmlvdXMgd29yaywgdGhpcyBmdW5jdGlvbiBubyBsb25nZXIgaGFzIG1hbnkg
QUNQSQ0KPiA+IGNoYXJhY3RlcmlzdGljcywgZXhjZXB0IHNvbWUgIlNSQVQiIHdvcmRzIGluIHBy
aW50IG1lc3NhZ2VzLg0KPiA+IFNvIHdlIHJlbmFtZSBhY3BpX3NjYW5fbm9kZXMgdG8gYSBtb3Jl
IGdlbmVyaWMgbmFtZQ0KPiA+IG51bWFfc2Nhbl9ub2RlcywgYW5kIHJlcGxhY2UgIlNSQVQiIHdv
cmRzIGluIHByaW50IG1lc3NhZ2VzLg0KPiANCj4gT25jZSBhZ2FpbiBJIHRoaW5rIHRoZSByZW5h
bWUgc2hvdWxkIGhhcHBlbiBiZWZvcmUgdGhlIG1vdmluZyB0bw0KPiBjb21tb24gY29kZS4NCj4g
DQoNCkFjayBhZ2Fpbi4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiBKYW4NCg==

