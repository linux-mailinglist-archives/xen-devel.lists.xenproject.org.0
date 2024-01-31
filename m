Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB7843864
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 08:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673785.1048254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV5U3-0006VE-Qu; Wed, 31 Jan 2024 07:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673785.1048254; Wed, 31 Jan 2024 07:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV5U3-0006Sp-O9; Wed, 31 Jan 2024 07:58:11 +0000
Received: by outflank-mailman (input) for mailman id 673785;
 Wed, 31 Jan 2024 07:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ZVD=JJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rV5U2-0006Sj-RR
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 07:58:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79659d50-c00e-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 08:58:09 +0100 (CET)
Received: from AM8P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::32)
 by GV1PR08MB10502.eurprd08.prod.outlook.com (2603:10a6:150:16b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 07:58:05 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::47) by AM8P191CA0027.outlook.office365.com
 (2603:10a6:20b:21a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Wed, 31 Jan 2024 07:58:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 07:58:05 +0000
Received: ("Tessian outbound a064b9944658:v228");
 Wed, 31 Jan 2024 07:58:04 +0000
Received: from e7fc7dd6f6c5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6008D822-EBC1-4630-899A-1D6DE885607F.1; 
 Wed, 31 Jan 2024 07:57:57 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7fc7dd6f6c5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 31 Jan 2024 07:57:57 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV2PR08MB9399.eurprd08.prod.outlook.com (2603:10a6:150:df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 07:57:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 07:57:41 +0000
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
X-Inumbo-ID: 79659d50-c00e-11ee-8a43-1f161083a0e0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MRT34i6NzN5Z/Ysi25Pgjne6frJNPeaFo8D7lRMOjvmSScxeqv99BOiYvVSdUKXO+Owz1yhGyeEpdtNmg1qC+6fJolKUgVe7MlnCqICW8m+jXCSgZODMj+PPoLEYEhpEjvXKRb11+fQsBfx2C1ZIQoS2Z3k/ARO6PB2QJ0TP8aGQhsTy/pNvrVySW2mWn6syV6GfLuZLB4lG2MmeVSnlt/Ur/spVZE/X4W6f6R7WkN1Vcs863j4NhIUeSfZTWJhPLHV9kH518ETR6gkm0KgnS9N/bBPrVLf+RfHiQbmNzcl4Nz0N0U4kqz6GOieA80w0ieE2rPx783vsh2xJZl0Baw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyg6TwBFORyPI49bh74f6ruCgePYH00SbmdfUiNfFSQ=;
 b=CK3sRGmgrB5JeMRM5/r6nxJbFzB5pHS09A9weM881coUMKY4RNDqmpgtdL9H/fKEYbZkkQyskEQanwShjrttpE8OKUvCuRKB6xGXwsFKtGd0j5IVW+xEQprjV+Ym8bSaok/chihJhl9pHUqcMVbVoYAri4VaEGU/GoGpYdu43gMd40OL2KibiP/2FZdSn2IWn9nHmOcPnpVcckg+KhZzqnpnuH3vXKDqyKne0ENOphvOzW9C1WDVkR2wT83fBQ6rEjOgos7nIV1rY8gdFLEl9jrFfdSEFnIntvwzs7JZj80+ct0N+WvZc6AoteSdpelRpD740uHSpqYTzlcKzBvvIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyg6TwBFORyPI49bh74f6ruCgePYH00SbmdfUiNfFSQ=;
 b=G7ExOFDyJ3w/bc2mA2wRT/rs0PBt6b83OL5kA4XuUSBSnH70gHIrNOcECF6N3qXEjqbTbWoY+Q9ihBMMPFfSf+gC/WTmhySdOXbjiV42k604v62UikTnqcZR5a6waQfFiI/pLeASM3VVs5yndomDF6ZQyKPNPb2RJjPv2VJettw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11dc0bd2db39e170
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgSsVTm8x1IeW2VHK0HWmODPBkljxfjXcI5955n59U+77u8YlHpSzVTAJ38Gxtm9o24bwr2Wykmq+QR7OFOng5RqiSutZYJRtGOxu6UJLzRUvNTIPibTi6jhze30DxkyRlUmL24w3oFmM9hhqN/tbsfI+uf1IpvyJvwXgpDTC3uGetpjbx3K6UVyS6oIzQ3zVoSec24rf0pt6EGHHtEoAuZpew2PMNHpsgEGxGnEyRr6Y/tNQLS7sr5Xr02aD1UXwP6cP1weP1So8ElEzZnuszO+TRwrZ+SlQQKryKR5YKWgaYN0+02mL1mdT0S8ezdyKQ8Lp8UOy+Yul6MEByO1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyg6TwBFORyPI49bh74f6ruCgePYH00SbmdfUiNfFSQ=;
 b=ercjPNM/hrE/KaZksGmYOIM5S4GjnkphQT45Hu9cRC/Nu1ishAtnSc916v50qUR0FdGKItam76l9VjbvlI9aKJUGOWgvR1uzKn+3UroJq4nam1rnKN+Gq7x+iNopjrEb6+3UD7QEJxWqixhB+5oqeMF8/TN5ZhpOoovAYI808gcY9oo7Eh42twVz6M2FZKlMuk7qx5ND6tP6jvJw0ZOdj2mkazQgd6y5vlFbLQ8/6aKXDHqq65oMnCIneP1QTAjmj1JT/RbtQx5bYroxQDJyfqJUovvqlvxVB73nPOwmXDY1nnFHEaB4G8qNPchkdHj5EGp90ph+MPr/MpznlGwZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyg6TwBFORyPI49bh74f6ruCgePYH00SbmdfUiNfFSQ=;
 b=G7ExOFDyJ3w/bc2mA2wRT/rs0PBt6b83OL5kA4XuUSBSnH70gHIrNOcECF6N3qXEjqbTbWoY+Q9ihBMMPFfSf+gC/WTmhySdOXbjiV42k604v62UikTnqcZR5a6waQfFiI/pLeASM3VVs5yndomDF6ZQyKPNPb2RJjPv2VJettw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/arm: Properly clean update to init_ttbr and
 smp_up_cpu
Thread-Topic: [PATCH] xen/arm: Properly clean update to init_ttbr and
 smp_up_cpu
Thread-Index: AQHaU6HzSvigBwHs9EiZEUauSjpcEbDzjwMA
Date: Wed, 31 Jan 2024 07:57:41 +0000
Message-ID: <0D96C966-8DC4-43C5-9F61-0C54A2DC796C@arm.com>
References: <20240130172942.52175-1-julien@xen.org>
In-Reply-To: <20240130172942.52175-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV2PR08MB9399:EE_|AMS0EPF000001A9:EE_|GV1PR08MB10502:EE_
X-MS-Office365-Filtering-Correlation-Id: 323e06da-7aaa-472a-9e6d-08dc22325b1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3mMeELIbXMvO672GkHHGukdh42/FbYe3cg67QWUWl8TOgGM/mpb/nclPOLV92tA5OPSpay6oj4oPguZ1CdPjfU8RphwKP+Va/CB++/dM8RC+3EhKep7YXgBREMgDu/RIChOztggqSrkW68b82a1PPKK9vjX2dDc8QydOYuBXWRxhey3yHQsO4ns/cG/xrK1c/gCx1EsJIgXIVDbmh0AD3Rd1Ymhi983NiexlIGdOT+1yxiUo6NdwwOzBh8wc8q2yPDEXGPGJPBsjCVKWe5R7/TBqZV+kuDSkv0ISkW8f0/DcWxIp0zXLUpkYi4PipMKJY5WcL5o/vCHi8xHWW05YpFdliTlX6oxL/0uPfMs+frm5rg+Qf5oXACfu+BrNbF81ympgGFxMpZ066pXl+wty+MCrWNyS8LEyMRCknGjTCjFiL2uUdyY2RwEWc1oa8Dx/1nlr2hRaO4lls9ChMEEm3dUvlVD2l/AWIe6igTYuPvNKGBQUKf5beHUzwrn0dHHl3b18Ls6OI0KowZpkHRm7OBKK6zBchX3l8+lZ1BmVH+fLYxHG/0+q7lO1Ks1NNhGK7JJO8TJ+y84TWKF41Wnews8sZePWO27jAhFxx5Zj3lxvmwlXMNVagy/uLgC+0DM2Q5oq8mlhJJEnK9016rbMHA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(66556008)(66446008)(66476007)(66946007)(6916009)(64756008)(122000001)(15650500001)(2906002)(54906003)(8936002)(36756003)(4326008)(8676002)(6512007)(38070700009)(86362001)(76116006)(5660300002)(33656002)(38100700002)(83380400001)(2616005)(71200400001)(6486002)(6506007)(41300700001)(478600001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <69E8FA110D5B054795E5DD3CCD97F649@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9399
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d49f4b2a-4797-4d5b-0d01-08dc22324cb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jyXrX1pW6s/hz4X2l+WHMb/ShSEPeKJt97P25As1ozTxIJGg5HzWQLRgIGMI0Ni/uPAYyd+2cBTIgPk5kh/cY+hcIzYdv6ZU0FQNmjdUDyfjxAHJgYp3d4jfkMfjWpJAdTYTBgIerJSR1L6ViT6Rg5Ibmyg/eO1eKw6FBj02RiPIFhidlT9ECbwp2s8G8O+tJvHixedYyDOgLcjRL6XjYqaWjDIJ6nuNVpm/OltdFWlOGr+cmhrwVYCnpSU/N1p7DuDyugeQwY36pSPylcCd4CAkIhXRcprp33QtALGPLqpG1IRqxCsUA9Aau0JV2150G7ib8Rxtmbsd24Pq9OF7WHNhrRYk+dNNM4uOPgtszhBKynBvHfcQnyivdDBayeuKnMRr6E36vC8Q87ediICW3N9v/TuQXb8Ih0Sv0hQFebSN1DuiRiRIxNCi06+4J4s6DdtX7QX2asM9sANx07IjNKB0gtB11B+D2asqcaggo1NoiDl+ZakPmN7ZW9u/67JM5xZxWlHfoK3xhrpUVY1sW4XCD9JNehwnAjFpxnE/chItaA2fH3u8oIHeh21Pz9rTxdl9Q3B4mfMVAyr6I/y6h9ALLFqib5qFPe+PswkUaUM9YG315P1w2duTPB+0RXjZfX3AaZbgtfbZOLPxzP/EomOBAyqyC9zPvTW+Uf8MEie3/lGMq4U9gYfQaAJMJy999Lg0k+iIhw033o+RsIfa5qIJ8Mj10UAgNwh2IXJ7P9/4/2xi6LbuaFNwzpd/VY3p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(40470700004)(46966006)(36840700001)(336012)(107886003)(26005)(2616005)(40460700003)(40480700001)(41300700001)(36860700001)(316002)(36756003)(54906003)(478600001)(6512007)(6506007)(53546011)(83380400001)(6486002)(47076005)(356005)(82740400003)(81166007)(8936002)(5660300002)(33656002)(15650500001)(2906002)(70206006)(70586007)(86362001)(4326008)(8676002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 07:58:05.1610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 323e06da-7aaa-472a-9e6d-08dc22325b1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10502

Hi Julien,

Nice finding :-)

> On 30 Jan 2024, at 18:29, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Recent rework to the secondary boot code modified how init_ttbr and
> smp_up_cpu are accessed. Rather than directly accessing them, we
> are using a pointer to them.
>=20
> The helper clean_dcache() is expected to take the variable in parameter
> and then clean its content. As we now pass a pointer to the variable,
> we will clean the area storing the address rather than the content itself=
.
>=20
> Switch to use clean_dcache_va_range() to avoid casting the pointer.
>=20
> Fixes: a5ed59e62c6f ("arm/mmu: Move init_ttbr to a new section .data.idma=
p")
> Fixes: 9a5114074b04 ("arm/smpboot: Move smp_up_cpu to a new section .data=
.idmap)
>=20
> Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/mmu/smpboot.c | 2 +-
> xen/arch/arm/smpboot.c     | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index bc91fdfe3331..4ffc8254a44b 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -88,7 +88,7 @@ static void set_init_ttbr(lpae_t *root)
>      * init_ttbr will be accessed with the MMU off, so ensure the update
>      * is visible by cleaning the cache.
>      */
> -    clean_dcache(ptr);
> +    clean_dcache_va_range(ptr, sizeof(uint64_t));
>=20
>     unmap_domain_page(ptr);
> }
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 119bfa3160ad..a84e706d77da 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -449,7 +449,7 @@ static void set_smp_up_cpu(unsigned long mpidr)
>      * smp_up_cpu will be accessed with the MMU off, so ensure the update
>      * is visible by cleaning the cache.
>      */
> -    clean_dcache(ptr);
> +    clean_dcache_va_range(ptr, sizeof(unsigned long));
>=20
>     unmap_domain_page(ptr);
>=20
> --=20
> 2.40.1
>=20


