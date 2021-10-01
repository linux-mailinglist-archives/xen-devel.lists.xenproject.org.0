Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05241EF29
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 16:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200648.355190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJDj-0006Kf-N4; Fri, 01 Oct 2021 14:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200648.355190; Fri, 01 Oct 2021 14:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJDj-0006IT-Jc; Fri, 01 Oct 2021 14:09:03 +0000
Received: by outflank-mailman (input) for mailman id 200648;
 Fri, 01 Oct 2021 14:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCz3=OV=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mWJDi-0006IN-Bk
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 14:09:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e57c8f1f-8b47-475f-a27e-32ed10c33dfe;
 Fri, 01 Oct 2021 14:09:00 +0000 (UTC)
Received: from DB6PR07CA0013.eurprd07.prod.outlook.com (2603:10a6:6:2d::23) by
 AM7PR08MB5318.eurprd08.prod.outlook.com (2603:10a6:20b:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 14:08:57 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::52) by DB6PR07CA0013.outlook.office365.com
 (2603:10a6:6:2d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Fri, 1 Oct 2021 14:08:57 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 14:08:57 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Fri, 01 Oct 2021 14:08:55 +0000
Received: from b273526e1d15.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A1060D8-A6D0-4CD9-B123-5C7C4CA110AD.1; 
 Fri, 01 Oct 2021 14:08:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b273526e1d15.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Oct 2021 14:08:38 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6672.eurprd08.prod.outlook.com (2603:10a6:102:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 14:08:33 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Fri, 1 Oct 2021
 14:08:32 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Fri, 1 Oct 2021 14:08:32 +0000
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
X-Inumbo-ID: e57c8f1f-8b47-475f-a27e-32ed10c33dfe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W0V/lf165q/NgEj5qNLR9RyPxMNVprhjpZD5BqeGoU=;
 b=4xYVFu/YsGcnsFT63CZ1xoZ1G0lSNYzuauYn+S1/GbEV2JhpZGc1yn3lfh2l4jfdt22z9wqliPZ5GOxJewpht1TLy09vSSO8fUAaX2xmuQuQ8jIyBeGlAkdTmi3VMDJhvWKXHXbAJn2cqb83KvhOGvjOQQ9IkBDVJbpcVy/QsUs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61ab3b9f47b3317d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1AKCzhm7ACNSwCHKB8Q6RNunfF/RBawi39gnIRVMtlKGjVczsE/9P3TyDU8mYFX9FlYJLWhp1ylpf2/wVK2+KJHyRSUJH4SamXIVHdp12KSyCj9l+/lUdGymSFidqAO+QOta2cerXnVJK3BTMu0r9m/T6DNu61eLNeE5oL/DjS/1NJx+F6zS0ZXpvnPf62VqtmxPxXDRuJ2QdFA7X8i7alJk0FeUz5sTyXR/7WG56R16iZaJ9q2hylYdOe0+Xn3uhTCSJYWsF2IBv6uD7Msrl4ihyKYEOL7wiWdgrQSuyA1cooqjF284+7CIQIBo95oLf7AMPY7sW+lazQrCqe7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W0V/lf165q/NgEj5qNLR9RyPxMNVprhjpZD5BqeGoU=;
 b=el17IGTIJ5nSZZcDUrbGYP8IGye56QjNwq9fQI/V2ZIo2Cp3m5mv01vum2X8fSfKIPbiydfrOa7rHmW/HxdR0FhBdZij9Rj1n6GjoLe5StewPYxPkDGz0JETa42JiYtzFgYOZ5YEkLOaYmTxIwUeBsdDAKvrRDV3OWE0iRrn0mPb3n66pfhxukEFj8djMkWci4+XedYLF3pEwueJhu4QzQuSGB3WwbePd2O/1bH4OtpB7Z0EPd5rIpGqD0j0jWVJoncHmKswP/MhuYP4obIN31gSPSroifXX/c1DjD/uiaC86qK0CgpX8olO+YNWuNqlYcG5FpKeyebykhEbFk5X5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W0V/lf165q/NgEj5qNLR9RyPxMNVprhjpZD5BqeGoU=;
 b=4xYVFu/YsGcnsFT63CZ1xoZ1G0lSNYzuauYn+S1/GbEV2JhpZGc1yn3lfh2l4jfdt22z9wqliPZ5GOxJewpht1TLy09vSSO8fUAaX2xmuQuQ8jIyBeGlAkdTmi3VMDJhvWKXHXbAJn2cqb83KvhOGvjOQQ9IkBDVJbpcVy/QsUs=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v4 3/3] arm/efi: load dom0 modules from DT using UEFI
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <21f9af33-0d09-fb2e-95fa-f4c5796671ca@suse.com>
Date: Fri, 1 Oct 2021 15:08:26 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <29BFC7F8-5173-4395-952C-FFF0E1F4C9FB@arm.com>
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-4-luca.fancellu@arm.com>
 <21f9af33-0d09-fb2e-95fa-f4c5796671ca@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bac63946-cbea-45fa-67e7-08d984e50278
X-MS-TrafficTypeDiagnostic: PAXPR08MB6672:|AM7PR08MB5318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB5318B3FFA65A845B9F991CADE4AB9@AM7PR08MB5318.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IPcJv74lL2a2BTkwwiHgHPSs9r++E2r6xJeUF8QWqQJzCqH8DmtpnNZ0i0QFn15DR4aAWz47lxd9dGWkap+vTvexuHrpoAi6UaTt/mlugW7ImxrLM2DVspAvBH5q/hQQlJvj3Z6ScmECTY5zj4eHZeglBZmf/Jdk4KU/TGzFcm2DVFyMNyfZ+qqLM8p+kHUyp6AoKBletaEkPkvJ7H9rPyOAbr++7llffUX9CJzpDIhNg7bnbYivY/0rR93cztBmPe46BeKtddYQrDET/jfQhM0/jFWDPLh8qlWX0vI41mb7G54hZanc9i6/jFqIpHrPpAb5k3kOh9EAq1m9ximuwp1oo0VaPJhTCsZ7x4JX3ned4sCGk/lnmFJVMUibtsmZDSz15fzUTWVC2LtE/LYxXlUsRMhb37Q4DnOVYJqTdaO0V+4TNCS4UHH1T6v7YEBQd24l15hOrY9A33nErPOkUf1Y9Kf/x2nlt0pHuDg6QxibijWjm0zHRhfjmHOxeuNq5+1sOowyNMzGtyJ0B72DwvYM/suXbDO6LzVruF/utvgFmkK+Ux6Qo7Clt9mE9vBgZ9JLtaUb8gwo9IdJgzWL/MSJmsXI3Jd+w0lX1o1mSmYtHRzjI1M75nXiM/08JOWk07dejZ9cScURc/YT3cf0SG0POfIi7gstCAK1DcHYfP6UQlXjJx0Fd/8weE7bhxcFzH4tSn3uc4Ad7/OGowlhNnx/p+Q0+DtkRGVue9GINCo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6486002)(8676002)(6506007)(33656002)(8936002)(53546011)(186003)(54906003)(6916009)(66476007)(508600001)(2616005)(956004)(26005)(83380400001)(5660300002)(38100700002)(44832011)(36756003)(38350700002)(6512007)(2906002)(6666004)(66946007)(66556008)(52116002)(86362001)(4326008)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6672
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c6b1035-211f-4591-e96f-08d984e4f3c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kE5cteSDJ5oYoz+OzQ9OWVrZ3tTTtsy92Lf7H4is1CeeTT8W46S3tn+/qCChnv/D5oFPY8N+8q1rqeCMldGJ7suiBnTSlSYWZZMACrhR1FACYzIUYBvcOLdDIB+GhDkk+YKFeLQGx6zAfe/NYfZ/wai+5LWxq//bPHaFbh+d2Ju6j27keuLJSehvaacfWOgI1iE0LDHiMUADRz7uJ2GsCHem644pWNxbxCwUfLFKa11vwGoRkDZTTrlZMnzyhZUGErqhDSEihpejt7LtaqtOJEHL36QoZltO4X7FzW/Ub0shEuP4uYaxwYVFQ8+V0rjIbKZbG3Cq2nIA9JFwxLOloxXg6D3bnEZ6AXC54GlCJkxE+I+VG5UvUpjTlGVqLeG3OywbrHnJz+1/uuRLJAe1rJj4VJMdKbvB6q7fkHwRqcA1qgq41FbwqwUGI79hoQSJVMdsKh1wgyz3UHwuD7hWKe4HbIC3mFnnbG6JEdWsQB5T8Y4n6+YRWuudX380jiHCoWUfzBNrRR3MPxC+N3vezXK73j5AE8cmYLoSrLzstqA0c+0MVycsFmRFoUDcl+0w0JmoCYDiumgHhA+lhsU1KBXT8JnTvHlcdwys9VOiJuCMqUu+9Ym7C3pDjN5QenJWHCqq4HC+g6VpNsUaAd8PfydxTDiOXOgK49E1hSXXskUvR1YBhmoc6X3uwglzTyJwP6oBnInNSR4PtfFHC3EU+A==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(33656002)(316002)(26005)(47076005)(36756003)(36860700001)(83380400001)(81166007)(82310400003)(44832011)(54906003)(6506007)(53546011)(6512007)(6666004)(70206006)(2616005)(4326008)(508600001)(186003)(336012)(70586007)(5660300002)(8676002)(86362001)(6862004)(356005)(956004)(6486002)(2906002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 14:08:57.3388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bac63946-cbea-45fa-67e7-08d984e50278
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5318



> On 1 Oct 2021, at 12:16, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 30.09.2021 16:28, Luca Fancellu wrote:
>> Add support to load Dom0 boot modules from
>> the device tree using the xen,uefi-binary property.
>>=20
>> Update documentation about that.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
> despite ...
>=20
>> @@ -1385,6 +1380,17 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>     if ( !dt_modules_found && !kernel.addr )
>>         blexit(L"No Dom0 kernel image specified.");
>>=20
>> +    /*
>> +     * The Dom0 kernel can be loaded from the configuration file or by =
the
>> +     * device tree through the efi_arch_check_dt_boot function, in this=
 stage
>> +     * verify it.
>> +     */
>> +    if ( kernel.addr &&
>=20
> ... me still being a little unhappy with the inconsistent use of the
> union fields so close together: This one is now consistent with the
> one visible further up in context, but ...
>=20
>> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,> +   =
                                        (void **)&shim_lock)) &&
>> +         (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D E=
FI_SUCCESS )
>=20
> ... is now inconsistent with this use. But yeah - read_file() is
> even worse in that sense, except that there the different uses are
> for specific reasons, while here the only requirement is to satisfy
> shim_lock->Verify().
>=20
> Please feel free to retain my ack in case you decide to use .ptr in
> all three places.

Hi Jan,

Sure I will do the modification you suggested, I will fix also my silly mis=
take that
Stefano pointed out.

Just to be sure, I explain what I will do:

In the second patch I will change:

    if ( !dt_modules_found && !kernel.addr )

To=20

    if ( !dt_modules_found && !kernel.ptr )


And in this patch I will use:

if ( kernel.ptr &&
         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
                                           (void **)&shim_lock)) &&
         (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D EFI_S=
UCCESS )
        PrintErrMesg(L"Dom0 kernel image could not be verified", status);

Do you agree on them? Can I retain your ack to this patch doing these chang=
es?

Cheers,
Luca

>=20
> Jan
>=20


