Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E9B79C154
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 02:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599846.935432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfraF-0000pZ-Go; Tue, 12 Sep 2023 00:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599846.935432; Tue, 12 Sep 2023 00:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfraF-0000mt-DO; Tue, 12 Sep 2023 00:48:51 +0000
Received: by outflank-mailman (input) for mailman id 599846;
 Tue, 12 Sep 2023 00:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/bM=E4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qfraD-0000mn-IT
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 00:48:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2281083e-5106-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 02:48:48 +0200 (CEST)
Received: from DB8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:110::35)
 by AS8PR08MB7917.eurprd08.prod.outlook.com (2603:10a6:20b:538::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 00:48:44 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::fe) by DB8PR04CA0025.outlook.office365.com
 (2603:10a6:10:110::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Tue, 12 Sep 2023 00:48:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.11 via Frontend Transport; Tue, 12 Sep 2023 00:48:43 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Tue, 12 Sep 2023 00:48:43 +0000
Received: from fc1eb1060015.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52934736-CE9C-4C85-89FE-D0364896A288.1; 
 Tue, 12 Sep 2023 00:48:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc1eb1060015.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Sep 2023 00:48:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9381.eurprd08.prod.outlook.com (2603:10a6:10:3f3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 12 Sep
 2023 00:48:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:48:34 +0000
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
X-Inumbo-ID: 2281083e-5106-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHpZ/syfh4Ns3ZjteQlBPWifu7e4GBdbj8lhGAmfTfI=;
 b=EA0kPTC23UvYddOQ8YepWopC7/ll7CEybhFox78VK38Km0UR0yOC0wggJ8yFgZvXOp/ZXe5N7oektcYzI9Kt4syp2kpUmqdIpqqmN4KNQg+C/i58xVhTB1qCsBq6RMb5DbWFQl7Fsjfee4FxVHiIacLW3zB16hSGaqWQm8sIjF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5241ac7ffd08afe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMbq8UiJF9NJAWo3zMgvqs3WPpJt/pbLVZEZaejf5zzutnWQ+lf9eRleLH6vF2z+RGYRwmOovyvsbenXmO2N+XZVa5n9Sdul6bfMgD1Brhd7LZj+dYXjmeTJPOe+LWIJ8Ta4uo1eR73DB9SFAk97zE9I5N0OkRa67uZf4QjCEOoFhBxwyceJaZp3Im/7Rml2BtN1FpeoMlkZtluLoBigtuKunc4/pRGvAGC12IRjHfHLFFqibkCeQjzr049hudMW/0eEHhs7xJ8pBAyby1CjbUefxN5c1DsFjDdAM5uWLPUA6vF11/s16JeEIyxdmu6yURtTGkWzR7iDwJpLEZHTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHpZ/syfh4Ns3ZjteQlBPWifu7e4GBdbj8lhGAmfTfI=;
 b=Che0J+ZKEo6t5gLHB1TEOpWppVFvYR6kjYTQu8fBzPeerCONcOKkWdjQf5XBC/569fHwRshrM/0IBeVzoiOpcoXGO6JO6VCibWEFJ7qwVcldTPYlYOKNZueRLsro5a7h1EetAUlV9YtdGwxJzRJHDp+SWVrohzUUBHIkeeaixEWCDKCdIa2wm3pGHTGhTYAIohYGcuNI72hLpfoEtge0AMPh4RcY0fIDRK/fLRLXZZQZP1jGg+FsZN68Z3fg28GifScHSCHOapXK67mycbF7V4ZGeWV2Zg8OSgOke4icLDlRSQybEOke/Yf0J3+OgQke+voulVzk6zfaQKMhxy8zEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHpZ/syfh4Ns3ZjteQlBPWifu7e4GBdbj8lhGAmfTfI=;
 b=EA0kPTC23UvYddOQ8YepWopC7/ll7CEybhFox78VK38Km0UR0yOC0wggJ8yFgZvXOp/ZXe5N7oektcYzI9Kt4syp2kpUmqdIpqqmN4KNQg+C/i58xVhTB1qCsBq6RMb5DbWFQl7Fsjfee4FxVHiIacLW3zB16hSGaqWQm8sIjF8=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Thread-Topic: [PATCH v2 for-4.18?] x86: support data operand independent
 timing mode
Thread-Index: AQHZ5MDnZ00SVLfzmUmuQZLkdMd2orAWXCkA
Date: Tue, 12 Sep 2023 00:48:34 +0000
Message-ID: <29A9BF11-7ECF-4C3E-9D5E-9D44E63A297A@arm.com>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
In-Reply-To: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9381:EE_|DBAEUR03FT026:EE_|AS8PR08MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 2641641b-ec5a-495a-f482-08dbb32a03b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Biq+Hmd1G71kWQzY71ARnv0qnK5EO0ZSLOjKq6d8TzcMLWknpZ3JBCDRb032A/BGCEiriXVHMXBbefg1nGfO7X7FlbGlSg3ShgqavTmXiPj69Axq87znFVqNM+4/lP1rbzsytG/s10ACps4mWlwjWZfyDReTd/dsPk4tIQCVt5tX6OfYY/30g8wwyIz7exGB+LmAB8gRLd35DoqmW1r0KHg38W5yalWVbwLxYw/crW5HGDdGoGs1IwVaLeOayoundTnHGrOybG8BBe7s5HrmBKwD5rgWhR5dIj61lu7bUrcRoI8XYz8R+9LgkJry2oyLuYImTxZsF6TDAbSSfB4l9fO0mAUwjNk/8EdENo51pqEiGRekeI78OciP+3uGBNDjlkBp91Sz811VciuVfssm6l5qflE0L9gdui6dPiED0yQyC905bq0FikBUEMvTVr3KNmJXPWC3zIPgLiuZ9C2oMZ8lSM2+ktwVGWktmOSWxe0G/RrumTULG21ubO8z4hStKJkNfmi2xwzegAZmmPBBpfhQkGHBC70PyLIKi4lXXtgaZ5PDZ8Hckdo086VHbiPuAsF5x7iUChdqM6oHXf88OMYcTZKBe/3eEm4esOMkSiR6JGBPabfOxJWNdQHPF0D4NjesJciKpQRMofZo35TROw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(396003)(366004)(186009)(1800799009)(451199024)(71200400001)(53546011)(6506007)(6486002)(966005)(6512007)(83380400001)(2616005)(478600001)(2906002)(76116006)(66556008)(66476007)(66946007)(64756008)(66446008)(54906003)(6916009)(26005)(4326008)(8676002)(91956017)(5660300002)(8936002)(316002)(36756003)(33656002)(86362001)(38100700002)(38070700005)(41300700001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <429383D608DF804AAD0B24F781851E08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9381
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	878d1243-431c-42ed-2f0e-08dbb329fe65
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xQsFnr1HLPiL+Y47jSXLDV4y4+uK98Qx2OBgHLbLdF1obOVYMBs+lDXYXE6+PLewtCn9tej/+VyHui8omtoYrw/BE+66GNoA+hVoKtcASvq4qw3j+hg2lv0JO822bVbz4CnTOHffVjpwk2zyo74GaYYPAF08iLe2+EB5twloyUPwB6oIUM91iT1Vdh8f1OFJoA5spDSZ5j4UN3d6Y+0eCmIzljNe6H9GfQQVk4hgZX/UqAmaqugdGhym3jU6iCmOwv5WxOz3iP1ic5+JeNxdyhI15koQzUwt2lB73XvyVYRWeeNeLXZVsLg7pS4C+CK+cIO96brPV+f2eFlPXpRHqVvjjv0zQe8+CbjaGpBSyAQMxPwgs4jScH5JIpgb38dylIlv/wFpcTMeUzYKAAmPAJTBGFtAAtAioW0I6e+3k96z68ntdr8eEeXY23wxsw+NvtJfuSxJF0A3Tiv77vqfGQbBE84lwiL1DwCPv2/S/B0JS8JgfWGMyLqV7KOFGdRflIZizcM/zJ62EhQGSF+UsOXk+7+lhykUhSCisYGtvdiUeqbbza2IEX7mgoZ/LFmKvbfPIWN59PCglH9tVVf1gSeG7WGPAa+H2AlBnka7VfRxahYV+gq576OID5XyJvVj2P8htTs+qD8UQGy6M4YDb0O7uCmfFwIbS4EjyffJOF3R0FPajxZhmx0xdsl1mZcoPJR1HiIiuXDiIMWjHx4+5MgrgnF55ii0Vn9ckKN3IVw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(86362001)(6486002)(53546011)(6506007)(6512007)(966005)(478600001)(83380400001)(2906002)(6862004)(336012)(26005)(2616005)(316002)(54906003)(70206006)(41300700001)(70586007)(8936002)(8676002)(5660300002)(4326008)(107886003)(36756003)(47076005)(40480700001)(33656002)(36860700001)(40460700003)(82740400003)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:48:43.5442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2641641b-ec5a-495a-f482-08dbb32a03b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7917

Hi Jan,

> On Sep 11, 2023, at 23:01, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> [1] specifies a long list of instructions which are intended to exhibit
> timing behavior independent of the data they operate on. On certain
> hardware this independence is optional, controlled by a bit in a new
> MSR. Provide a command line option to control the mode Xen and its
> guests are to operate in, with a build time control over the default.
> Longer term we may want to allow guests to control this.
>=20
> Since Arm64 supposedly also has such a control, put command line option
> and Kconfig control in common files.
>=20
> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/=
software-security-guidance/best-practices/data-operand-independent-timing-i=
sa-guidance.html
>=20
> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This may be viewed as a new feature, and hence be too late for 4.18. It
> may, however, also be viewed as security relevant, which is why I'd like
> to propose to at least consider it.

Fine with me if this patch can be properly reviewed on time, because of
the security relevance.=20

>=20
> Slightly RFC, in particular for whether the Kconfig option should
> default to Y or N.
>=20
> I would have wanted to invoke setup_doitm() from cpu_init(), but that
> works only on the BSP. On APs cpu_init() runs before ucode loading.
> Plus recheck_cpu_features() invoking identify_cpu() takes care of the
> BSP during S3 resume.
> ---
> v2: Introduce and use cpu_has_doitm. Add comment "borrowed" from the
>    XenServer patch queue patch providing similar functionality.
>    Re-base.
>=20
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -788,6 +788,14 @@ Specify the size of the console debug tr
> additionally a trace buffer of the specified size is allocated per cpu.
> The debug trace feature is only enabled in debugging builds of Xen.
>=20
> +### dit (x86)
> +> `=3D <boolean>`
> +
> +> Default: `CONFIG_DIT_DEFAULT`
> +
> +Specify whether Xen and guests should operate in Data Independent Timing
> +mode.
> +

Since a new cmdline interface is added, I am wondering would such
addtion deserves a CHANGELOG entry?

Kind regards,
Henry


