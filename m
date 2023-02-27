Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F76A460F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502731.774655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfQX-0007fX-7N; Mon, 27 Feb 2023 15:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502731.774655; Mon, 27 Feb 2023 15:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfQX-0007dV-4J; Mon, 27 Feb 2023 15:28:33 +0000
Received: by outflank-mailman (input) for mailman id 502731;
 Mon, 27 Feb 2023 15:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hUI=6X=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pWfQV-0007dP-AE
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:28:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 633f0975-b6b3-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 16:28:30 +0100 (CET)
Received: from DB7PR05CA0064.eurprd05.prod.outlook.com (2603:10a6:10:2e::41)
 by DB9PR08MB9515.eurprd08.prod.outlook.com (2603:10a6:10:453::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:28:28 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::e1) by DB7PR05CA0064.outlook.office365.com
 (2603:10a6:10:2e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 15:28:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.12 via Frontend Transport; Mon, 27 Feb 2023 15:28:27 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135");
 Mon, 27 Feb 2023 15:28:27 +0000
Received: from b90d4dd5a4bb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94692B98-C7EB-4501-B8AF-3A6FA2B0B16D.1; 
 Mon, 27 Feb 2023 15:28:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b90d4dd5a4bb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Feb 2023 15:28:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB10052.eurprd08.prod.outlook.com (2603:10a6:800:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 15:28:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:28:11 +0000
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
X-Inumbo-ID: 633f0975-b6b3-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taEqrWMYx0Z6ltSjrgtuw7LMOV9CfxxvRL41mw8DV9Q=;
 b=pD8BnwcBgxkNpUHc6m9gksfm9wbNAVd5f7SCSb3ERiAlfCj+FCXk2iO5R5CSCwHYqHOd9WSEsIbJXow5sc/coR43S6R8WK8QYpQ0o9ELWIXpAC2A0cQPzCDpYq6S7I/gnaIsxm3ACUgmSbLB/J7I1sM7iwVx3rCDW/oV310j220=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d9ea05c3a565df5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mieZk3pw7zZcEN1h8LBymmQGw7pT1Bw4RZwhBifbccMQ9ecxiDD9B/9xoHUv6jbT+g9IVwHZcBwq9GdLEZ+vhhROLzkisGpmwDtH6QwEbeNqZG5UZM8lReWeQ2osuhxMq0SWHljvLc8k4JWBhgvqQQtzfBrsanAcUSxCTU0cfQCmcFLsMxc8xFoRV761WJeYuUM9ma9zdJcZzKUFdbiCSEvwrO47HcOrRAEYPaDaDbOxwAOAdYF7i4qyeIC1+lz3vLNihe7xq4ynatA7Nbod8oiEqy7vUTydMnSe9D2Mrpr/f9hAxUxyKfOF6sCT0xWR7sYiCBmg2J72/8AcI6GxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taEqrWMYx0Z6ltSjrgtuw7LMOV9CfxxvRL41mw8DV9Q=;
 b=RdMJI9BmrXmrd4kk/zgkCmkciMn5RsMZN+8X0a+M1T9FCTEj8/WGNp6dgs1N69zpU3hNW7+ptYrk0Ntl1O0PiftzPBJfq02IaoytjmBI4u5cZplv+fFVRAPVUzRL1Cqvr6fkFWlTreSjQZTSO7cbaqvaqwnFiSy3F+1TNoevjrDatL/cE9Ytu5aEYFBykGvgqMCO+rQ3QCpRE8kotXHD0tOZWNiIqhkAHHxDvwFioh13hFrUv9DYogb/SwnAGPBkP3W47Fj97PsZCvj8Hr8ELpEWjKSyPVxz46h/W2gHTLjtx2jkpdMkRfEmydDxlNawrJNbFOA71QVGGCSBJIt68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taEqrWMYx0Z6ltSjrgtuw7LMOV9CfxxvRL41mw8DV9Q=;
 b=pD8BnwcBgxkNpUHc6m9gksfm9wbNAVd5f7SCSb3ERiAlfCj+FCXk2iO5R5CSCwHYqHOd9WSEsIbJXow5sc/coR43S6R8WK8QYpQ0o9ELWIXpAC2A0cQPzCDpYq6S7I/gnaIsxm3ACUgmSbLB/J7I1sM7iwVx3rCDW/oV310j220=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
Thread-Topic: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
Thread-Index: AQHZRtMbYfucWbm5fkaW7bEI3lX4ea7i8oGA
Date: Mon, 27 Feb 2023 15:28:11 +0000
Message-ID: <F22A4773-94E8-4F24-A5C8-BF4E075A7698@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <3332563e64568b2ffd236b1f428c27aa4cdf9790.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <3332563e64568b2ffd236b1f428c27aa4cdf9790.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VI1PR08MB10052:EE_|DBAEUR03FT031:EE_|DB9PR08MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe9b386-7f50-432e-9136-08db18d7463e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x68pHiqojGdvCLbhnwyxC5uZMbNQJFX6OltnGxdShE1CbdMdZhfBpqc/IYJ4O1JcgGXliV+SJth9kJiOBbyCND/gQE06GJyXwNIZxtuAC8QAcGpePSvytkxSkKdKCYy4XnEvlAYSQjnEdBpROqyPQtgTR5wSfzahth2jKBagLhaWnVKvieyXaPLovZ+DJLne5QYHFcLu9fhnt3faeNGaJwcmz+YnOAH6vmeXKmAGu63QDPgp0E7BPPkIqX67t9QceD1IoVLVcQAK5mYG5FbFN04yxb8h7KH3gUJgSotuO47iVjqQbgA85+ted7D3w94RGhKSlD4E8WsgtqjWJEGjZm60mQXaixM/T8YQDtzD617vBUGCWbFcvdFYKP/E1OQEE5uiaWbM9R2g8ZxHL15LpwSX71Fvd/yiFFBCftZuW94WY30Tp/uqT/jhe3aORAJ7fJZqI8AmBXD7BIDC5pwKPFbDTmuCDtpGZIbRGGrqqWmgrU+r9AnV7JFlL8knv0D+GRC38SYqT7EJFW9wwVVgVYRdwn4ZrIGWkh+LQWHInvwNQ7WXseOsFyLPME77nwS/++kSbzsiL1QaHio/7Cjo9SUCrHxQzN67JoTXwZIu3w/1bSmiGUqeD/TyAZWAosoWCes/ZQUQXf/lq1O9lkk/n3Wwch+HuCmfDeQie32MJgaj2zvdrh0xKuN+J4mOKlnlcP8Akhu6QrAjEJ32pP0c7ckr4YPZiYjX6lv3uKWvrjI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(451199018)(186003)(38100700002)(2906002)(122000001)(38070700005)(83380400001)(41300700001)(66946007)(6916009)(76116006)(8936002)(4326008)(8676002)(66556008)(6512007)(91956017)(66446008)(71200400001)(66476007)(2616005)(53546011)(478600001)(6506007)(64756008)(5660300002)(26005)(6486002)(33656002)(54906003)(86362001)(36756003)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5F0A54116FBDB34EBF9BD5CE47BAB3A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10052
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5041fbd7-d817-428b-eb3f-08db18d73c71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	92B9bEYv8wQA+bzeWppGGYoqpwQ5MVQCp9eqQovKdkO8TwmWcNUMsGEK6ak7eExNK5t4V0xC+8LC11qjcToQrClyRhvXpe5rsPiuhiyNi0tLTlket9XCFLl0O9R07K7pyELPWZeXr5f9ySoZVAO42mI9VxiRP6CDE5ic52IYll9kHtQqW6l95eMfYMKjse0Mgei4+XrYZeW6SWSkzmXpYn2fLmNRIXMOSzkjjvGvVRJSsqaGVUnlXgGoPamMHu1tKXq2FlU0OmsC8MPSYbTnWqh/tMbVxW4cNRSVufSMtJzWdFzERw5e5aSl/Sxylb/hLO7FuZoAvrCTKn3sCJficaC8fgB9li4mr2DpfNOFdfSLYnVhKJn1hwOPPyMFNeMWzLV0CDUNMzxoZjFpZQb4S1LJo4MRVw8aYZswWZmishtqAQJU3jKr4MCHb5NrdtDlNk2ITqwXLTFOtxiwn+TT3nSxlDRyjTygmiR3R1BzPTseK0ObmC+xy7bqmYg7YeZTSdRXgRO+Y9SyLlXowgQu/XOh+tjHlHRKcRzgkbl1g20Uv/RhMQXVk8L/SU/LWNaMb9t0K/dC/EOd94EWjNgILC5LO6DKBGWFwvLDCksqvbtBKTUpLy3ieGkHHFNbpcYdMV0Cvs34VrJsOy8spZ2S1VWnGZk0waCrJP2yPBHDJXwIjS+qjRqNuEpj0nNfND7jol6X8jZv61B4ubnOTFoNog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(36756003)(6862004)(8936002)(5660300002)(41300700001)(36860700001)(53546011)(6506007)(6512007)(82310400005)(82740400003)(81166007)(336012)(47076005)(83380400001)(186003)(26005)(2616005)(40480700001)(86362001)(4326008)(33656002)(54906003)(40460700003)(70206006)(70586007)(316002)(8676002)(478600001)(356005)(6486002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:28:27.8441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe9b386-7f50-432e-9136-08db18d7463e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9515

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support for sending a FF-A direct request. Checks that the SP also
> supports handling a 32-bit direct request. 64-bit direct requests are
> not used by the mediator itself so there is not need to check for that.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 119 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 119 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 463fd7730573..a5d8a12635b6 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -142,6 +142,7 @@
>=20
> struct ffa_ctx {
>     uint32_t guest_vers;
> +    bool interrupted;

This is added and set here for one special error code but is never used.
I would suggest to introduce this when there will be an action based on it.

> };
>=20
> /* Negotiated FF-A version to use with the SPMC */
> @@ -167,6 +168,55 @@ static bool ffa_get_version(uint32_t *vers)
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
> +    uint32_t ret =3D ffa_features(id);
> +
> +    if (ret)
> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", id)=
;

It might be useful here to actually print the error code.
Are we sure that all errors actually mean not supported ?

> +
> +    return !ret;
> +}
> +
> static uint16_t get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> @@ -208,6 +258,66 @@ static void handle_version(struct cpu_user_regs *reg=
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
> +    struct ffa_ctx *ctx =3D d->arch.tee;
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
> +    while ( true )
> +    {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +
> +        switch ( resp.a0 )
> +        {
> +        case FFA_INTERRUPT:
> +            ctx->interrupted =3D true;
> +            goto out;
> +        case FFA_ERROR:
> +        case FFA_SUCCESS_32:
> +        case FFA_SUCCESS_64:
> +        case FFA_MSG_SEND_DIRECT_RESP_32:
> +        case FFA_MSG_SEND_DIRECT_RESP_64:
> +            goto out;
> +        default:
> +            /* Bad fid, report back. */
> +            memset(&arg, 0, sizeof(arg));
> +            arg.a0 =3D FFA_ERROR;
> +            arg.a1 =3D src_dst;
> +            arg.a2 =3D FFA_RET_NOT_SUPPORTED;
> +            continue;

There is a potential infinite loop here and i do not understand
why this needs to be done.
Here if something is returning a value that you do not understand
you send back an ERROR to it. I do not find in the spec where this
is supposed to be done.
Can you explain a bit here ?

> +        }
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
> @@ -225,6 +335,12 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>     case FFA_ID_GET:
>         set_regs_success(regs, get_vm_id(d), 0);
>         return true;
> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> +#endif
> +        handle_msg_send_direct_req(regs, fid);
> +        return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -310,6 +426,9 @@ static bool ffa_probe(void)
>     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>            major_vers, minor_vers);
>=20
> +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> +        return false;

One could not need this feature and here this will make everything unavaila=
ble instead.
Why not just reporting back the unsupported error to clients using unsuppor=
ted interfaces ?

Cheers
Bertrand

> +
>     ffa_version =3D vers;
>=20
>     return true;
> --=20
> 2.34.1
>=20


