Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0284D9AE7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 13:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290766.493237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU622-0001wR-AI; Tue, 15 Mar 2022 12:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290766.493237; Tue, 15 Mar 2022 12:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU622-0001ts-6j; Tue, 15 Mar 2022 12:12:06 +0000
Received: by outflank-mailman (input) for mailman id 290766;
 Tue, 15 Mar 2022 12:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG/1=T2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nU620-0001tm-Iy
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 12:12:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ccd7e27-a459-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 13:12:01 +0100 (CET)
Received: from AS9PR06CA0090.eurprd06.prod.outlook.com (2603:10a6:20b:464::7)
 by PAXPR08MB7383.eurprd08.prod.outlook.com (2603:10a6:102:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23; Tue, 15 Mar
 2022 12:11:50 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::ad) by AS9PR06CA0090.outlook.office365.com
 (2603:10a6:20b:464::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25 via Frontend
 Transport; Tue, 15 Mar 2022 12:11:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 12:11:49 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Tue, 15 Mar 2022 12:11:49 +0000
Received: from 4baf0c564e4f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CCFA2197-1772-4002-B036-DDF0526C972D.1; 
 Tue, 15 Mar 2022 12:11:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4baf0c564e4f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Mar 2022 12:11:37 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 by AM5PR0801MB1859.eurprd08.prod.outlook.com (2603:10a6:203:49::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Tue, 15 Mar
 2022 12:11:36 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74]) by VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74%5]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 12:11:36 +0000
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
X-Inumbo-ID: 1ccd7e27-a459-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVAmjpd1CCzL+Vp50+ccT1pWv7M3Arh/X4BNW9B9INQ=;
 b=ElTiB3/wm48wnNjVYEtlJS86BvrdIEJiD9mveV5OqZIzvo/tAcl7A1MSgP/bOgStj7AI36RSjeBOrL1a0o862dhAKs0chgRKz3+4f1D83cKrzsw54XNkdDW+OWKQVaYna0uWyBzoBqMq2lJf2D7U6b079RwEZdacZ3Tt2kRTtsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48ae17a974f51e96
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtUonbrhGejQco+4M1MWMGeg6RiecHgeuP0SpJeciYifmRQ7CrExzBjsLABzVaO3BvGhRsqGPLoH7VUh2678fGLCQPbZLe1WVFQ0vG8nPya7Sv+9If53/DXDd4tWgFqkAfGMndQfE8pFNp5hsZfOwl78W3cCz0Vj1JPB/SO0k0Ycc/j4ySlkQc0j7FRUICcHcw/baKKfHejBjHHGG7T1j3071gEtF+EY+bDDN/619Mx6n0aFBtlTvUhJbUG1ySrk+mu6qnm6TA3B3ys/LIWDb5zP2XFvS1xCTUUMZD2rDxmlE8LG8EYzfr59AlfrDigQ9Fp4uyOvU5CpCP30PwIZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVAmjpd1CCzL+Vp50+ccT1pWv7M3Arh/X4BNW9B9INQ=;
 b=ckpGAo2phJBxAXlAoNppq58KWhalCTDoIS6GeVJIR2jR+IMOvZgbl64z5xdj5qe2NwpuUYzN0pKBCbAYLSnZk2+ycv9dX3XWVVsJx/E45etljzMLbQGd7HZrn2Tn1IJRT4pP0H7NARFTBzKf8CnBJ6K0v3HqqWj5D3sCnwpZX4gDlZqrynSEatNdh8InBpbv/xLTTcvbood/TdtIAeq/z+40eSplZATPysu5dgpSntTD89k6eQdazl/N8vbz1kL9hpFYyrBxLnWeTteb5lFAonYKS9DaUso1ayr2Rj7v6f4VUgZcSd2tC8h08UNS2ovbLJ8qoi396OoQuyMFmA7xOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVAmjpd1CCzL+Vp50+ccT1pWv7M3Arh/X4BNW9B9INQ=;
 b=ElTiB3/wm48wnNjVYEtlJS86BvrdIEJiD9mveV5OqZIzvo/tAcl7A1MSgP/bOgStj7AI36RSjeBOrL1a0o862dhAKs0chgRKz3+4f1D83cKrzsw54XNkdDW+OWKQVaYna0uWyBzoBqMq2lJf2D7U6b079RwEZdacZ3Tt2kRTtsk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [XEN][RFC PATCH v3 14/14] tools/xl: Add new xl command overlay
 for device tree overlay support
Thread-Topic: [XEN][RFC PATCH v3 14/14] tools/xl: Add new xl command overlay
 for device tree overlay support
Thread-Index: AQHYMyV7Tz8Y/V6GBEKWpNuLuSXXYKzAZVaA
Date: Tue, 15 Mar 2022 12:11:35 +0000
Message-ID: <C65BA40D-E35D-403A-A544-18A9EE80D3AD@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-15-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-15-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d1e89e8e-beb1-4b05-6ce2-08da067cfbe2
x-ms-traffictypediagnostic:
	AM5PR0801MB1859:EE_|VE1EUR03FT052:EE_|PAXPR08MB7383:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB73839D56DF365EA43E35617BE4109@PAXPR08MB7383.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8bLZlwa9e5dCCclcZ//eEASdimFu/PIAcFLXHMfiTus1os8w49NG1DBsNbVQfwObQUIsP8krYAp/imEZC0MHW+ls9+boCY81MVc/UlWZpPMA+KUuffDyVqRD9uB55gItgBBxih1/QFB6aItsxTL+eHdG0cVAjQRtpRVPsvjlxRXU0Y1CBWoV2uQV1WFgdMP+F+yf6AZtvM9Le5q+CiTmH9uzwdxjW3ZoN9uE9YoZeqn3Ev/1+zAQn5CoFIJ7wDuatw4s24gukoKQy5ooZm6KALwwGtciohbpnN0+Qh53062PEjc+o+9BzrlayKk7btnxBs2MWy6ePaohBDE/va8dAX5R9hlc2r19H7c1YBb9eSgj7QKDutvbIY8hF3mNZIbkQ7arIYm+hJ0GWYjYf4V/Qk4EKvBvSjNHwv+GA3MZDFq01DOv+Gd/WwmcisbNMdb0usPQl8f2/SUauIT5CqcW2i5xiRNVjBDU8/MQCv9wDFv9rO7g7FsGtMG2rwSRX2s8rQsde4oZCHigMXfD2uT5NzH2L1yJO7pZcJJ1D9gNFroYI7H460DACF6Vn2xOdNLMVd2o73aopVqOLjN2EhMlb8oMDk4iDVb0A1mcTUfu4RotXNJOCFnKPwEjerc35AKjhcS0h4T9R6p7hTiY6Vq7DvmZAQbVks/PVc3oeBgQeUE0tNSIiiiwAbiKp+Y/t6Kz79UJ2fO+5U17UEMNJWs58V8x5BZxR/BpxhSgMpmxjTC1kCHJE+gAvbehykos2uT6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38100700002)(6486002)(86362001)(91956017)(53546011)(122000001)(54906003)(6916009)(8936002)(83380400001)(76116006)(8676002)(6512007)(64756008)(66446008)(66556008)(66476007)(66946007)(36756003)(508600001)(6506007)(2616005)(5660300002)(186003)(71200400001)(26005)(38070700005)(4326008)(2906002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9840A62848903D41AD99768E1BABBD5C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1859
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9b9ab8b-151b-4e6c-cde4-08da067cf3b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GBd5RvGwnqxculUGFPhHyv9OmYUvgBB6clUsa4M37eselRYF6/mRbw39ER4i1HjvWi/5JFj9dJSgtpMm8theECnd3LK7TbkWXF7e2tlOlW/efxrhwPwJLvm3/FcLVHv2BJq0NIBgL3xHxdaQpAzHKIDZBl/u4/Zt7oyw010cl6OLEKhPy1AXwT9zrKzak2G59dCE1aFQzNFz6Lrk59bmHBejMQG4YBPmMom4USocGEZsFAsOkOmAHrRUZECkIeec3JM3NnKUMzMlQFjNhjG4theRfOUsIZ+vDMmYTPCkEZSOKKN7O57p7F1hvuu/Mg4YChreFYgkkdyhjZIax0iMAgAtBY7ISHW/qyq8wW9Ra6cdzDBW554sPc1eHZrQwfxefrwUAGbVyL7T0jrHMCnJPqwq0lO37ZBGwcbSvU+QgRee5zeRIQ5cRROHJnj9q/jxpM+VMs+jOlwreMjuskSWHCN0OGBI2uKnPs4uReceDvkWgHAuM3Gw/DiQRUbo8b9qN27CaGi+mHg2mslGDis30mf2p8gbhohRZfgr+r0FTOySxU78A0VVNmW5HgsNCrDADCWGLojZEBGs0ErVUdUCcmqSqT5z5isnxiHVJFkN9kAwqtu6lSwlulNApNk9v3ovDbSdrmh2VmZ30L0Gn2Iz/d6n7Ahw1Ta7Kbjodbg1S5MJtVa73r9kR82b0vB29KBk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(6862004)(8676002)(36756003)(2906002)(54906003)(70206006)(70586007)(4326008)(53546011)(33656002)(6486002)(6506007)(6512007)(5660300002)(8936002)(508600001)(356005)(336012)(26005)(81166007)(186003)(2616005)(47076005)(107886003)(83380400001)(86362001)(36860700001)(40460700003)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 12:11:49.6884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e89e8e-beb1-4b05-6ce2-08da067cfbe2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7383



> On 8 Mar 2022, at 19:47, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>=20
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
> tools/xl/xl.h           |  4 ++++
> tools/xl/xl_cmdtable.c  |  6 ++++++
> tools/xl/xl_vmcontrol.c | 45 +++++++++++++++++++++++++++++++++++++++++
> 3 files changed, 55 insertions(+)
>=20
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index c5c4bedbdd..604fd5bb94 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -97,6 +97,9 @@ struct save_file_header {
>=20
> #define SAVEFILE_BYTEORDER_VALUE ((uint32_t)0x01020304UL)
>=20
> +#define XL_DT_OVERLAY_ADD                   1
> +#define XL_DT_OVERLAY_REMOVE                2

Maybe you can get rid of them and ...

> +
> void save_domain_core_begin(uint32_t domid,
>                             int preserve_domid,
>                             const char *override_config_file,
> @@ -139,6 +142,7 @@ int main_shutdown(int argc, char **argv);
> int main_reboot(int argc, char **argv);
> int main_list(int argc, char **argv);
> int main_vm_list(int argc, char **argv);
> +int main_dt_overlay(int argc, char **argv);
> int main_create(int argc, char **argv);
> int main_config_update(int argc, char **argv);
> int main_button_press(int argc, char **argv);
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 661323d488..5812d19db8 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -20,6 +20,12 @@
> #include "xl.h"
>=20
> const struct cmd_spec cmd_table[] =3D {
> +    { "overlay",
> +      &main_dt_overlay, 1, 1,
> +      "Add/Remove a device tree overlay",
> +      "add/remove <.dtbo>"
> +      "-h print this help\n"
> +    },
>     { "create",
>       &main_create, 1, 1,
>       "Create a domain from config file <filename>",
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 435155a033..76b969dc33 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -1262,6 +1262,51 @@ int main_create(int argc, char **argv)
>     return 0;
> }
>=20
> +int main_dt_overlay(int argc, char **argv)
> +{
> +    const char *overlay_ops =3D argv[1];
> +    const char *overlay_config_file =3D argv[2];
> +    void *overlay_dtb =3D NULL;
> +    int rc;
> +    uint8_t op;
> +    int overlay_dtb_size =3D 0;
> +
> +    if (overlay_ops =3D=3D NULL) {
> +        fprintf(stderr, "No overlay operation mode provided\n");
> +        return ERROR_FAIL;
> +    }
> +
> +    if (strcmp(overlay_ops, "add") =3D=3D 0)
> +        op =3D XL_DT_OVERLAY_ADD;
> +    else if (strcmp(overlay_ops, "remove") =3D=3D 0)
> +        op =3D XL_DT_OVERLAY_REMOVE;

Use them there, maybe defining const int <name> =3D <value>

Since these values are only used there



