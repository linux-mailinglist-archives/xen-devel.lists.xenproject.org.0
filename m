Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0102DE0C6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 11:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56443.98828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqCl3-0003RL-Fc; Fri, 18 Dec 2020 10:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56443.98828; Fri, 18 Dec 2020 10:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqCl3-0003Qw-CH; Fri, 18 Dec 2020 10:13:09 +0000
Received: by outflank-mailman (input) for mailman id 56443;
 Fri, 18 Dec 2020 10:13:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z90k=FW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kqCl1-0003Qr-V4
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 10:13:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1be86e6d-3425-44e5-81bb-4e3e520caa9a;
 Fri, 18 Dec 2020 10:13:07 +0000 (UTC)
Received: from AM5PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:206:1::33)
 by HE1PR0801MB2123.eurprd08.prod.outlook.com (2603:10a6:3:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Fri, 18 Dec
 2020 10:13:03 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::37) by AM5PR04CA0020.outlook.office365.com
 (2603:10a6:206:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 18 Dec 2020 10:13:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Fri, 18 Dec 2020 10:13:03 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Fri, 18 Dec 2020 10:13:03 +0000
Received: from f8d5fe78b262.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6A1C351-33FF-465F-8392-13C54C1E52F9.1; 
 Fri, 18 Dec 2020 10:12:35 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8d5fe78b262.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Dec 2020 10:12:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3692.eurprd08.prod.outlook.com (2603:10a6:10:30::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Fri, 18 Dec
 2020 10:12:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 10:12:33 +0000
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
X-Inumbo-ID: 1be86e6d-3425-44e5-81bb-4e3e520caa9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ52zsdBOHezTfSwHXPXJYFkoB/2E22UlIIDGO1K0T8=;
 b=z/XCisCkwc6pe4T4n2pNI+aerpFcJBTDYsrsFsxHlN+tZYN9CA/GnKf9vEg1ooin7T0kVLnrnfziyTCdlRqOQMVqqRdHno9uHMXugQRSDIffClmHbbYs0b7kRl6MU/KEGez/znqi5JgnpmL/0egA22xkGX0aH0B/m8sATkgxMP4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9974d8774f2e5050
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKSTUXNz5yLsF4bYu30pBqCtOslX+F+Eld+J+g0Zzjz3tYcIhZQNFcDMuJWAbQ4R74X/mIhrV+DNOu1SbtE/O9cfixeH5n7V2nC0Ne97Lfyyd75YoYiIJWfEWDetrlKIUipaG+tyOXzuOPIXW2oPm8D8rxGIfxB2CClo2rQJ5x+TeV/3KXIMGJ3Xi9hKpsNbobt2r1SBHZtxdrn2PbJnA2wA8lAT6qrKPYYSnAMaHtRHDdxinOz4UM/12VAgEtWGQQgvENTg57e6YvwnrgKeOADKKRxRN0Smf90ZWphweyaazI0BF3X86E9mDT/mp9HzwGyGl+1YVaaraVCqOSDTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ52zsdBOHezTfSwHXPXJYFkoB/2E22UlIIDGO1K0T8=;
 b=CNkXFUAmJmEcP6+AI8kwXBgEdjUAngfKUc7l3KDCWV9bP+gs7i6XIDxUCtpleTljPmgegm8KKuF2qH43JXWN3th5HHq9jfrakOqnT5VFE7XkWCHZm7TQxojAolUoVzc7Dk8N8GNQZNQSWnN6l8NPYgeAwhL54Ke9i65ad8QUvjIhORHlq+R5sOO+XEUoNxslE5A5Laa7zD2pgvK4AkhcmCPbbl4IvRjY7QDer4PPaC2QTRWTqWVsQ0fsC5wD1jnTSpE/5XUfjMssvJgMae4tp9wB0WJSzUyx/LaBh4LwxwQcUaq1VHmll7YMIV/oLymQ0TWsdKHcR5xP1RPPFQrJsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ52zsdBOHezTfSwHXPXJYFkoB/2E22UlIIDGO1K0T8=;
 b=z/XCisCkwc6pe4T4n2pNI+aerpFcJBTDYsrsFsxHlN+tZYN9CA/GnKf9vEg1ooin7T0kVLnrnfziyTCdlRqOQMVqqRdHno9uHMXugQRSDIffClmHbbYs0b7kRl6MU/KEGez/znqi5JgnpmL/0egA22xkGX0aH0B/m8sATkgxMP4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 0/8] xen/arm: Emulate ID registers
Thread-Topic: [PATCH v4 0/8] xen/arm: Emulate ID registers
Thread-Index: AQHW1IrfRffCgVO4HkGjd1qFhI+/sqn79O8AgACulYA=
Date: Fri, 18 Dec 2020 10:12:33 +0000
Message-ID: <A0C7B8B8-91AF-4169-8A81-2EC0BA9DC486@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012171543290.4040@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012171543290.4040@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a69ca9b-3137-457c-ac55-08d8a33d818d
x-ms-traffictypediagnostic: DB7PR08MB3692:|HE1PR0801MB2123:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB2123DF9875249AFEA83FCD9B9DC30@HE1PR0801MB2123.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cOpxkUZwlxMa3t5aDcJ51aNOMS+7HPkhY6C91qKPC10r91tG4CRYB/nd9tb7YD23Vz6oRHhk6DT/cAUAv/XkzScC5k62y4E6X7wegm/VdxEBMAfWfNNyFslKgGjMpXhjZtURW3LtTSWVNeecg7+dHE+5QThlBhuEjkuEpV5qOfaUtsVJ0IayJVTH1RvUSasCO9DBpkdUa6TwEhDLEJ8yVuoehiH4/Z+aug46CCgSFca3Qul9MK/1fwMINJlcB/3jR4oVZA3ivAqkLT4wyiNL+U59t9MrfmW+LWankfyRpdUfuXV7+DqEEZntceDEzMTwtQ3uC6S6OfU9YdfEs3aVWFkmvAORluijqY+bXymeSjNv8c3IvBveUz0pYtF5EmkC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(8676002)(71200400001)(2616005)(66476007)(6486002)(6512007)(33656002)(478600001)(64756008)(36756003)(8936002)(76116006)(66946007)(91956017)(53546011)(4326008)(26005)(5660300002)(54906003)(83380400001)(66446008)(86362001)(6506007)(2906002)(66556008)(6916009)(316002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?3PPRv8wd09epmvQ4UA9dFcCqb3jPQVwjsa3jYeb3EIv2F4H+Ja0GX8llgvcP?=
 =?us-ascii?Q?5913C1WILRleqZg7PlqsMRCujGGmDOvdB+wEZYz6ytVV2NGzKL6ZYvp/QoxS?=
 =?us-ascii?Q?5FPJY7J7E23Aa00gig4dZFl93O74BDpZr7ozMauhTdzJMsPkcMXuf54oNHDZ?=
 =?us-ascii?Q?5WlS0M95hEth+5WjhhuuaEWt8jtf0jUCjFMNgRvz1GfFdpW4WMmoMPn18pTE?=
 =?us-ascii?Q?SIuREwckrTRVQhcaKQITDwfw/SNds0KUxm1hrUXSlS3IIRwv5pzGKXscoDVu?=
 =?us-ascii?Q?La+kLTVefO+I0BjPddxWdWENjuL042fHtrQy329G2sg6KM6KR26rEWBK91Zq?=
 =?us-ascii?Q?k+5JWsagHwYaYHo1g34p8QeyOsQqcJbUwVVZB820ToVxPR5fbUwLqMG/hFH1?=
 =?us-ascii?Q?MvWdveXkQYUk1XBeJC5dcL9NukOIjOreTPTbjh4bsbUrL1/gM/HYL4IRoBZX?=
 =?us-ascii?Q?+3nBg57Ie8l7nTfW7WWCg0H3pbkZIfOs7HWrDKCR5Z8+VUnnIy/YyoM5EKTT?=
 =?us-ascii?Q?VZAA3Ahyr582DqOj42IgjSoW8x76toJoid2p2bK2sWgIImPx+2r9ATI1H3YH?=
 =?us-ascii?Q?yR6DvCwzPVrptK1zk00hZQqZ9c17V63AcWVmUpZXNjpt+1s3LWOPnOPvdCwb?=
 =?us-ascii?Q?Ta/vCN/EkxodIL70UkxRNL7dgGasrtjpG14fw6KDRbEHySvyOzhPo2ZZu7TK?=
 =?us-ascii?Q?WHC1nC3JANB9dVKf9xgPcrWprGOquZ8aNwIjZK7PsnwkAB5Es/A1aw/uSl7X?=
 =?us-ascii?Q?KLg9amOKKuJAzCNPU8uXfBVWAD4h32D4w7RMa5k9xAvZ91YZw596rQEJr3cE?=
 =?us-ascii?Q?WSLHHZ+sjGzbr1yd+vsJXiyqdc3gd3UIaaScdOXfOj8NQaptYc4RFaz6r1Vl?=
 =?us-ascii?Q?zS+swKZiLnov6ZC83pc/cpyQXRJFngLtCx5nzkQ2qS23Hb+PhjjW3g5FER3S?=
 =?us-ascii?Q?T50PEmWafZmfN0S3DKxvLPhVDWMGLzFoI7zxl3S61pl+2sDzrgUtcH04wngI?=
 =?us-ascii?Q?GWcb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA61895F99377A4C90C7F30376D7AF3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3692
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	69c36d9d-aa68-4422-f5c4-08d8a33d6fb2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V33GRe2KePKR7Wa7Xy/ap8iOEKZoih99CkAe7cQbSqW4JZ6/sVK4qSUVxRWhOxgz09EMvOG/Nty2VJQQCgWYtERgJmVSHz4hyUcJhc5gbqUvf3SnJ+gJzGTWekK4+hbtMGv92uXarm6rzlbWIELmaZveYjvu5V1Q/gsLciAgINB508f+RbYEkSTVccPHpxaZCSO6K5BVo9s3rThIlcmgYvWsd1aY8brlZ0wTsn4c5YZ5KbLcbhESA+O+rIvaS9qgjnAoTzBDeU4BPGDZh2CKyPj4bFparsIh/l3il9da1Z3+2wFRQDUni2dtiPdVNd/lX9En9nopqTbLcgy9P80a2Fgg4s0BBXbZE2ZC7nczqn7qHPaPapQf0wRyqctwVnBHLfNgQFLJsfwmWXg+1dg+sQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(46966005)(2616005)(6506007)(186003)(54906003)(70206006)(26005)(8676002)(6486002)(81166007)(356005)(47076004)(6862004)(82740400003)(4326008)(316002)(8936002)(33656002)(36756003)(86362001)(82310400003)(2906002)(83380400001)(70586007)(478600001)(5660300002)(53546011)(336012)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 10:13:03.4213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a69ca9b-3137-457c-ac55-08d8a33d818d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2123

Hi Stefano,

> On 17 Dec 2020, at 23:47, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 17 Dec 2020, Bertrand Marquis wrote:
>> The goal of this serie is to emulate coprocessor ID registers so that
>> Xen only publish to guest features that are supported by Xen and can
>> actually be used by guests.
>> One practical example where this is required are SVE support which is
>> forbidden by Xen as it is not supported, but if Linux is compiled with
>> it, it will crash on boot. An other one is AMU which is also forbidden
>> by Xen but one Linux compiled with it would crash if the platform
>> supports it.
>>=20
>> To be able to emulate the coprocessor registers defining what features
>> are supported by the hardware, the TID3 bit of HCR must be disabled and
>> Xen must emulated the values of those registers when an exception is
>> catched when a guest is accessing it.
>>=20
>> This serie is first creating a guest cpuinfo structure which will
>> contain the values that we want to publish to the guests and then
>> provides the proper emulationg for those registers when Xen is getting
>> an exception due to an access to any of those registers.
>>=20
>> This is a first simple implementation to solve the problem and the way
>> to define the values that we provide to guests and which features are
>> disabled will be in a future patchset enhance so that we could decide
>> per guest what can be used or not and depending on this deduce the bits
>> to activate in HCR and the values that we must publish on ID registers.
>=20
> As per our discussion I think we want to add this to the series.

Fully agree.

>=20
> ---
>=20
> xen/arm: clarify support status for various ARMv8.x CPUs
>=20
> ARMv8.1+ is not security supported for now, as it would require more
> investigation on hardware features that Xen has to hide from the guest.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index ab02aca5f4..d95ce3a411 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -37,7 +37,8 @@ supported in this document.
>=20
> ### ARM v8
>=20
> -    Status: Supported
> +    Status, ARMv8.0: Supported
> +    Status, ARMv8.1+: Supported, not security supported
>     Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>=20
> For the Cortex A57 r0p0 - r1p1, see Errata 832075.


