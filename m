Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7884574894C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559442.874427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5SZ-0005WW-MC; Wed, 05 Jul 2023 16:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559442.874427; Wed, 05 Jul 2023 16:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5SZ-0005To-JM; Wed, 05 Jul 2023 16:34:31 +0000
Received: by outflank-mailman (input) for mailman id 559442;
 Wed, 05 Jul 2023 16:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUcB=CX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qH5SY-0005Ti-Li
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:34:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce2fa6ff-1b51-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 18:34:27 +0200 (CEST)
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by GV1PR08MB8689.eurprd08.prod.outlook.com
 (2603:10a6:150:82::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 16:34:23 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::fa) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Wed, 5 Jul 2023 16:34:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 16:34:23 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Wed, 05 Jul 2023 16:34:23 +0000
Received: from 3762e53d0410.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4111EE69-1B58-49B4-B6BB-9D099061A873.1; 
 Wed, 05 Jul 2023 16:34:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3762e53d0410.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 16:34:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9804.eurprd08.prod.outlook.com (2603:10a6:10:45f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 16:34:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 16:34:14 +0000
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
X-Inumbo-ID: ce2fa6ff-1b51-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6DZn+acH4T7vQpD2hCMzs9pM95ym7skUiR8tWqfbaU=;
 b=QkP7ZMpdFy+9cP5JVXocl77gdRYOI9aMVZTjaaLHiKC4NhrY/T+ef/F0jWpwWBfzxaBdevOQZso+1ijRvBPThPaYOROQfHjlOujuc1POQBtxuYeeTRhhnuYHS4Db/piPDzex6otMwbr3KKRkDVLqi7lrNyGTf4WBMdyPFF9Fvzs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7f094d9fdea62c1e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Huvhd64kMHxuPrzbHUhH0qpGiL1EW1ZEwABaE79BdkxHKaeSbSWlF59Auwdt0Ir2+TplbMDHfUNIZCZxpkUasooPe821nG1og6HzqmDveyHJQ37dzG4IRgiAVj0pMnsrUhn6PMavE2CjL68NEa8YGjpDuuxj/GsTIY9imozw1vAx1KtfrN2vxczZ7Jpl/bOm2jxGfG1hMRQDadqC4bPJnxrtybVnwWRl/5xTZK6ho1Z0A3iOww9uxGN+FdehhP3fQNkxRbVIhLOcCLezExSrTtUiBepYmcdPDpj5PRS4d3jDbAJuLkfTQxxomm2WuMix7w2u/1RyGnzOSjSjSMH3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6DZn+acH4T7vQpD2hCMzs9pM95ym7skUiR8tWqfbaU=;
 b=f+pOJhm4/8Uh4+TzrQOgtZ+dsuvFwXeJlfj6QCmqVrWjlvxixTseo07R6SAmulDy/2IEhtcnNKMTbwswr1jntrLCpa1Uvv67OaJmUyjiNWKrR/e2a9YXgg3dO0Qc9jo6QRAGxpomMVL9/MFgC3FNFrucyez5FpNiwVoZrGQS6NPAFkO8GKEbpt62+UgLMhNGjOg6twwQCfW+PGAJMRkFD1QN2nVcZ+yxgyo4yWlKsjiSc7B+BCk4hhmFYfFGg9Z8KUBHaznTa7IzerSZAqkwAiqZcCBDbtMnXrEe/rHQLvd+G6tIV5LzMAGyT6LJbHHK51A2GHybm+GxL6wUbVJcfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6DZn+acH4T7vQpD2hCMzs9pM95ym7skUiR8tWqfbaU=;
 b=QkP7ZMpdFy+9cP5JVXocl77gdRYOI9aMVZTjaaLHiKC4NhrY/T+ef/F0jWpwWBfzxaBdevOQZso+1ijRvBPThPaYOROQfHjlOujuc1POQBtxuYeeTRhhnuYHS4Db/piPDzex6otMwbr3KKRkDVLqi7lrNyGTf4WBMdyPFF9Fvzs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 06/13] xen/efi: fix violations of MISRA C:2012 Rule
 7.2
Thread-Topic: [XEN PATCH v2 06/13] xen/efi: fix violations of MISRA C:2012
 Rule 7.2
Thread-Index: AQHZr1VIs7cSnKcK+EWsrhmpc3alsa+rXlmA
Date: Wed, 5 Jul 2023 16:34:14 +0000
Message-ID: <810E4A64-F51D-474B-995A-11CEF9AB2C85@arm.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9a791b84be74d7ca575eb94e070aae7294d95bbf.1688559115.git.gianluca.luparini@bugseng.com>
In-Reply-To:
 <9a791b84be74d7ca575eb94e070aae7294d95bbf.1688559115.git.gianluca.luparini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9804:EE_|DBAEUR03FT013:EE_|GV1PR08MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 76291f55-358e-494c-eaae-08db7d75b0b1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dWEuN7Up+BTo4Bg7ygJav+lfdk8zVQk1itm2ve0GVTTs++4dAdcTiB6e2TIviWmDXEpEUdw/ytpMD79rftVVXPrT70/Fa47zFzes96q4Grgi4LVcD+E55HbuiDaoSK7mMAflK3Ew0z+e68Tv0ctVndIIhkgmOXrSd1Bx6d3BwP9rOrBFN9zUZrL1TWdA97GQmTfYr44bzBZRe51bfhCNK3zcCVPGJce5BddW+URueTvFiHgXdumdguYQyVtjGSlXdu+qNgT9UCdsnCBKQFJ4OLeVpeW2M4JHqj8DdJBIFlOsAYPjffWpuRHeKrgziANFDhajoAz/97opJDX/87xt7yZBhtZdNc/tw6ASpj6HOR+ZyFI8yv/C7wO2B7T/euBXJvRrlnZMUbRRtD9U+ptfqsx2DvUiFSeBTjfexDSmFuVEfvud43N7EvAIdQO1eSy2IcyLLo0fO1Sf6Y+kMbGvArZJork8i9zO1+uRbI2B3kg074TbY0vbi9RkdS2xvA6lADBfeUx1n1i1eRhvIFBRyWYoXvT3fdzTFvZ/KHB3U1G9RG3l++MiwY1x2j52yPBmvRuELl0aB4eJoQ/FD0Vd1ZPnOznxRDunFWYffeD0XdhERy38FuzY+KwYdkb2aNTtRVnQaaBOBkzRwClCI201wQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(8676002)(36756003)(8936002)(53546011)(5660300002)(2616005)(86362001)(83380400001)(38100700002)(38070700005)(122000001)(41300700001)(91956017)(66556008)(76116006)(66476007)(6916009)(64756008)(66446008)(4326008)(316002)(66946007)(54906003)(33656002)(6512007)(186003)(478600001)(6506007)(26005)(71200400001)(6486002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <24CFDD4E3B28454A881F87DCA7A1FAB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9804
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	24168de0-ba45-433e-aea4-08db7d75ab6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SPqXMfZHpHm1QRKJE4ep7Q3jpflmIThm21TXUVjagUdk8nf+8moX5DnrCQpPFhXemGn0CV5Rc/90+a6LcUnMjdM5foDBcIWmDacdAqz6Co6opehz4lKNyVDUwyPSGMtU3h2bV7b6hn9sXlvvMoHomY8Jg81vNqMa76kbgQgYEtgUgO8gf6AFpp1BtFar6YgeCdguVtkQ7EpOyrZpA/d/GA0ZjFiLMnxCR8LrSCRtaDTvRvYZCmKSAnJwNKxGilHPNqQFXZ6hWOx7NDNCEmKMwcIvyG3klzWEY1pq6rsN9FnHxTlYbFzY3LZy6iwYQdfH6hmMeuofCpE9S7a5fOvDWhkpng3+3uvd4lsVAsTiP9Fr+oVZmDP3oFpnlHIfYNsClaER6t5UrtIQVEfsjlzV5qJmM0LviRJK6Vr0J505EfMn+TBLje1fAalJ0HoZznetDrw22niOgFNXJcPQSDYMH1LOxae/gZ56QaYNz0nTBKnEnf6DNLVBortH8QoEQ2l5GgW9cM58sV5S5Jn+0UD0RFd2bIyMF4hcRt8syc/DNc3KqQqvzcXj/vTMd732WGRo7I7igFw6dJXuJIDeG2lV0+BD5ITEcJZDIxOpDTt+csRoG5H8YXQSkuSACk0snwB67DKVXXAexWWppxOqtH1KmTdQ6VEQ1TUYNzcTlw2RnFRWh7S0/hfm0GNtS0Iw18yZzCqlZmK933RXMSuTRUkOHxnpIppIKvQfPIUiz77gLMbQPo7iTr7bb0u0Bxk4ujMQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(26005)(6506007)(478600001)(82740400003)(6512007)(86362001)(2616005)(186003)(6486002)(54906003)(53546011)(4326008)(81166007)(70586007)(36860700001)(336012)(356005)(83380400001)(70206006)(316002)(47076005)(8676002)(6862004)(8936002)(40460700003)(41300700001)(2906002)(40480700001)(5660300002)(33656002)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 16:34:23.1840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76291f55-358e-494c-eaae-08db7d75b0b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8689



> On 5 Jul 2023, at 16:26, Simone Ballarin <simone.ballarin@bugseng.com> wr=
ote:
>=20
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>=20
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
>=20
> Add the 'U' suffix to integers literals with unsigned type and also to ot=
her
> literals used in the same contexts or near violations, when their positiv=
e
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
>=20
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Changes looks good to me, probably Jan knows better this part

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> Changes in v2:
> - minor change to commit title
> - change commit message
> - remove changes in 'efibind.h', 'efiapi.h', 'efidef.h' and 'efiprot.h'
> ---
> xen/common/efi/boot.c    | 8 ++++----
> xen/common/efi/runtime.c | 2 +-
> 2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index c5850c26af..28a57fe434 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -34,13 +34,13 @@
> #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
>=20
> #define SMBIOS3_TABLE_GUID \
> -  { 0xf2fd1544, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe=
3, 0x94} }
> +  { 0xf2fd1544U, 0x9794U, 0x4a2cU, {0x99U, 0x2eU, 0xe5U, 0xbbU, 0xcfU, 0=
x20U, 0xe3U, 0x94U} }
> #define SHIM_LOCK_PROTOCOL_GUID \
> -  { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8=
b, 0x23} }
> +  { 0x605dab50U, 0xe046U, 0x4300U, {0xabU, 0xb6U, 0x3dU, 0xd8U, 0x10U, 0=
xddU, 0x8bU, 0x23U} }
> #define APPLE_PROPERTIES_PROTOCOL_GUID \
> -  { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x=
3a, 0xe0} }
> +  { 0x91bd12feU, 0xf6c3U, 0x44fbU, { 0xa5U, 0xb7U, 0x51U, 0x22U, 0xabU, =
0x30U, 0x3aU, 0xe0U} }
> #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> -  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x2=
1, 0x80} }
> +  { 0xb122a263U, 0x3661U, 0x4f68U, {0x99U, 0x29U, 0x78U, 0xf8U, 0xb0U, 0=
xd6U, 0x21U, 0x80U} }
> #define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1
>=20
> typedef struct {
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 13b0975866..5cb7504c96 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -698,7 +698,7 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *o=
p)
> #ifndef COMPAT
>     op->status =3D status;
> #else
> -    op->status =3D (status & 0x3fffffff) | ((status >> 32) & 0xc0000000)=
;
> +    op->status =3D (status & 0x3fffffffU) | ((status >> 32) & 0xc0000000=
U);
> #endif
>=20
>     return rc;
> --=20
> 2.41.0
>=20
>=20


