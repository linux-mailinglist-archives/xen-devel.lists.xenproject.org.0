Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C801A4B8440
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273841.469123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGck-0003B5-DW; Wed, 16 Feb 2022 09:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273841.469123; Wed, 16 Feb 2022 09:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGck-00038V-A8; Wed, 16 Feb 2022 09:29:22 +0000
Received: by outflank-mailman (input) for mailman id 273841;
 Wed, 16 Feb 2022 09:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXi8=S7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nKGci-00038J-5r
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:29:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eae009f2-8f0a-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 10:29:19 +0100 (CET)
Received: from AM5PR0601CA0038.eurprd06.prod.outlook.com
 (2603:10a6:203:68::24) by AM6PR08MB3991.eurprd08.prod.outlook.com
 (2603:10a6:20b:a8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 09:29:16 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::6d) by AM5PR0601CA0038.outlook.office365.com
 (2603:10a6:203:68::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Wed, 16 Feb 2022 09:29:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 09:29:14 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Wed, 16 Feb 2022 09:29:14 +0000
Received: from 47de483b1682.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9F54DA6-1FEA-4409-8D0E-7C64C5B76903.1; 
 Wed, 16 Feb 2022 09:29:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47de483b1682.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 09:29:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM4PR08MB2754.eurprd08.prod.outlook.com (2603:10a6:205:e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 09:29:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 09:29:05 +0000
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
X-Inumbo-ID: eae009f2-8f0a-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/83OOk9cZSV+Xozs8gMrc20TUYybIpGLhJIs50cxDIo=;
 b=17xQ3RhQ4iGyvqXweJXAm4PIM0zhFtIbaApDpSdErQq9ncMl5gpCDTB4TyH1bKpt1bOR0W6Fp/OGr7zHdvs5krVpz/oIL1ZG7z5BQUeSnvSM6UrfBnQTngdOaWEJrJUVCrnfKedyMo6dveKcLjNaM/UNiTQ2/0oHhDkBKDlIhGA=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9cab02b8da4d342
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBLWlYC7qJ7pDIo0a63aXt5oxvusQP20tQtlZS1KkP6DWh9rRPFvj4FtcOqrm9Ki4gyntIcYWMhnclkSW2J1C2VPxPcWfA+fgGWy29LiCIkGP9GImBl+QGGAX0kHEek+cpENGCHUUY+K4Cn8PsOyN4036reebIioZdjHrWYwfuMl0X7bvqI6gkV1bhxUAuS99SwRLb7WzIxmiJZVLUwspCUGikovB/8TeoOuh8ayPORlYk5GJ2DRHdEhxHa6Qd3YulgW9pTrFg+FBMDotG9Q28DjmObUol87uCEe6C0N/LRmWJPS1LAekS9zmK6a9DJvNppyWdzzIPumeKd9qreLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/83OOk9cZSV+Xozs8gMrc20TUYybIpGLhJIs50cxDIo=;
 b=doVqEuFHFrs9Y1p0lHqeO8avYf9MSiAEDXrrxyTZYuOH2yRak2tt2w57zJcpqzZ3EoFz93w0a+On9y9IbPBuua5CgDmuiXnJyjvK7mbvkBNEWjeSsjkgZKqTRbZF/MbFApJSIGjE1q4IIgMD1kvdLfLvAjUqVdAIWyA0W4NMdmD/wmAMplTJ9nl7wcDWtC3NJ3Ubho6jr5w42HO1RSJp2IYyHHM3RTpkXVRdX9Zmz8zgIqwyi/8cEDPDdPBp7mEHI8X6vOfnpMb3CJeX2pWvbn+Kxh4UvMZTVW/Sqi21KE6MQUygsZeqcMGhquG1J+RpWf5UuOVXNfbmI3JZiMpFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/83OOk9cZSV+Xozs8gMrc20TUYybIpGLhJIs50cxDIo=;
 b=17xQ3RhQ4iGyvqXweJXAm4PIM0zhFtIbaApDpSdErQq9ncMl5gpCDTB4TyH1bKpt1bOR0W6Fp/OGr7zHdvs5krVpz/oIL1ZG7z5BQUeSnvSM6UrfBnQTngdOaWEJrJUVCrnfKedyMo6dveKcLjNaM/UNiTQ2/0oHhDkBKDlIhGA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Topic: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Index: AQHYIaGnBAePJgt7y0O7PyvIWQlKrKyTBxsAgAKFHwCAAF/KgA==
Date: Wed, 16 Feb 2022 09:29:05 +0000
Message-ID: <24099D77-07E6-4110-B988-309C917D89F1@arm.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-3-andrew.cooper3@citrix.com>
 <70824a0c-cc48-b064-695c-35c2d06c0ad1@xen.org>
 <alpine.DEB.2.22.394.2202151800230.43738@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2202151800230.43738@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8076549e-bf8b-41d8-c791-08d9f12ecc5a
x-ms-traffictypediagnostic:
	AM4PR08MB2754:EE_|AM5EUR03FT058:EE_|AM6PR08MB3991:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3991B77005CE8807357736789D359@AM6PR08MB3991.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 80LNKtPtz2GI5DD4QEX+q7f0OOeynJkj2LLG1mNcRv0PlW4e84E6kAvdm8pQcXrSC8KV72fL56eMsS1ER1ggEdLg20zjVhWVqwdkD5NvApijJAik5dgc9ULr14I1JBcQ+9pgbrVkVzq9n4I2HZwONPODUoNt3Ntn5rNFONCOg8mbfSQLYsT6P0gsj6h861LNgOvbFENN6jcfpcALqziXnSvQnqlXzlSdu8L/oXOm4CuLTmtM5I6K8pai1bZhfbKylb5WUvnWjfgXi2cdKy/Pfya6ClTz2jWd7WDB4kjJkaLM+3bYn3/VGQH95u6XkG1dad3NnVVZkHB4Mmh9kfA15zjy8VrYUo69N+CQQmu70oUpVh1KIB/bhVMNeDeT4Z1+Dqn4u4EADWQdAF7OSGjlEwOFHjeWNUnWAOW879eRgEIiBDtSqqb+r6rBnzbU+2t0Ht9EV+71MTr4piA4nUp2UdUg9xbRauSOAunj/tYuvoB+MwYqfJ2Rm/zmM/QZDcivn7EIxnf1BrBTr6M7PXv6SuzFTtjESnWHuYNNkciiE+aCLjBZ2yV1HwqnfitZ2KRBkizwl9PCtXWb7SjlX9AI0jCA0SeJ8cqOeAMHfulA5C8kX72bmXG1JIAIdFa2KF6MYhejLsi9pO49y+C/NWH888pvQHPZv0iIBdFfSv5sNeJijnmi948lLyRu8zHnOwPRx5bA+tRmpQIGfDDef0efl/e8ZVSpW40j9uhPK6YOLJrRBtGJrt9qak30QgSaRUje
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(71200400001)(26005)(6512007)(53546011)(2616005)(91956017)(83380400001)(316002)(6506007)(36756003)(6486002)(64756008)(5660300002)(38070700005)(54906003)(6916009)(186003)(4326008)(38100700002)(122000001)(33656002)(66556008)(66446008)(2906002)(86362001)(66476007)(66946007)(76116006)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C2683ED7D01CB54A90517525831830C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2754
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b06eb978-76da-4480-b118-08d9f12ec707
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PH4Ed0DDv+QTohKGiApisrk3J467FC10YdG8vH6jrhtm+jYwO8vSKHytQ5NZKlrcq2USJWYm7s0rXQprmwtwkOvORoddjuWEpnIHLufTCgu++CldfEhLICyDaiPscBuqj5jq2M3PbBMxtu8XkPWHwPg14wlFC0EqIqlpLPF5pLkh0Z0H+BcGedHAG7ajohMrb8345r4j0rQmYs4NOgM1KEHe58xf2ig4SxAdmawrbUTWIaBEg5ip9ua/hhC63/vv6x2cRrzpkj8cpxgVIOr5HQnYt35RY1S5aQW8y9Z1LsbBOsQGKMDb/BGpV0lq7tJLmlzzjTxVb2AAanOKi0PguccdADhFfnBYmcf/v4kxRugc5BU2leGbiwMRfFYjZnSnaeH1JlAgVFr5p7OyG+QrdMW8Z12++gIG8BZcjh7k3r7yiaMvUCsLJpyO9jI7gvG5BOwwZTZlsBm35wgmD4qbjTbbxJtzPUsSeJB0cdu/PwsZV+fTfHMhkO8vSW+pCQzbd7njlZArY/A2+o+Xup0CqnG5ILJBgMLeteEh0/gXl0nk6WyzO5PwVIX15krZBS2/F6OgyI0T+U9LPTC9ohdxCPpxNdAUL9zFf+CAbL6+GyFtIinyT4flZzm0NQ3JTSI0rchKgQixh88wfy1LdPIsBLeHrghSkTxi01aj+Af+dStz14oHFUhPaW49ZzuZM55CwSM1Nslx8srIGBnqqbbvFQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6862004)(2616005)(8676002)(508600001)(4326008)(6512007)(53546011)(8936002)(33656002)(6486002)(36756003)(5660300002)(107886003)(6506007)(2906002)(54906003)(81166007)(316002)(47076005)(63370400001)(336012)(26005)(356005)(83380400001)(40460700003)(70586007)(86362001)(70206006)(63350400001)(82310400004)(36860700001)(186003)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:29:14.8145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8076549e-bf8b-41d8-c791-08d9f12ecc5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3991

Hi Stefano,

> On 16 Feb 2022, at 03:46, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 14 Feb 2022, Julien Grall wrote:
>> On 14/02/2022 12:50, Andrew Cooper wrote:
>>> There are exactly 3 callers of sort() in the hypervisor.  Callbacks in =
a
>>> tight
>>> loop like this are problematic for performance, especially with Spectre=
 v2
>>> protections, which is why extern inline is used commonly by libraries.
>>>=20
>>> Both ARM callers pass in NULL for the swap function, and while this mig=
ht
>>> seem
>>> like an attractive option at first, it causes generic_swap() to be used=
,
>>> which
>>> forced a byte-wise copy.  Provide real swap functions so the compiler c=
an
>>> optimise properly, which is very important for ARM downstreams where
>>> milliseconds until the system is up matters.
>>=20
>> Did you actually benchmark it? Both those lists will have < 128 elements=
 in
>> them. So I would be extremely surprised if you save more than a few hund=
reds
>> microseconds with this approach.
>>=20
>> So, my opinion on this approach hasn't changed. On v1, we discussed an
>> approach that would suit both Stefano and I. Jan seemed to confirm that =
would
>> also suit x86.
>=20
>=20
> This patch series has become 70 patches and for the sake of helping
> Andrew move forward in the quickest and most painless way possible, I
> append the following using generic_swap as static inline.
>=20
> Julien, Bertrand, is that acceptable to you?

Any reason why we cannot in this case keep the NULL parameter in the
existing code and do the if swap =3D=3D NULL handling in the sort code ?

Other then that this is acceptable for me but I will let Julien say if he i=
s
ok or not as I had no objections before.

Regards
Bertrand

>=20
> Andrew, I know this is not your favorite approach but you have quite a
> lot of changes to handle -- probably not worth focussing on one detail
> which is pretty minor?
>=20
>=20
> ---
> xen/sort: Switch to an extern inline implementation
>=20
> There are exactly 3 callers of sort() in the hypervisor.  Callbacks in a =
tight
> loop like this are problematic for performance, especially with Spectre v=
2
> protections, which is why extern inline is used commonly by libraries.
>=20
> Make generic_swap() a static inline and used it at the two ARM call
> sites.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> xen/arch/arm/bootfdt.c |  2 +-
> xen/arch/arm/io.c      |  2 +-
> xen/include/xen/sort.h | 67 ++++++++++++++++++++++++++++++++++-
> xen/lib/sort.c         | 80 ++----------------------------------------
> 4 files changed, 70 insertions(+), 81 deletions(-)
>=20
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index afaa0e249b..0d62945d56 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -472,7 +472,7 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t =
paddr)
>      * the banks sorted in ascending order. So sort them through.
>      */
>     sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank)=
,
> -         cmp_memory_node, NULL);
> +         cmp_memory_node, generic_swap);
>=20
>     early_print_info();
>=20
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..1f35aaeea6 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -170,7 +170,7 @@ void register_mmio_handler(struct domain *d,
>=20
>     /* Sort mmio handlers in ascending order based on base address */
>     sort(vmmio->handlers, vmmio->num_entries, sizeof(struct mmio_handler)=
,
> -         cmp_mmio_handler, NULL);
> +         cmp_mmio_handler, generic_swap);
>=20
>     write_unlock(&vmmio->lock);
> }
> diff --git a/xen/include/xen/sort.h b/xen/include/xen/sort.h
> index a403652948..f6065eda58 100644
> --- a/xen/include/xen/sort.h
> +++ b/xen/include/xen/sort.h
> @@ -3,8 +3,73 @@
>=20
> #include <xen/types.h>
>=20
> +extern gnu_inline
> +void generic_swap(void *a, void *b, size_t size)
> +{
> +    char t;
> +
> +    do {
> +        t =3D *(char *)a;
> +        *(char *)a++ =3D *(char *)b;
> +        *(char *)b++ =3D t;
> +    } while ( --size > 0 );
> +}
> +
> +/*
> + * sort - sort an array of elements
> + * @base: pointer to data to sort
> + * @num: number of elements
> + * @size: size of each element
> + * @cmp: pointer to comparison function
> + * @swap: pointer to swap function or NULL
> + *
> + * This function does a heapsort on the given array. You may provide a
> + * swap function optimized to your element type.
> + *
> + * Sorting time is O(n log n) both on average and worst-case. While
> + * qsort is about 20% faster on average, it suffers from exploitable
> + * O(n*n) worst-case behavior and extra memory requirements that make
> + * it less suitable for kernel use.
> + */
> +#ifndef SORT_IMPLEMENTATION
> +extern gnu_inline
> +#endif
> void sort(void *base, size_t num, size_t size,
>           int (*cmp)(const void *, const void *),
> -          void (*swap)(void *, void *, size_t));
> +          void (*swap)(void *, void *, size_t))
> +{
> +    /* pre-scale counters for performance */
> +    size_t i =3D (num / 2) * size, n =3D num * size, c, r;
> +
> +    /* heapify */
> +    while ( i > 0 )
> +    {
> +        for ( r =3D i -=3D size; r * 2 + size < n; r =3D c )
> +        {
> +            c =3D r * 2 + size;
> +            if ( (c < n - size) && (cmp(base + c, base + c + size) < 0) =
)
> +                c +=3D size;
> +            if ( cmp(base + r, base + c) >=3D 0 )
> +                break;
> +            swap(base + r, base + c, size);
> +        }
> +    }
> +
> +    /* sort */
> +    for ( i =3D n; i > 0; )
> +    {
> +        i -=3D size;
> +        swap(base, base + i, size);
> +        for ( r =3D 0; r * 2 + size < i; r =3D c )
> +        {
> +            c =3D r * 2 + size;
> +            if ( (c < i - size) && (cmp(base + c, base + c + size) < 0) =
)
> +                c +=3D size;
> +            if ( cmp(base + r, base + c) >=3D 0 )
> +                break;
> +            swap(base + r, base + c, size);
> +        }
> +    }
> +}
>=20
> #endif /* __XEN_SORT_H__ */
> diff --git a/xen/lib/sort.c b/xen/lib/sort.c
> index 35ce0d7abd..b7e78cc0e8 100644
> --- a/xen/lib/sort.c
> +++ b/xen/lib/sort.c
> @@ -4,81 +4,5 @@
>  * Jan 23 2005  Matt Mackall <mpm@selenic.com>
>  */
>=20
> -#include <xen/types.h>
> -
> -static void u32_swap(void *a, void *b, size_t size)
> -{
> -    uint32_t t =3D *(uint32_t *)a;
> -
> -    *(uint32_t *)a =3D *(uint32_t *)b;
> -    *(uint32_t *)b =3D t;
> -}
> -
> -static void generic_swap(void *a, void *b, size_t size)
> -{
> -    char t;
> -
> -    do {
> -        t =3D *(char *)a;
> -        *(char *)a++ =3D *(char *)b;
> -        *(char *)b++ =3D t;
> -    } while ( --size > 0 );
> -}
> -
> -/*
> - * sort - sort an array of elements
> - * @base: pointer to data to sort
> - * @num: number of elements
> - * @size: size of each element
> - * @cmp: pointer to comparison function
> - * @swap: pointer to swap function or NULL
> - *
> - * This function does a heapsort on the given array. You may provide a
> - * swap function optimized to your element type.
> - *
> - * Sorting time is O(n log n) both on average and worst-case. While
> - * qsort is about 20% faster on average, it suffers from exploitable
> - * O(n*n) worst-case behavior and extra memory requirements that make
> - * it less suitable for kernel use.
> - */
> -
> -void sort(void *base, size_t num, size_t size,
> -          int (*cmp)(const void *, const void *),
> -          void (*swap)(void *, void *, size_t size))
> -{
> -    /* pre-scale counters for performance */
> -    size_t i =3D (num / 2) * size, n =3D num * size, c, r;
> -
> -    if ( !swap )
> -        swap =3D (size =3D=3D 4 ? u32_swap : generic_swap);
> -
> -    /* heapify */
> -    while ( i > 0 )
> -    {
> -        for ( r =3D i -=3D size; r * 2 + size < n; r =3D c )
> -        {
> -            c =3D r * 2 + size;
> -            if ( (c < n - size) && (cmp(base + c, base + c + size) < 0) =
)
> -                c +=3D size;
> -            if ( cmp(base + r, base + c) >=3D 0 )
> -                break;
> -            swap(base + r, base + c, size);
> -        }
> -    }
> -
> -    /* sort */
> -    for ( i =3D n; i > 0; )
> -    {
> -        i -=3D size;
> -        swap(base, base + i, size);
> -        for ( r =3D 0; r * 2 + size < i; r =3D c )
> -        {
> -            c =3D r * 2 + size;
> -            if ( (c < i - size) && (cmp(base + c, base + c + size) < 0) =
)
> -                c +=3D size;
> -            if ( cmp(base + r, base + c) >=3D 0 )
> -                break;
> -            swap(base + r, base + c, size);
> -        }
> -    }
> -}
> +#define SORT_IMPLEMENTATION
> +#include <xen/sort.h>
> --=20
> 2.25.1
>=20


