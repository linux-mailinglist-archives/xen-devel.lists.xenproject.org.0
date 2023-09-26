Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEEC7AF6E9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 01:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608579.947159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlHl2-0003wn-Ho; Tue, 26 Sep 2023 23:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608579.947159; Tue, 26 Sep 2023 23:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlHl2-0003tg-Dr; Tue, 26 Sep 2023 23:46:24 +0000
Received: by outflank-mailman (input) for mailman id 608579;
 Tue, 26 Sep 2023 23:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQH+=FK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qlHl1-0003ta-8W
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 23:46:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e314c103-5cc6-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 01:46:18 +0200 (CEST)
Received: from DU6P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::14)
 by AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 23:46:13 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:53f:cafe::d9) by DU6P191CA0028.outlook.office365.com
 (2603:10a6:10:53f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Tue, 26 Sep 2023 23:46:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.20 via Frontend Transport; Tue, 26 Sep 2023 23:46:12 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Tue, 26 Sep 2023 23:46:12 +0000
Received: from a9e7520c0527.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 488BE0DE-AE7D-42E4-A68D-B8D2CA35AD7F.1; 
 Tue, 26 Sep 2023 23:46:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a9e7520c0527.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 23:46:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8780.eurprd08.prod.outlook.com (2603:10a6:20b:5bd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Tue, 26 Sep
 2023 23:46:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 23:46:01 +0000
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
X-Inumbo-ID: e314c103-5cc6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMSYJO6PoxD3e9bAeN7alCXFQT/glubxXsEzrrWQHgk=;
 b=73bg82mVSP5GcbA3PEm2i/J/VYVIPLHfIflOung4AYypj5D1HuUYJV6b6VtOX0wDxjxfutg1aPQ5kO3Tv9YUfoezxiuxeqYYk0rvg6NO8pIwN5OotYtQkRwWEE2POFFiaJswXHvyzX3FJTt8b5Ciiz7t2F727tzpwbo+tNAAPjw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b713097fb621ec03
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9fwnIfiKSA82HLTL0HTz+8Sk+jzReJIsbpL/1+itxqcXLiwhUmJ6PIHmUA2brGjUWZWqchdQpj35xK7AS1TuWxKbE0wL8cQfjc6rF1NPlRmwpwFo237kpGv99xVS/s4MWNx/LVNC3FviYeQbmeNlt9p6SF6IwMW8V6SeKTGsyDTs3LF/aLaf12BczceoNb+k4/DCJlloZt8ltNYCb2jg/ftSNMV0NQ5FR3cP/d0/Yp4dMLjMFWGg8vGcHVAAwODUdYPxAXad9ds7QAFp4IdLYBWnV+x7BUv2RZuUI4PbYU3d/JqrYlPVgmgIta41Dbo+TCuohgzx9cgpC2BwuyRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMSYJO6PoxD3e9bAeN7alCXFQT/glubxXsEzrrWQHgk=;
 b=fmfvDwgrT01KzPf2wGoXDX0bwHR6vk4iqrycoaVJ/SbEabUvi7l68jrb66I/K0/YOunZhXJZVEPb3mulw9YGwc97opsr/cxk3Qa7cW+MJ9bQ3bM88O0n+JwIgDXSFuzRqnIkFVLX4KMYL/DvsGSRwMH0YKgjZFXcBsbRwyYnJYDwsuSeCUPY9iVz28Z8JtUQmPcIbFi4QMJA//e7xJI1wvGO1PaImRPBlvCYqXI7NQig/bcDVc3XQGGZdlGLgM+SnNEB45pYqaJvSJiFJErjroyrVKof9mLPIJs/UC/CYXf3YD9rC6APZY0mI98P/cG6tCbMWHwT3W4Ilzci/1p3uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMSYJO6PoxD3e9bAeN7alCXFQT/glubxXsEzrrWQHgk=;
 b=73bg82mVSP5GcbA3PEm2i/J/VYVIPLHfIflOung4AYypj5D1HuUYJV6b6VtOX0wDxjxfutg1aPQ5kO3Tv9YUfoezxiuxeqYYk0rvg6NO8pIwN5OotYtQkRwWEE2POFFiaJswXHvyzX3FJTt8b5Ciiz7t2F727tzpwbo+tNAAPjw=
From: Henry Wang <Henry.Wang@arm.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/2] automation: Change build script to use arch
 defconfig
Thread-Topic: [PATCH v3 1/2] automation: Change build script to use arch
 defconfig
Thread-Index: AQHZ8MpDPKl80JUbDEi5wt6un5lLQ7AtxZEA
Date: Tue, 26 Sep 2023 23:45:58 +0000
Message-ID: <0620E872-B8AE-4E26-9B05-435DCF31655B@arm.com>
References: <cover.1695767747.git.sanastasio@raptorengineering.com>
 <5baa15904c5bb5f8d668c67519ad08293c32982d.1695767747.git.sanastasio@raptorengineering.com>
In-Reply-To:
 <5baa15904c5bb5f8d668c67519ad08293c32982d.1695767747.git.sanastasio@raptorengineering.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8780:EE_|DBAEUR03FT014:EE_|AM9PR08MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f7e502-2686-420a-7fe7-08dbbeeac41b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /7clNcK/Pdl6SMpQsvIYTdkIGOda4fyy5yE2wj1tDFDIMWTNZhhxqGA5/Y4o8XHb5x+KOvAujpm5vMFLXnZtOVaYv3Y6Nw9DgVeRlTXlOVD1cGy2jwU81IemwgjMfLxN5vGdOoT7KD/tafdryOkxUm6OVS/lwmWjgrUI/cbOmRwRVdxlnEBO6rVk9d/wBMkCmdwNTHfPps5TEQwTveZHWCuDmnB9k4cvlusLGDb8yvNXVd5P6hdqtlkfjTEgsx430dSEDyKosBntUKQL+nzqvI1REOQC/dynibv7TF5WVG1Vw5TBItAI5ua49znoiXUsbcUhosMM99fKSSxJuc9aEl30M59M3eyJHup+1v+UF7Vs4Pqtl1LSgdwxjgPNvmUl9eZTR8rbN49ZT1B+dggs3Flrb9352yEAc6QYWZwNhjSjRLwoEX9ua6kl3bJzGnyRF5RrK2NurnYr7w8NuCGbZ71N0tk4vgXrYNe6/SXT/ZOjJFWTzv3M7mCaOwt58dSlLcVGFAZkao43oc1YB40aQiPtSGxM8sEN715vWnVlcHBAnsUUKVO+eHlgtvU2Jood3PI+JqQQhU/0TPQm7xBL1kORnhm44u+nklCKtNbJU1J3p8F56HVMUaCacj6J6PJCPiryAF46DUw68nhZ4CQjMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(83380400001)(86362001)(36756003)(38070700005)(38100700002)(26005)(478600001)(2616005)(2906002)(53546011)(41300700001)(316002)(6666004)(6916009)(54906003)(5660300002)(8676002)(8936002)(4326008)(33656002)(71200400001)(66946007)(6486002)(6506007)(6512007)(66556008)(122000001)(66476007)(66446008)(91956017)(64756008)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B1B865BB0DCCB4493299B425932DB0C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8780
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22a62f9d-f095-45e0-286d-08dbbeeabbc9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KO1Pxr+XUzsIfnd8w/Vebdos3SeeSyef6rodvdxMDie0sOrvG5tjhpBSAhK7Rq3DB9hSUPopGs6V1/JBnGDC3Q5mw8BRJk/67mxcbWEDECqnEYKNUOXU1ahKpkM+GJoASMdZgSq7QO2WQP2BQlf0EfkxQpwgjrpNufrMzCdN0EDGCtLbFISdGKO99Gqehu41N+8Kf34gAlANwhy2CQARuu1GgLIORJyQhQUT2+V0TTg3k4BIyylDeC+omM4qh2PCuUae6Ui8FZjexdXxMs+bo7HIDAfCjZ9175zUSPZ1G6nPZyIkO3D8vwW9pGuyRbVMLSVofLHKqaDnsCihURO2HtV/tHR22ZUEte0jleWfTwG0HNv5My5saRQ/LGne4CQmZ3megXJNTAHSwEzv99pR/VYRg5HjqfubF/wFSjgl3tSj7u5Eizw6Zj95/40YLdoAQ38u2uzZyuvay+OCKnDJleYYrFJwQ/EP6bzHrAB7L1drIw2MGUmhaC0GZVdOflNa6NX3EnC42N09yNwdJ/rDVrBuA+vN5AyRLM2U3usMMyHJx8/6ERqZVB/sl4U2ynsvj++QxAC+OoTMErs/yWvXgcarl1tTEAza+GxCpAPENCT42gP6hwWy7pLcxJjcgfjvpp5xO4wjBGtuRnJ05FJMgy+wpCn74tdljVl2kko3e5k8/olgkkUzdSDrgw8QKWzVUS2/MHoHCMH8fKqItyegslh8ALJRsyTG5hF8p3Tc7bL5wTMCP5UvnK4sXMcB/vH4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(451199024)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(6506007)(316002)(41300700001)(40460700003)(2616005)(6512007)(33656002)(107886003)(82740400003)(53546011)(6666004)(478600001)(83380400001)(6486002)(36756003)(81166007)(356005)(86362001)(47076005)(36860700001)(70206006)(40480700001)(26005)(54906003)(70586007)(336012)(2906002)(8676002)(8936002)(5660300002)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:46:12.4818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f7e502-2686-420a-7fe7-08dbbeeac41b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6034

Hi Shawn,

> On Sep 27, 2023, at 06:37, Shawn Anastasio <sanastasio@raptorengineering.=
com> wrote:
>=20
> Change automation build script to call the make defconfig target before
> setting CONFIG_DEBUG and extra options. This fixes issues on Power where
> the build fails without using the ppc64_defconfig.
>=20
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

As discussed in v1, CI fixes should be included in 4.18, so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


> ---
> v3: Drop unnecessary sed.
>=20
> v2: No changes.
>=20
> automation/scripts/build | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b4edcf010e..b3c71fb6fb 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -22,7 +22,10 @@ if [[ "${RANDCONFIG}" =3D=3D "y" ]]; then
>     # RANDCONFIG implies HYPERVISOR_ONLY
>     HYPERVISOR_ONLY=3D"y"
> else
> -    echo "CONFIG_DEBUG=3D${debug}" > xen/.config
> +    # Start off with arch's defconfig
> +    make -C xen defconfig
> +
> +    echo "CONFIG_DEBUG=3D${debug}" >> xen/.config
>=20
>     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
>         echo "${EXTRA_XEN_CONFIG}" >> xen/.config
> --
> 2.30.2
>=20
>=20


