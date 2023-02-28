Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC16A5992
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 13:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503348.775590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzY1-000056-9g; Tue, 28 Feb 2023 12:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503348.775590; Tue, 28 Feb 2023 12:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzY1-0008UU-6n; Tue, 28 Feb 2023 12:57:37 +0000
Received: by outflank-mailman (input) for mailman id 503348;
 Tue, 28 Feb 2023 12:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nVN0=6Y=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pWzXz-0008UO-OY
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 12:57:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78893f93-b767-11ed-9694-2f268f93b82a;
 Tue, 28 Feb 2023 13:57:35 +0100 (CET)
Received: from DB6PR0601CA0048.eurprd06.prod.outlook.com (2603:10a6:4:17::34)
 by GV2PR08MB9423.eurprd08.prod.outlook.com (2603:10a6:150:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 12:57:32 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::15) by DB6PR0601CA0048.outlook.office365.com
 (2603:10a6:4:17::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30 via Frontend
 Transport; Tue, 28 Feb 2023 12:57:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.17 via Frontend Transport; Tue, 28 Feb 2023 12:57:31 +0000
Received: ("Tessian outbound b29c0599cbc9:v135");
 Tue, 28 Feb 2023 12:57:31 +0000
Received: from f1e808978662.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF432D7E-C6FC-4D63-BD90-AF9847918E53.1; 
 Tue, 28 Feb 2023 12:57:24 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1e808978662.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Feb 2023 12:57:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5684.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 12:57:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 12:57:21 +0000
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
X-Inumbo-ID: 78893f93-b767-11ed-9694-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzsDT6n6OBEenB1hhMvUVY+Y5fvDRTwBhH2fvsNQME0=;
 b=gWndlW01Wnif5FFGcB3hIjHaOOU/wVGTjMq5ruOEn138iwb7Vvda4LEAOfMSe5uyEt9pSnX9Zz1rPm+BeuQ/pb7xFzyfKbsx2x79B3D3huIv0r7ybppgSR/WkOV0qiEg+dj4Rghnd0zq73qlpufvD+nDjcFx1naEaHo/jV3nM44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b294b88b84848db
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTWcum98rMsLxIEeoCFzG3rMvutifIl5RIa2eb5RBbEuHiXnwvi7pZyHzfMiz8at7uj+ttZ+7bz3ivFZ/1+FR59N6jGaDSaxa1Yj1OD/3L+hmhGg/IbF5jjOmyrqlox4yd69sKxFEom3OfWdPlYvbXYDAcTIa7d36IPb3CStvmuGAcXCpblnIJJF0zGy3bya3KY3JL+x66jWxGErIppWZABk/LE6xF+2RIatLnUIMCdG+uhk9+ZJ86c8SZmQgaE0wNkhWv3O7zqlTIQjdyjMMB4PFhDz5yv926PsUwawl/S7aj15Jkl1Qx6xpkqrEo9iJS7i4RSUFsQKRYF3+lHFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzsDT6n6OBEenB1hhMvUVY+Y5fvDRTwBhH2fvsNQME0=;
 b=PIk6awVkLG6eojf94vmuCYKlLNM4De2G9xSMK0k3PbUBv9zqeiR0zPTJCdDpi0MpF6CiYwddGZyKF16P03bPuyM6Q9OImOCR0O0QC0VEqFzRW/Pm+s1o3v5CH2mRFVdsdAWbk/BNAHEF1hZMmY0xpQjRhcNxFyFV1UKFSCM+G6OJfTWh3LQ2PH65Cs3UrckYdo6ho6FEIEgdGjgi3CW9/S9kDsVF5qI9zRLWa9P8F7JiZCknyhhCoo11eK18FU6KJLiWHmjNL1VWeo2fQY/z9IqYokUmW91O/NNZLng5xcjfy8gtgWeRhJ9mvAQQL5dkxmGpZqdhXzQzcUBFgLISfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzsDT6n6OBEenB1hhMvUVY+Y5fvDRTwBhH2fvsNQME0=;
 b=gWndlW01Wnif5FFGcB3hIjHaOOU/wVGTjMq5ruOEn138iwb7Vvda4LEAOfMSe5uyEt9pSnX9Zz1rPm+BeuQ/pb7xFzyfKbsx2x79B3D3huIv0r7ybppgSR/WkOV0qiEg+dj4Rghnd0zq73qlpufvD+nDjcFx1naEaHo/jV3nM44=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 11/20] xen/arm: ffa: map SPMC rx/tx buffers
Thread-Topic: [XEN PATCH v7 11/20] xen/arm: ffa: map SPMC rx/tx buffers
Thread-Index: AQHZRtMejEsJsgt3902OVIzV3uFpCq7kWrAA
Date: Tue, 28 Feb 2023 12:57:20 +0000
Message-ID: <CD0E4A9B-4E07-42AB-A40B-41A9FD98C1F2@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <c553f850d76f4c31f5ce464f39bcb010722b9f99.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <c553f850d76f4c31f5ce464f39bcb010722b9f99.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB5684:EE_|DBAEUR03FT053:EE_|GV2PR08MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5e1670-5fd8-430c-6bf2-08db198b5ac2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MhpePjLEcEY0F2m1kK0qccJD8ZyX41lHbGxidMaIfOksuoyC1h4sKeFgjCNPNj8vP6JuLTgP84YH5w6fxWacMOSPA8V4hPCGg578XiOOyj/XR+BeMOSVoR/Uy4lDuSa6mrt1Y3gRDnfp7f6EdfnT3+l02wBPZaxzY0QgSfT/h0TM47DvKqen846a4kUwVcPhYfZVluli4Pam+S8rLEdjUY5bQNgsiSv4GB5NnQRf5ViqwfexuTC+pupaYiiYuiMvo7EdChG3sEO8BXCZJtHc4SC1nHtMpz/h/zI/lcElx1sJ5n8V2HC7fhGdo9qezMfOU4QMkWh+nlCpTyjqYG1uO033/o37VcMDwpGFO9dhuzvJkWjMWIEPQIp3GTOQxqeFVNXCjynOTo/bc62cIRZw4V+iDfWLq0f2AH2altoNkcdIP48k22ebN6pxDe1vKA3ZB9FYU0SmhWMyHzGSrO70V8QejBQ8+rp+ikFyRNqSZpIToF2Rbz3CGxfbLFpH8iwJrdyYKLytbd0uCph/1YNe6msKi4Gx//cWRpYkLMnEN7vdGOFGxFmzphv7QKdcAt4mEPcBwx0kA4bta3fkAY1UcHRuiLN1Qleeblyv9yMCQb2goxs/KyA/sicGAQkRxq0KKL3bcezGw90oolwe5DfQUY24a0IsP4N7jCPx/q92Nmxd0y9FtWmCug62Vf1YsjC+beMsRrJkFh20btEyYL3uzvZLkG3W4oCzlYY33hJwXB0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199018)(2616005)(36756003)(53546011)(186003)(26005)(122000001)(38100700002)(8936002)(41300700001)(91956017)(83380400001)(4326008)(66556008)(66476007)(66446008)(64756008)(86362001)(66946007)(6916009)(5660300002)(8676002)(76116006)(478600001)(38070700005)(316002)(33656002)(54906003)(6486002)(2906002)(6506007)(6512007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C59E53666FFA6449889AB9BCB70EAE48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5684
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8a0f77c-ebaa-4845-30ee-08db198b5461
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0NrPb/HSFxzOh8HcgE9xcswVxBM/IQa6gnPNduhfMBvDnNyKyExe0izJNwa0uRa87rf57HWB2IglAzvmZInEtQpmBekr57tgCHI0KfJl8DGeaRYjTFiEPAsXc2B1eqaB5xKtLVFhHGrTVi7+YUPTZUsW75rBWy5WQaHRaV+D/gXvwdVQxBcXnDWF6OGA6vGHgr3nKX/KWCfC9JRqZCM+gtV9UA6E2vgr2RwEGUqY//A/oEwS9VvoqmKMzA+qK/V2QcXXCo/An0sbFjh9nL9x9gOU5VI5QSI0ewNICqY0kniQPHMeNbA9DUkLBNscFahgI0uMi84O0gaP/aEmiLfoOGX9lf4kYDyzChHiZ++EAYuQa1Pk0OcGuYR9wk8bIe+GNLvY0T9uzDm4/dO2Zxvpff4/MT72sAsgGosZCo1xYZ8DKTAvGHmx26YVaT236Xnhx9vBs2rC2J7deY19iR69Pso3Vn8lj+iZK3hiXq1/J/PDHlpzy41xByUNDU662xWehxBYkcrcaUzRGN4K7i/lFAlQp7ALXC+EyUdsKij8/sGl4ZsI6NntIPZRSykteIuaVgsse7nLvOUSKMU85Vm48ddPT24+Afz00xbeR9ihXUh/ozRGLz6VnhemjFK/VgiTJdIdkdY87nAh74Po02SjeuGKEv9F0PZkvOdVwYxuyy8vPhUKnl40xVYp3enQ2fcvAYAZkic91RaPdfC1MZVLlg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199018)(46966006)(40470700004)(36840700001)(36756003)(86362001)(33656002)(40480700001)(70206006)(8676002)(5660300002)(4326008)(41300700001)(8936002)(6862004)(2906002)(356005)(82740400003)(81166007)(36860700001)(6486002)(478600001)(54906003)(316002)(70586007)(82310400005)(186003)(83380400001)(47076005)(2616005)(40460700003)(6512007)(336012)(26005)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 12:57:31.6740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5e1670-5fd8-430c-6bf2-08db198b5ac2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9423

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> When initializing the FF-A mediator map the RX and TX buffers shared with
> the SPMC.
>=20
> These buffer are later used to to transmit data that cannot be passed in
> registers only.
>=20
> Adds a check that the SP supports the needed FF-A features
> FFA_RXTX_MAP_64 / FFA_RXTX_MAP_32 and FFA_RXTX_UNMAP. In 64-bit mode we
> must use FFA_RXTX_MAP_64 since registers are used to transmit the
> physical addresses of the RX/TX buffers.

Right now, FFA on 32bit would only work correctly if LPAE is not used and o=
nly addresses
under 4G are used by Xen and by guests as addresses are transferred through=
 a single register.

I think that we need for now to only enable FFA support on 64bit as the lim=
itations we=20
would need to enforce on 32bit are complex and the use case for FFA on 32bi=
t platforms
is not that obvious now.

>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 57 +++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 56 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index a5d8a12635b6..07dd5c36d54b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -148,6 +148,15 @@ struct ffa_ctx {
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t ffa_version __ro_after_init;
>=20
> +/*
> + * Our rx/tx buffers shared with the SPMC.
> + *
> + * ffa_page_count is the number of pages used in each of these buffers.
> + */
> +static void *ffa_rx __read_mostly;
> +static void *ffa_tx __read_mostly;
> +static unsigned int ffa_page_count __read_mostly;
> +
> static bool ffa_get_version(uint32_t *vers)
> {
>     const struct arm_smccc_1_2_regs arg =3D {
> @@ -217,6 +226,17 @@ static bool check_mandatory_feature(uint32_t id)
>     return !ret;
> }
>=20
> +static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> +                            uint32_t page_count)

Using register_t type here is doing an implicit cast when called and on
32bit this might later remove part of the address.
This function must take paddr_t as parameters.

> +{
> +    uint32_t fid =3D FFA_RXTX_MAP_32;
> +
> +    if ( IS_ENABLED(CONFIG_ARM_64) )
> +        fid =3D FFA_RXTX_MAP_64;
> +
> +    return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);

simple call might not be suitable on 32bits due to the conversion.
As said earlier, it would make more sense to disable FFA on 32bit and
put some comments/build_bug_on in the code in places where there
would be something to fix.

> +}
> +
> static uint16_t get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> @@ -384,6 +404,7 @@ static int ffa_relinquish_resources(struct domain *d)
> static bool ffa_probe(void)
> {
>     uint32_t vers;
> +    int e;
>     unsigned int major_vers;
>     unsigned int minor_vers;
>=20
> @@ -426,12 +447,46 @@ static bool ffa_probe(void)
>     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>            major_vers, minor_vers);
>=20
> -    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> +    if (
> +#ifdef CONFIG_ARM_64
> +         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> +#endif
> +#ifdef CONFIG_ARM_32
> +         !check_mandatory_feature(FFA_RXTX_MAP_32) ||
> +#endif
> +         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> +         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>         return false;
>=20
> +    ffa_rx =3D alloc_xenheap_pages(0, 0);
> +    if ( !ffa_rx )
> +        return false;
> +
> +    ffa_tx =3D alloc_xenheap_pages(0, 0);
> +    if ( !ffa_tx )
> +        goto err_free_ffa_rx;
> +
> +    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
> +        goto err_free_ffa_tx;
> +    }
> +    ffa_page_count =3D 1;

ffa_page_count is a constant here and is not used to do the allocation or
passed as parameter to ffa_rxtx_map.

Do you expect this value to be modified ? how ?

Please set it first and use it for allocation and as parameter to rxtx_map =
so
that a modification of the value would only have to be done in one place.

Please use a define if this is a constant.

As it is a global variable, does the parameter to rxtx_map make sense ?

Cheers
Bertrand

>     ffa_version =3D vers;
>=20
>     return true;
> +
> +err_free_ffa_tx:
> +    free_xenheap_pages(ffa_tx, 0);
> +    ffa_tx =3D NULL;
> +err_free_ffa_rx:
> +    free_xenheap_pages(ffa_rx, 0);
> +    ffa_rx =3D NULL;
> +    ffa_page_count =3D 0;
> +    ffa_version =3D 0;
> +
> +    return false;
> }
>=20
> static const struct tee_mediator_ops ffa_ops =3D
> --=20
> 2.34.1
>=20


