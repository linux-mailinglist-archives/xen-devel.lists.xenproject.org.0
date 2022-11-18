Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB87762F596
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445762.701129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow18x-0007o3-TY; Fri, 18 Nov 2022 13:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445762.701129; Fri, 18 Nov 2022 13:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow18x-0007kl-Q3; Fri, 18 Nov 2022 13:10:55 +0000
Received: by outflank-mailman (input) for mailman id 445762;
 Fri, 18 Nov 2022 13:10:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pIy2=3S=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ow18w-0007kf-KB
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:10:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e520dbc-6742-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 14:10:53 +0100 (CET)
Received: from DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) by AS2PR08MB9786.eurprd08.prod.outlook.com
 (2603:10a6:20b:605::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Fri, 18 Nov
 2022 13:10:41 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::d3) by DUZPR01CA0013.outlook.office365.com
 (2603:10a6:10:3c3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 13:10:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 13:10:41 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 18 Nov 2022 13:10:41 +0000
Received: from a12975b779d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60D1668B-0536-44D3-9967-141980D24A87.1; 
 Fri, 18 Nov 2022 13:10:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a12975b779d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 13:10:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9005.eurprd08.prod.outlook.com (2603:10a6:102:33e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 13:10:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5834.007; Fri, 18 Nov 2022
 13:10:31 +0000
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
X-Inumbo-ID: 6e520dbc-6742-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjGNyL8RKxtucLG+xdGQDWNcAwGaB414utaccGVbBEk=;
 b=ijwpYMS83XdPLdwsK3DbismzVY0+Q7BPfNhwawnflrngdL94Fz2IdRjwrc+642i1FuJS7IZkhx0MZtozsGhVIIqAj6Hn44NwV2/UyjINe0BIuJXB2TyTW5Sji6cY0d92Qk+2VmxWvqnruOcfmA44UMwcRUCtuTXQmJGtZ+LHIpc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba572b422e488886
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odTYNlMPUT7aReJ0Hsa+1km767rCt//aIfb3ZKHHl97dbZJLZqdt5bqxyqSSvwebgI1RyQ2o10175EQHK2a/l0NrfACpC+n3sBPiONTdYhPj5V3HJ9gHjTNiA8el41dVjmAARkZ+6OxDSoK3PdspIL3HZR/yTEW10PuhvY4a7In0No2pjuWau//qYcRlvYVsWopryd60fxMg05+wBWzDR3uXoAzDpGMjaJwuaGS85vcNx8s1Sch53PRE9EQJZeSxz+bzRC7fYTkqemmfW5flDmpAtDlLuZ52cfpZDQAdmTA+y/nOR8HhEmGODRAXa+ITbjnaXXGZxt8kkY6CVIs3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjGNyL8RKxtucLG+xdGQDWNcAwGaB414utaccGVbBEk=;
 b=AtS3FJD3YsbBLVT0Ro88GZR+6RINyQmdQDu9XA3trGRtNK6l2Wt5gsQNqR2tgw4EXI6r5EREwjjMD9BGMIqAOMG5pjaH7H51dF/EswNFijO6M3rFiE710wmzu7AgqycpJ0FlXVuQuVFJVkWrY4TsAhjgobHyjT7M5LU5NMS1Ylj+0PBUb9JxesvQ2EYt4kJiH7ChraL7Du+yPsK+O+6von/Ug0M+c/Kwk3G99dm3MGzoi5nVe2eqMtNsvpwULutxufdw+HIy51GkkmH/Le0U7FI3kzERSicZ7DKxc5PeoPS8vU2M9evJwJ3uyEUKwgVYTs7RelHvPeNCJYF5TNyrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjGNyL8RKxtucLG+xdGQDWNcAwGaB414utaccGVbBEk=;
 b=ijwpYMS83XdPLdwsK3DbismzVY0+Q7BPfNhwawnflrngdL94Fz2IdRjwrc+642i1FuJS7IZkhx0MZtozsGhVIIqAj6Hn44NwV2/UyjINe0BIuJXB2TyTW5Sji6cY0d92Qk+2VmxWvqnruOcfmA44UMwcRUCtuTXQmJGtZ+LHIpc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] docs/misc/arm: Update references to Linux kernel docs
Thread-Topic: [PATCH] docs/misc/arm: Update references to Linux kernel docs
Thread-Index: AQHY+0N2vSlEmd+I6EOXaDTIdICPg65Ep70A
Date: Fri, 18 Nov 2022 13:10:31 +0000
Message-ID: <31E1FFCF-F675-47D9-BCDB-5884F7360567@arm.com>
References: <20221118114554.20696-1-michal.orzel@amd.com>
In-Reply-To: <20221118114554.20696-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9005:EE_|DBAEUR03FT063:EE_|AS2PR08MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecb7be4-2b83-4816-6753-08dac9664b5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fOyWM5nkV+51o0eflhHNpzBZHgrL5+ON8gfcK/kZVxoFHOF93cg65VXoKbqmlzwg/rabWLNGfAbRmZAfqecQ89c8QH7n7nLIN/rj/BwhxCLinzb+/Ns+ytTkzrcZATWjDb1ZxttRJnF7X/Bo/HyhLF/BS7QTXNRtnVIYIa0PYQc8swzaem0i8hhXHM1Smbw+jW8vuYIm6uFZekr51j1i3PvcU4M28xnDOgc7TXnwJZ53WMAW3MoXfoCrhipcJNIw9oKzhKi7M3EMBNx3Km2pHIj3/F7DSIDcf8/Z7gdbhZ/UERqjfaUkQGBGIZh7zw516R+zn+kEKKXJM5pq5UdG37ahJCQ8CzJhq7P1Mc6WWgJc+LesmYnd/UWNh3CjuHZTDM5MLZKyfqLk2JOYm7ulgN0Kiqwl38s48szmnqCY+k0YeEtEgRCFC2iJuB5KhIoHY/lOub71H13P8ctCf10p3lm1htJq1AmOMyV8pppwDhbV5ltBZ1bZeZXT8RoBoTBaxpgwa0XOzaXn+lqcEWxZW+LOYQLSBcZzsFt0s1kd3FQLWItYflCgJgr39pFIF8FSqiK2yMpndq0E8mTK4zKnPbCB7BVupc1Md+EgIiWiSzVxoe1GOte7gb0umUn3X2o6xFdSKvJp2948lDHq+dqZgbJO79VT4rmXkhtyxy5qJXUceIMrN1N1zHUlNCwEtb+WuC37fGT3GjBLOO7BrL0/1QqNlyseptNfymfFDoM7ZWvjqycGefHlUp5pgCffpr2ICwc8ALqFPHxVOG+wFwBIQ82X0PQ364WXCPjn80Wy/ZfjfiR9FlbxnLvXFNtzpumV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199015)(91956017)(64756008)(76116006)(36756003)(4326008)(66476007)(66946007)(66556008)(5660300002)(66446008)(8676002)(8936002)(33656002)(86362001)(54906003)(83380400001)(478600001)(6506007)(26005)(6512007)(71200400001)(19625735003)(6916009)(6486002)(2616005)(966005)(186003)(53546011)(316002)(2906002)(38070700005)(38100700002)(122000001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CAA88E69C1EBD9488AFBA16E6E8B9BA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9005
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57fc3b3f-2f2a-4a34-bb4e-08dac966457e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o9KS/oYqc0KtkhMdUUw98WFnP63M4ez9hmfY8WixojObRxYz+18vJ30wIdDdi/+AjSqRHO16BM9q6mu5Q+HRC18jqd8rwmIEjP6Id/e64MeEopKLkNrnd3X96iWwzCg3nhavqrSGuylGsf/eL2Dl9JKH3SdKfpmRdpJnew2PTR2Oglna5p74d4NMS+B4REW+UFMefhsZ9Osb+tP01S58LNmvratelNuNd3J7X36FF5WY4EU/5FKiQPeQHE21PMdqklLOLLB/KS19Q4t74ifZa1uHY7YxXKgBFxtuNkjtb8nf3Sd5kDYAoKUgIBqGo0Qm6IzfFOMHzRK2xPkfYV350EsQ2rHZpE4qKn+4Eehgik8slqjjz0y4u0e3lxlHAiqbaXYTZEZEeevLLe7EKn9PzLCLcyOx2dKQAQ3IGtyHa5uPEXJ0yS7JnsuHU2PeNfxfSOZmKepDmUwL10I4LAENhG8Cr+qSWuE/3iejrpjNv33GcE8gTSGIHAgztg6wrKou6hiG3JZU9d5ThJVrNY4QIUm5e6CB463Pph3LxoWH8ub+9fuWWRGrKwLghMm3QrhENonf2DIHqUidDVTZTXSUd1lB+sYtaYil5DFZSG+VRBnmD0rVP1NM4L+0htQFHb4BENQmMaRYUxpJvyEbqDnBS5BqrwQfgAMii8xEg2gu9O4NN3LlynqOruUedJE/eNrlt68I0yyk8iUVyVEu7xUjS7P37gGKEP3u0rZOpm4wU+t7JBxyTk+f2v0SMZPxrcaAX0PYH2t87r0pyaAEhKgHvw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(6486002)(33656002)(356005)(86362001)(81166007)(82740400003)(5660300002)(8936002)(53546011)(6862004)(36860700001)(8676002)(70206006)(4326008)(41300700001)(70586007)(26005)(82310400005)(47076005)(107886003)(6512007)(316002)(6506007)(40460700003)(186003)(336012)(2616005)(19625735003)(2906002)(54906003)(478600001)(40480700001)(36756003)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:10:41.4737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecb7be4-2b83-4816-6753-08dac9664b5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9786

Hi Michal,

> On 18 Nov 2022, at 11:45, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Some time ago, Linux switched the format of docs to ReST and the format
> of device-tree bindings to json-schema.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/misc/arm/booting.txt     | 8 ++++----
> docs/misc/arm/passthrough.txt | 8 ++++----
> 2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index d3f6ce4755f6..3e0c03e06596 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -34,8 +34,8 @@ Xen relies on some settings the firmware has to configu=
re in EL3 before starting
> * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>=20
>=20
> -[1] linux/Documentation/arm/Booting
> -Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/lin=
ux.git/tree/Documentation/arm/Booting
> +[1] linux/Documentation/arm/booting.rst
> +Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/lin=
ux.git/tree/Documentation/arm/booting.rst
>=20
> -[2] linux/Documentation/arm64/booting.txt
> -Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/lin=
ux.git/tree/Documentation/arm64/booting.txt
> +[2] linux/Documentation/arm64/booting.rst
> +Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/lin=
ux.git/tree/Documentation/arm64/booting.rst
> diff --git a/docs/misc/arm/passthrough.txt b/docs/misc/arm/passthrough.tx=
t
> index 219d1cca571b..4f0a024818a2 100644
> --- a/docs/misc/arm/passthrough.txt
> +++ b/docs/misc/arm/passthrough.txt
> @@ -71,8 +71,8 @@ Please refer to your platform docs for the MMIO ranges =
and interrupts.
> They can also be calculated from the original device tree (not
> recommended). You can read about the "interrupts" property format in the
> device tree bindings of the interrupt controller of your platform. For
> -example, in the case of GICv2 see [arm,gic.txt]; in the case of GICv3
> -see [arm,gic-v3.txt] in the Linux repository. For both GICv2 and GICv3
> +example, in the case of GICv2 see [arm,gic.yaml]; in the case of GICv3
> +see [arm,gic-v3.yaml] in the Linux repository. For both GICv2 and GICv3
> the "interrupts" property format is the same: the first cell is the
> interrupt type, and the second cell is the interrupt number.  Given that
> SPI numbers start from 32, in this example 80 + 32 =3D 112.
> @@ -187,6 +187,6 @@ assign a network card to a dom0-less guest on Xilinx =
Ultrascale+ MPSoC:
> };
>=20
>=20
> -[arm,gic.txt]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/arm,g=
ic.txt
> -[arm,gic-v3.txt]: https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/ar=
m,gic-v3.txt
> +[arm,gic.yaml]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds=
/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/arm,=
gic.yaml
> +[arm,gic-v3.yaml]: https://git.kernel.org/pub/scm/linux/kernel/git/torva=
lds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/a=
rm,gic-v3.yaml
> [xl.cfg]: https://xenbits.xen.org/docs/unstable/man/xl.cfg.5.html
> --=20
> 2.25.1
>=20


