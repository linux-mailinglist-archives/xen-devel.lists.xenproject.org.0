Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A861E5B04E9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401689.643590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVurz-0005hx-Mf; Wed, 07 Sep 2022 13:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401689.643590; Wed, 07 Sep 2022 13:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVurz-0005fQ-JW; Wed, 07 Sep 2022 13:13:31 +0000
Received: by outflank-mailman (input) for mailman id 401689;
 Wed, 07 Sep 2022 13:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVurx-0005fK-QR
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:13:30 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50089.outbound.protection.outlook.com [40.107.5.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc62ec84-2eae-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 15:13:28 +0200 (CEST)
Received: from AS9PR06CA0281.eurprd06.prod.outlook.com (2603:10a6:20b:45a::30)
 by PAWPR08MB8909.eurprd08.prod.outlook.com (2603:10a6:102:33a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 13:13:24 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::1b) by AS9PR06CA0281.outlook.office365.com
 (2603:10a6:20b:45a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 13:13:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:13:24 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Wed, 07 Sep 2022 13:13:24 +0000
Received: from 237868bb3936.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9CD3F0BE-244C-448C-92AB-E530D8692D3D.1; 
 Wed, 07 Sep 2022 13:13:13 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 237868bb3936.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:13:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9622.eurprd08.prod.outlook.com (2603:10a6:20b:619::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 13:13:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:13:11 +0000
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
X-Inumbo-ID: dc62ec84-2eae-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VZN66kDjjJk/6KTqqYLkQt4d+qAwvWTvutXwi3r/EIXDDG50Fvd4APHhZFyUrv4DnZh7/0Zh1CqEovYyMcWpDZMt22HCr8w/slkkMsQWC9FdRxIUnBCQVQWACRf6QbQcwxTOzA2YiqaD6JfXHIcA+PsYmJmoVkjFWvrI77sYWZprpFUw+ZKCtMujytjakmCtDAYBfPFmFkrpX2uqBz+vkIKjKreX7CWNkMa31xR4JxyVhuIU7hcsGMt4XurrR2kdjZnpfMz4J/496K05aNHXPg+jownwnqPKNJaTqFdoOjRvRlh5CRdZ4x8zDH+RX/XTafqrUZ808CI7zhUr2k53bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPSZksgSqBgB1l2BBur1o6n8MHhWHapVGYMKO+qCT8w=;
 b=VorpxneZNDTsHaYBLHBG4bIVe4bUFB5x5R8c0BDoVQHL6mBS8x2ZrQni3J2nnp8EsFAmY/caNUaZsoD6EfCTpecogA5ezMWAd51kN+2AvGvBoyryLJRnYfZCm1lWabMMno3HHclDkYDka5SJaLsc26UfRzxw/n/NRmRQAaYYKYP3IfAeyuHBhY2W1/oGgNPAuV/7z/Y0DZ1cNTaUvhO8GgSs4MsXrULTeFpPvyWsDUKIDjAn3cZzWMk1BGfRbt7mVJXuYP1lStN02sKlTPdFq3xV5Z4hFip6PyXYAr335NWX+KyLHYKl9U1OmB1IZybOlfEfvo39eGWVr2MD0tGdRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPSZksgSqBgB1l2BBur1o6n8MHhWHapVGYMKO+qCT8w=;
 b=WMwyLOHeWB8tsqSxD5sX+ckv+VS/3o8u4xwz+iacGKS1R6i4g59MWomIOAxygNUPHTo3A1MmSTqnVisradfMeosOI+xXF4nLJ9CE+VfDWh8um5dRZ1hWng8HtuK2a4RK8n5LZznceN5opRhawNfu+SnZJRxMtV22O9fCJ03r2hg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ff5976b0da7620d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtnPNcIWGZtOlvem5t8/dOzl3K30U/1wK0ZhXbEzXH8LIulp/1vIbKHjAE1fWDKK1M0gamKw7phiokhdIAHcC8KP3Fk28jm7OHhsh4ZRqW5cWgG6nPiBXU6oS2DTT0C5sp5BVwRJZ1K3tdTTD4CF5UYAFVVr/l86DfsEqygMfetGWbL19pA4nSyFdJRaLPJZGTmUQAItKo9PwOe/HtocP8sKgo7e/n43rZucUkXlLkO0Jkck/7QGKZMj+TaNi7qAWc799k9s52BwS0CrVkfyhYLh50EaBUZYwFIO8ahePNQuXpGx7typ8lhVoyuLFHf6iQxZGD+TvWnQcumSc3baRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPSZksgSqBgB1l2BBur1o6n8MHhWHapVGYMKO+qCT8w=;
 b=jd6NYncs4Y7VpVp/QZj/fhbR/lkIasD4oB8BVVcBB+y8iYmLyKuV6zO8ZsCSExG5Z0Y/lDIrfAAF4q9hfz/937n8igQdNP32NxfiMHIEZ6VGtTKTU9vVfQqQtwBv0i7CpYVuX2awuKMk446vCc2Amog+oYuLujcvAANRfe/1++qQzn23e1DFFXILqhOyMZQx5P5LN0JHL53cHQN8QiMUSZ1Jjbs7Vy7WmHxDggdVHYzUYbPLjE9nmMSa5hqV6u3AKcRfXPYXyXu0VV4la7hNJ5XMF39S/XCkRW5Ww2Y/73GcpjJvJjAd1sTCQCex8z+FLyQkK6JNUzag6QWpuUVJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPSZksgSqBgB1l2BBur1o6n8MHhWHapVGYMKO+qCT8w=;
 b=WMwyLOHeWB8tsqSxD5sX+ckv+VS/3o8u4xwz+iacGKS1R6i4g59MWomIOAxygNUPHTo3A1MmSTqnVisradfMeosOI+xXF4nLJ9CE+VfDWh8um5dRZ1hWng8HtuK2a4RK8n5LZznceN5opRhawNfu+SnZJRxMtV22O9fCJ03r2hg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYwqqLAtgrk5Z7CEC9g3vN92mek63T3yeAgAASqwA=
Date: Wed, 7 Sep 2022 13:13:11 +0000
Message-ID: <06E1E4AB-5DA1-4AC4-9452-9507C2B75E81@arm.com>
References: <cover.1662548825.git.rahul.singh@arm.com>
 <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com>
 <a7576b0c-2134-1778-7751-375cd4c02554@suse.com>
In-Reply-To: <a7576b0c-2134-1778-7751-375cd4c02554@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5916710e-4d75-41db-c01f-08da90d2bec4
x-ms-traffictypediagnostic:
	AS8PR08MB9622:EE_|AM7EUR03FT032:EE_|PAWPR08MB8909:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bUu7gQn6wo7fs7fxbfo2FOcTBLyLM6oYxR6tX5107pLTECB3GjeO0UecbLnfSPdr7Rfo/gmXeC6UhurGOMVnadQSAh9ozqw8joUcsU0Ol3MgBBTXwpGME/szKxbYHYkDr3vlkSKSknpvohmKQazIKtpDeHACvgZoJMIbQeXoaiBMbFn0cmFtG5c/0GZPrLvlRwn8JQc1BGmNsNAgKVlMkykaAH0/w3dl+ScZMJcsbQMNIYK9QlYz2Nl71OGxHv7Nqqqj5gkh4KW1vxPINuQpgLe1LGel3cXfH1Q23pcVCazvJu2MKfH3YULNt+HhQ1KfIE5TgnJ5UHN8pVtvkPttLr/OkR+E0pO4Bcra5P/ZC9haKLacuW0dvJ37zLMNPdXh5vFfzlZwQOy18EvxbM7qxgT2OZjRPH+jQKFWPnxgZ0+4qeybltXw7eskr3iQkQZz7Idps4ss/cnWLzo2rQSNabnxJNvk6hCvfXQ3fu/LY3Ufh1bIR2rzNdAFF0Y3jGuSwLzKvajv2EOaKhPfHpDd/ZWFokYgzxudBWCMSdOqQdLo5rbhB9BqqetDl2OnWSmTL64uS9kytbHus+WXqdKqkpv6kLzd85C0F5pyi/axJ7eRKPk0/wj+WOrS1HIZxSS8fFtQ3HT0Xg9lyj4M5sWvkQ0oXyjbcNuxF7aQyE3rOeyTE1mwda1TVsBR1pMs7L3/mKyFMBpnlQJWCfA8Uwjo9zLeL1FMzIhu0KCHr53iKRoTR1/xNxXc3n/my5mCHWBaNf+FImJBCM/776IkADYSRvM8FZESpJyLfcnnezFyhDY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(36756003)(6916009)(54906003)(71200400001)(316002)(2906002)(38100700002)(26005)(38070700005)(122000001)(6512007)(66946007)(76116006)(66556008)(66476007)(64756008)(8676002)(4326008)(186003)(66446008)(478600001)(91956017)(53546011)(6506007)(86362001)(6486002)(33656002)(5660300002)(2616005)(8936002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E4BC395DA7DB46438854589A3396B218@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9622
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5be66535-180a-4fca-dc9c-08da90d2b6d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QAGp+4j72b36KcpsK7Ig/iFIkro1/iuJxa23+Snf1xdGBs4jQx9IqoGjd4bRvT7MnDi2aPCiWt6E1Nxg3awWSASYQn8aUmRm6aGvKSKQ26MWhZBiRnwDpS0XWLgqMKf+ijlmGDQeOubtHD0gajbWev/3k6dB70fo4TyHCc+RltfeRhWamC1QPxc3eIoH4cc/cZYMpf2IvSUBf1zlUPTZpRgNt5VEHIRP3OJN29eup4ZEZ2CaGOKw3wG65nNzFc4FljXPiyXFFKz+7HnTNhvVD/EwDIkIHWOva3rLbeJMO8GiZ8/39jtaG7tWrFd9NcOyzsoeev3kgeWfMKtQHyKK/TomyPtsKO1KdvqijzsXeLrBDb97/TzPKgNkH6Hs2GyC2FPz7AnGOFOsz7r3SunIuoO+8C4WrREHmmuco4bf3CY5cNfQD6S5iVx46kQLvEmyYvMbnG0b7Ai4YVlY+NpvtZooKOpC2pVRbQFuNSSvmG37UEtaJAoCoZz/QLpV/DY6lkLEqv0/koHvvOim9DxCxZMJqwGTsVFS3UwvsmqCyO2sdoe28fFISSNSMQ9hxgJujGVEvicroNM9XI8kvNYsGLbluq88vX7b6bRrgXLqM6BckOr5Aymb1wvgodm/9mtHeDfRS99rYIyiUeMZwCGslt4SeA+UDS1ituRw39zv2mTACaZnP3+bdwq2ZDj2uSrvJwBvowinaa9xeUFTzfDIWL9Iz8+P7BB3kj2TlrbOpdX3QB76ptxlKxAkt7CIzKg8XWN2c8bfb1SHk7ECcqdj7w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966006)(40470700004)(36840700001)(82310400005)(36860700001)(40460700003)(86362001)(81166007)(6862004)(5660300002)(8936002)(6486002)(2906002)(356005)(82740400003)(70206006)(47076005)(186003)(2616005)(316002)(54906003)(70586007)(4326008)(336012)(478600001)(41300700001)(53546011)(36756003)(8676002)(40480700001)(6506007)(6512007)(26005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:13:24.3818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5916710e-4d75-41db-c01f-08da90d2bec4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8909

Hi Jan,

> On 7 Sep 2022, at 13:06, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 07.09.2022 13:09, Rahul Singh wrote:
>> is_memory_hole was implemented for x86 and not for ARM when introduced.
>> Replace is_memory_hole call to pci_check_bar as function should check
>> if device BAR is in defined memory range. Also, add an implementation
>> for ARM which is required for PCI passthrough.
>>=20
>> On x86, pci_check_bar will call is_memory_hole which will check if BAR
>> is not overlapping with any memory region defined in the memory map.
>>=20
>> On ARM, pci_check_bar will go through the host bridge ranges and check
>> if the BAR is in the range of defined ranges.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v4:
>> - check "s <=3D e" before callback
>> - Add TODO comment for revisiting the function pci_check_bar() when
>>   ACPI PCI passthrough support is added.
>> - Not Added the Jan Acked-by as patch is modified.
>=20
> Hmm, I don't see any change to the parts the ack covers (x86 and common),
> so please re-instate. I'm not in the position to ack Arm changes; things
> would be different for a Reviewed-by without scope restriction.

This might have been clear for you but your ack was not mentioning anything=
.
As the newer version is modified anyway, we remove it.

But I understand from your answer that your ack is still valid for this ver=
sion.
Thanks for this.

Bertrand

>=20
> Jan


