Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A677DD66
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584221.914702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWCvp-0006od-E4; Wed, 16 Aug 2023 09:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584221.914702; Wed, 16 Aug 2023 09:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWCvp-0006nP-B8; Wed, 16 Aug 2023 09:35:13 +0000
Received: by outflank-mailman (input) for mailman id 584221;
 Wed, 16 Aug 2023 09:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qWCvn-0006nH-9G
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:35:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fa4fb90-3c18-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 11:35:08 +0200 (CEST)
Received: from AS9PR06CA0757.eurprd06.prod.outlook.com (2603:10a6:20b:484::10)
 by PAXPR08MB6334.eurprd08.prod.outlook.com (2603:10a6:102:dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:34:59 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::c7) by AS9PR06CA0757.outlook.office365.com
 (2603:10a6:20b:484::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Wed, 16 Aug 2023 09:34:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 09:34:59 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Wed, 16 Aug 2023 09:34:58 +0000
Received: from 325fca70a136.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB0A31BD-B78C-4E28-8DDE-436833DA8C13.1; 
 Wed, 16 Aug 2023 09:34:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 325fca70a136.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 09:34:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8349.eurprd08.prod.outlook.com (2603:10a6:20b:56d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:34:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:34:49 +0000
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
X-Inumbo-ID: 2fa4fb90-3c18-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzuT38+yuIW3x27SI+HFVXSTAs35+ba5y8jc7qsKL8Y=;
 b=Lqz6Ra9OhtFh4DwXy0e0GhHYBOgxtLXjRC3irVLULOtrKeRX3utkkZ7EsEMShBE0tqk4e7kAtOafSYRE6xFBWcts+oBb4DJGbyR+peHB+Yy19QEF02USMRBcJpLHIcRe3tedLs9hY/JyyEc3TkzQelh/OTA8bMhGblFDy+nOyXM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60ddcd3194079d6b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2yI9iQpluYJU63aM46URgdhZ6KuCN0mHO7LaPWfNqC1NkY0XH4LJx+/QsmYJwXiQe8A9bj6b5tecojW8Z3/lW56TJT4Nw+VgplnelN1Pmefkl022lTIqCt9qvPK1MMeLInenHRTcivJfcfCBK+kzvOh9kL7EJJ9+9tLxEC+SzMmXp7F9ks4OWAdcSMcB/WqHHNXsBUHvRY13uucM0jUx9QbokYUilRbvUMKU0zKOG6BqPTlgovNsJuAtSiiRmGrI4QxKnNQptsp+NwKR/nnvYY6R+Go+Jzrb5LOjluW3VOFm62u0sSEXMCTFC2VuKvI4EJpnjpexdN/nCA+yUbYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzuT38+yuIW3x27SI+HFVXSTAs35+ba5y8jc7qsKL8Y=;
 b=PHoChnfYprnDvLYwkx13rBNQZDn9zSaDndWaWE0TJ9LSx9YQ8bN3Nhan412DJUyI9PoposDgofjjkYqa5AX0uSObeQnyiNZFr17ZbTmPkVqT0neTt7agdUc1Q4SzVRK23dx8Ns6T/a8uNjAwdGA9UHihE/99jkXwhP9jKmwSaknn9ZNeyxqP5xCPQKAJwhRufPsknGxDgTInIaD+PnyGfnMZ//IHz5oRheFmWEFwlgUOCmcmAkVhYs8ZIPfOfw4UyLkrGWlEVuoYufl2qz/sY50tjKUxqPhuZPJVgEFpsWc7SZJqVf22nnpD2v+A41yp97K90NPuals8XdKO2rb0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzuT38+yuIW3x27SI+HFVXSTAs35+ba5y8jc7qsKL8Y=;
 b=Lqz6Ra9OhtFh4DwXy0e0GhHYBOgxtLXjRC3irVLULOtrKeRX3utkkZ7EsEMShBE0tqk4e7kAtOafSYRE6xFBWcts+oBb4DJGbyR+peHB+Yy19QEF02USMRBcJpLHIcRe3tedLs9hY/JyyEc3TkzQelh/OTA8bMhGblFDy+nOyXM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v11 01/14] xen/arm: ffa: add direct request support
Thread-Topic: [XEN PATCH v11 01/14] xen/arm: ffa: add direct request support
Thread-Index: AQHZw6i+Dio5bTi0dkerq65BnI+x2K/swm2A
Date: Wed, 16 Aug 2023 09:34:49 +0000
Message-ID: <A141EDA2-1526-4F6F-9FD7-5BD4507051A1@arm.com>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-2-jens.wiklander@linaro.org>
In-Reply-To: <20230731121536.934239-2-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8349:EE_|AM7EUR03FT010:EE_|PAXPR08MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: e584d5f6-1b95-4250-14cd-08db9e3c0f0d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LEMwBZZGKBk6/YuamoQJThDK/aEK+JbKxRDAkN1a7sEeBDLDayNgfKFFGWxBs8EYy6lcoQX7MfQr2+JMNv+0bSOHZSsuyjFkIAMK5g6tIXdoIs+oc18ibcn8J0ApuWmPDWHI+95o/WGXzeAkCAI8heCJ/Wl5ZJNu3AQi6ytE9mVAJMdsI+XVyajcnUJIyMVNEcuE2e5Rjr0GEIo0Y27lK3ma8uY4BHokrRF811nor79T6aTB/7l/mgAH1bns+2X/9fNSn83fiIwT9ztdmEZtCPJUehLnYRenBia5UTMtnbRUb3vFXjkgOWU4ibptTk+/gg+k3X/6lHrEg9mwwU31CHm9w9k7JTf8BM7hidBWyknKOXc8GuocY0PBa8XnuP7RNrJGeL/NuSwnvtGIglOmVCsVXjcHWDZ+EhTZGFOtbNR6z4RaEb6RN6ce8fYT+2LseijBMJ2q7AdXUwVH+DWpM20HSQn3sCs9eeIRAG0n3MeoyxptpeoAMA0J2N5KFBUjx2Eia+JyHCfLcGLx1qHwnq5MRCzy0S6nsYVs7KRlHkZA0IBxJTu01yKVUPQChSYgpC8iOdQ2/AZzL9uTvqp+/W2bL8QAX30nF7lrPmSuudm2A3F3a2J5PJJgxwE77xAbG6tsOsn6ndfx7ciWgNRypg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(86362001)(478600001)(36756003)(2616005)(6486002)(6506007)(71200400001)(33656002)(6512007)(53546011)(5660300002)(41300700001)(122000001)(6916009)(316002)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(4326008)(8676002)(8936002)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9637F20A6E5F6A458D6F79ED1E9B1AA0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8349
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d0cbdec-e821-43c9-c4eb-08db9e3c0932
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kam2x/oVK/tlssIoW6IW++7qx4AooLDoxfBaupBcRTMS00D+7+rkEMMiUAAW6ERN+LFUV43qBT/lVTqunfRyYKwIBKXT4ZaoHGZobP349hEXlA6R1dlJB8DGb5Vi9TMwO/b3fZPp6/NdLLJVL871jCmVGu7LJUcRzAla6Wt0QSGDdBhFUZQTh8bkY+Ngcw8yv0+XRyhCWh3gEonjSKgXkG4VaMgaDheLV7+yaleka+F1rJmf2CA1NDFDHur4hsfcWUi5CA5IFrdtJTi3bzDZeyGs65VMV5hlIZvqdKeT+tq8RLrLj+9ZUwLZm0TRkhCyDbJ4ZGonyyKvPikIKwhBabiYY9C+dIl/gmQ9uI94v6NRGTrSywlrDtOA4peRqzE2gkOJ7i+KWTVLBYr5mEdHU3gpsWrJNfll0NSMad6uhDEX2fGc45CF4qhQSKzY2dFmPzwvAmLyLXefhcZYCj77xqNy3A8a1xQpreIhgAQFjVBEDehkjFDxGig9hw4FgjhrmSOc3ygEXs2RnqH6NFD9P1xywbqJ31boApO2P9Jgm5bMX8t9aNq+cJc2nsV4AUj2Kiz1VmOrtfdgzPTTff8VcnHwFjHnBEO9prrcyKiMrlf3iKt/+kwg7h5+bzSqzgQW53ojtA2L/t3qhfwtep+Eeg5BLuVJjqjyeVuIm7jtfvlESmAOkV5B9xHGi8ic65R2GJXa3qjktDtjPfh6Bgafky5gBlo2vvpYqtIL6n0wkAL9kFHyrG2L7SuSATPNQYbd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(1800799009)(451199024)(82310400011)(186009)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(83380400001)(86362001)(478600001)(40480700001)(336012)(36756003)(2616005)(6486002)(6506007)(33656002)(6512007)(53546011)(26005)(5660300002)(41300700001)(36860700001)(82740400003)(316002)(54906003)(356005)(81166007)(70206006)(70586007)(4326008)(6862004)(8676002)(8936002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:34:59.0017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e584d5f6-1b95-4250-14cd-08db9e3c0f0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6334

Hi Jens,

> On 31 Jul 2023, at 14:15, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support for sending a FF-A direct request. Checks that the SP also
> supports handling a 32-bit direct request. 64-bit direct requests are
> not used by the mediator itself so there is not need to check for that.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v10->v11
> - In handle_msg_send_direct_req(), replaced the "arg" with "resp" at the
>  default: label in the switch statement.
> ---
> xen/arch/arm/tee/ffa.c | 113 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 113 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index e157ed20ad8b..961a8c052f59 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
>     return true;
> }
>=20
> +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> +{
> +    switch ( resp->a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp->a2 )
> +            return resp->a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +        return FFA_RET_OK;
> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a=
2,
> +                               register_t a3, register_t a4)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D fid,
> +        .a1 =3D a1,
> +        .a2 =3D a2,
> +        .a3 =3D a3,
> +        .a4 =3D a4,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    return get_ffa_ret_code(&resp);
> +}
> +
> +static int32_t ffa_features(uint32_t id)
> +{
> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> +}
> +
> +static bool check_mandatory_feature(uint32_t id)
> +{
> +    int32_t ret =3D ffa_features(id);
> +
> +    if ( ret )
> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error =
%d\n",
> +               id, ret);
> +
> +    return !ret;
> +}
> +
> static uint16_t get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> @@ -222,6 +272,57 @@ static void handle_version(struct cpu_user_regs *reg=
s)
>     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> }
>=20
> +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint3=
2_t fid)
> +{
> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> +    struct arm_smccc_1_2_regs resp =3D { };
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst;
> +    uint64_t mask;
> +
> +    if ( smccc_is_conv_64(fid) )
> +        mask =3D GENMASK_ULL(63, 0);
> +    else
> +        mask =3D GENMASK_ULL(31, 0);
> +
> +    src_dst =3D get_user_reg(regs, 1);
> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    arg.a1 =3D src_dst;
> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    switch ( resp.a0 )
> +    {
> +    case FFA_ERROR:
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +    case FFA_MSG_SEND_DIRECT_RESP_32:
> +    case FFA_MSG_SEND_DIRECT_RESP_64:
> +        break;
> +    default:
> +        /* Bad fid, report back to the caller. */
> +        memset(&resp, 0, sizeof(resp));
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a1 =3D src_dst;
> +        resp.a2 =3D FFA_RET_ABORTED;
> +    }
> +
> +out:
> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & ma=
sk,
> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & m=
ask);
> +}
> +
> static bool ffa_handle_call(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D get_user_reg(regs, 0);
> @@ -239,6 +340,10 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>     case FFA_ID_GET:
>         set_regs_success(regs, get_vm_id(d), 0);
>         return true;
> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> +        handle_msg_send_direct_req(regs, fid);
> +        return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -331,6 +436,14 @@ static bool ffa_probe(void)
>     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>            major_vers, minor_vers);
>=20
> +    /*
> +     * At the moment domains must support the same features used by Xen.
> +     * TODO: Rework the code to allow domain to use a subset of the
> +     * features supported.
> +     */
> +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> +        return false;
> +
>     ffa_version =3D vers;
>=20
>     return true;
> --=20
> 2.34.1
>=20


