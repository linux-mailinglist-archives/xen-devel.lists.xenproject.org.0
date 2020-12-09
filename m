Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B2F2D4410
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48298.85386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0J0-00064r-0F; Wed, 09 Dec 2020 14:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48298.85386; Wed, 09 Dec 2020 14:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0Iz-00064S-TH; Wed, 09 Dec 2020 14:18:57 +0000
Received: by outflank-mailman (input) for mailman id 48298;
 Wed, 09 Dec 2020 14:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn0Iy-00064N-Jm
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:18:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b5b1283-8401-4453-95af-9b8dc914a2b7;
 Wed, 09 Dec 2020 14:18:55 +0000 (UTC)
Received: from AM0PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:208:136::26)
 by AM5PR0802MB2532.eurprd08.prod.outlook.com (2603:10a6:203:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 14:18:53 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:136:cafe::69) by AM0PR05CA0086.outlook.office365.com
 (2603:10a6:208:136::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 14:18:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 14:18:52 +0000
Received: ("Tessian outbound 76bd5a04122f:v71");
 Wed, 09 Dec 2020 14:18:52 +0000
Received: from 6e4837a21de5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C5C3EC0-785F-443B-B2A4-C6DFF1BBE2CF.1; 
 Wed, 09 Dec 2020 14:18:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6e4837a21de5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 14:18:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2693.eurprd08.prod.outlook.com (2603:10a6:6:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Wed, 9 Dec
 2020 14:18:44 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 14:18:44 +0000
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
X-Inumbo-ID: 9b5b1283-8401-4453-95af-9b8dc914a2b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X767IjoWUE1hrzjhIkzCnpM5+Falf9ZjrrY8OUWElO8=;
 b=rgrbS6ui6CJtA+F3bzrJoyy3A0+o9UgcqjCztdmlYm2cAPgWDaf4bIhwj/MMAKdFjVnPUCE4LQXfCoKtvu8zrisRb49H/E5YzO2MYk8Xvq5l6bTcqaFgQQXk5XGw6IsuIM6KxiewtR+15kADPk20LEvJmrPcLZ4k482vBxIgAHw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d231f7406e8d55da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3x7stLqIkuDWhYGIqOV6Yk3PRgS4dk66S7xklGHnqvDlh5qlB5iwV8lyL+j5iNC3vHsUBISRyMdF3dOTMyEJoUxYllWpXmp5AEK9ZE7jI9eC2Qul0IAZ/FQK4lh931tUHwxxgS5VIDFLYsckaVmKc+lgbUPfB7hdgpSj46oWXVk6mIN/1lhyV5DIObVsDZhuR012HquRKjS7C7qryNVKvsS3OvXuqeKHI/epZA3jQq08ZdEZzZHLdbQS5R3gHLirIcc453t2uQVSIX15NGxa4XL8JicCd/vw65+sxiyA2uZpr5Sanl27KT/vr/sLBT/LdhMZlh4/hCiIEv3KaUlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X767IjoWUE1hrzjhIkzCnpM5+Falf9ZjrrY8OUWElO8=;
 b=JdVaQ8YCnflHLlmWbRK+mv1J2leV+F89c9sX3CoLeY7lX9TLm4fS/M/VHzl6GT4F2T/nHoHw/Nt5Jom1fFdBoluW7UEa+OsYhFVIjNMzm+SdxmiQyT0rr1QgqnHeb5iqEqOj5Ouq1+N12OlB9ws7ys8NSFL6AgNeoA01Balx/tuibxpVPUbD2TlBosjLVS4SfffjahnwaiFKSLz7Qqc21NShyza8PSjXW3bPa7nFAOFtdTA5h6qUfEvZmoy7Y4+uNRM58OG3odUs6zRxvb4RflHSrqiOpTFONvc+feMrOw5JtpBNmdC52TaqZ6agiqB+vDIoSih7/fPmk0PmvUiDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X767IjoWUE1hrzjhIkzCnpM5+Falf9ZjrrY8OUWElO8=;
 b=rgrbS6ui6CJtA+F3bzrJoyy3A0+o9UgcqjCztdmlYm2cAPgWDaf4bIhwj/MMAKdFjVnPUCE4LQXfCoKtvu8zrisRb49H/E5YzO2MYk8Xvq5l6bTcqaFgQQXk5XGw6IsuIM6KxiewtR+15kADPk20LEvJmrPcLZ4k482vBxIgAHw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 6/8] lib: move rbtree code
Thread-Topic: [PATCH v3 6/8] lib: move rbtree code
Thread-Index: AQHWway2iTIGxXspY0WlIcuHoV7Fs6nu6Q0A
Date: Wed, 9 Dec 2020 14:18:44 +0000
Message-ID: <F5092007-8C0F-4D0A-AA61-B07300886980@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <749adfdd-70d6-c653-7fcf-dad13fd8463f@suse.com>
In-Reply-To: <749adfdd-70d6-c653-7fcf-dad13fd8463f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4f1e8fc-0d99-426d-8dc0-08d89c4d5b35
x-ms-traffictypediagnostic: DB6PR08MB2693:|AM5PR0802MB2532:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB25321D3981037ACCC0F6FEF49DCC0@AM5PR0802MB2532.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YhHRkMCVV1YkSKYIvwacqre32j/eHSRGRUrVAbrfXBpOn22K3GkYAHcCmTzG0jnSp4YbQxuFqHSCEGXeR/dwWVyuPjAReycOvlkIGTQnF+iOBoJywl9qFBaM27KU//yjCrB+jkDB8l45YKhhMUdkc9oEJn0xPtahaN2cweLF4SMpiL9RZDPmC7vahT/eirmGGUoI8RM1fHwWr8b8AnmWD0FSANZGUq3MF+kbpxItbnIoU2VS0TRmjtjrofiu6+XIesPfxeaqnlVpZq3rQLEewGwPXvuEwdCyInnEG0tjLIViEMcsTqMCZyjkF6T/lO8qE28W4HCfGrp2/NQknK7Cn7TOToMm5RZOtpeWCV/FHN7YqlJ8mgFFby5wrT+7wWww3/6fGfqpG6Z3DW2yA4T6u0V5WuFuwXSYxDrbcI29pirlvvOayvdDZFJRWyu19epaLiW74yEQnrMf4dLMOm/fZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(53546011)(26005)(64756008)(508600001)(8936002)(6916009)(8676002)(2616005)(36756003)(66946007)(6486002)(6506007)(66476007)(186003)(54906003)(19625735003)(2906002)(5660300002)(6512007)(83380400001)(66556008)(966005)(76116006)(66446008)(71200400001)(86362001)(91956017)(4326008)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?xNPIXNzhspjDUpG3rb0W0nw7Ecn/auU3itsjH0+OAecFiO6DB4cfwrrAhEp3?=
 =?us-ascii?Q?DRQUfjN9hrNhduiz/MHv8TXnvulDmF61fJfaHvAmFxvR+tZu2znK6JjtoO51?=
 =?us-ascii?Q?5XmCv4uSwdhcnuEcmYkKWD8H8s4rbc7dUK+cEND8vb1ZWMpP1ctyrxg5Ntan?=
 =?us-ascii?Q?HLPAc3WAsHzfEpN8lqSr3HPbRCWDQm2ebEADNdUJPqyCwCdc4jzfYhrbQwTL?=
 =?us-ascii?Q?W4f6w8Cr7TVRIYe8gzQlLAbflItfSW1h4Wzu/F1bJ7zNAECeNPB6yqq7YJpZ?=
 =?us-ascii?Q?MEBpvlGkX9GTitdn5On+yNtm3hZF0OztfqaovyqbF+2E+TffCdfSJZfAfRoX?=
 =?us-ascii?Q?GhrdzAdxzewWzVis26niqLrrMern1swsWYeDgps+VJfoXAm0rYyav3BwTwPx?=
 =?us-ascii?Q?r7yMDF1L27+WOocbZwooM/OX1VX69BmpiIXFZ3xGEHwFKPUuta5lYMHUe8Wz?=
 =?us-ascii?Q?PQbN8tMKEg1ngy5wDfw6YmqiaIZp4KJm3GW8cJUal69Giup7IYxqb9cetcjB?=
 =?us-ascii?Q?n1oLWsHETuUDZ2MgwWxiIawrxeoYT374b+qCbLXjgIFPQJh3jeSkr0fNORZj?=
 =?us-ascii?Q?mcbpceZYeQOIJhlYsLDE4yNAAGTerdrvDRclFIsPMd0AX27XqOs51Fxbl9V0?=
 =?us-ascii?Q?3YuP4jcGLxFT57LWNQRCkv0NqyAkcMgrYKV0PJnsTRtN+XUjmZfq477CeiJe?=
 =?us-ascii?Q?a2MaZjjmBfI+OwHgXOjatqV7qi7XDkQA/TBCC9A8Wo/JA5xG6aHGn/55Hv0h?=
 =?us-ascii?Q?2OvCs+q6X1atwbDFigFVGT0MRy5jkW/zw4ppm0KxgJPYuYfMU6f8N7grxnJ9?=
 =?us-ascii?Q?BHdv9ZggEpU31MitekTvJcBoBY8Z8HKC6ZPh3wwtaWeEY+oBrD53sq8kJevM?=
 =?us-ascii?Q?w0DoRMk3OMMDQZZOihQfb2XN0sTIC/wqp6YirbK3Dw+VtkgT14c/iYo7prI6?=
 =?us-ascii?Q?PweMm3Xs6UWX2R9P454ZqOawTdepUcaPbzkG/LJ2kqZ35NJ/ZlAUDD94VBgR?=
 =?us-ascii?Q?IIA7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <927EFA7C2B6F6C45BC2BC417891CFAA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2693
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7372e19-5c11-4ff4-e6e3-08d89c4d5656
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/8OhUcdwUmNIQXLilBh1yUdrOGzHb3IHpkhk1nEco6/5Rpuw8qmKb30Ii+eVwDPXrNaruCm3jjs1oXhdENtuOK+UoG5C98e0co1hc5G3TzVaGuWxt/hryOouJWoU1uysJCeqOfkExcB6SbTPfUg0Z9EqzM0zg9aaSboSjjb5bBQ+mKbQ2XdFZg87l5Zl2K6CamipWkTrNJvC7Vg9Rol/9V+SaND2vD9AxW8TcD17IzsIhdFmG+0wgeNjacOoRsGvaXPGE0fzboSKs6TjcfrL1ZMavzbSwl+tpAmgyiDk8nLZnXYK1K/vpXghk+k+s1TyhQ6ML1z71Z1EbR62eM9z67duPYm9gvbja5sEtBr6Wdpfb17NqiEw5ttqhScc22wa+Z0Kx2/9FzAfMB/IfKDJGm82NF6C6YY4Qbo8TeLjCG2Mx+MrRHuPALvo4yYBJpmP8Ga+iIcOzbH/hAwnyULnO/dWDjYvPZ7dHVMH8WhjizU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(46966005)(2616005)(47076004)(33656002)(81166007)(86362001)(36906005)(356005)(82310400003)(8676002)(5660300002)(83380400001)(336012)(6512007)(19625735003)(6486002)(53546011)(8936002)(36756003)(2906002)(4326008)(107886003)(508600001)(54906003)(6862004)(966005)(186003)(26005)(6506007)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 14:18:52.9046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f1e8fc-0d99-426d-8dc0-08d89c4d5b35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2532

Hi,

> On 23 Nov 2020, at 15:23, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Build this code into an archive, which results in not linking it into
> x86 final binaries. This saves about 1.5k of dead code.
>=20
> While moving the source file, take the opportunity and drop the
> pointless EXPORT_SYMBOL() and an instance of trailing whitespace.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/common/Makefile          | 1 -
> xen/lib/Makefile             | 1 +
> xen/{common =3D> lib}/rbtree.c | 9 +--------
> 3 files changed, 2 insertions(+), 9 deletions(-)
> rename xen/{common =3D> lib}/rbtree.c (98%)
>=20
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 332e7d667cec..d65c9fe9cb4e 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -33,7 +33,6 @@ obj-y +=3D preempt.o
> obj-y +=3D random.o
> obj-y +=3D rangeset.o
> obj-y +=3D radix-tree.o
> -obj-y +=3D rbtree.o
> obj-y +=3D rcupdate.o
> obj-y +=3D rwlock.o
> obj-y +=3D shutdown.o
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 72c72fffecf2..b0fe8c72acf5 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -4,3 +4,4 @@ lib-y +=3D ctors.o
> lib-y +=3D ctype.o
> lib-y +=3D list-sort.o
> lib-y +=3D parse-size.o
> +lib-y +=3D rbtree.o
> diff --git a/xen/common/rbtree.c b/xen/lib/rbtree.c
> similarity index 98%
> rename from xen/common/rbtree.c
> rename to xen/lib/rbtree.c
> index 9f5498a89d4e..95e045d52461 100644
> --- a/xen/common/rbtree.c
> +++ b/xen/lib/rbtree.c
> @@ -25,7 +25,7 @@
> #include <xen/rbtree.h>
>=20
> /*
> - * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree=20
> + * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree
>  *
>  *  1) A node is either red or black
>  *  2) The root is black
> @@ -223,7 +223,6 @@ void rb_insert_color(struct rb_node *node, struct rb_=
root *root)
> 		}
> 	}
> }
> -EXPORT_SYMBOL(rb_insert_color);
>=20
> static void __rb_erase_color(struct rb_node *parent, struct rb_root *root=
)
> {
> @@ -467,7 +466,6 @@ void rb_erase(struct rb_node *node, struct rb_root *r=
oot)
> 	if (rebalance)
> 		__rb_erase_color(rebalance, root);
> }
> -EXPORT_SYMBOL(rb_erase);
>=20
> /*
>  * This function returns the first node (in sort order) of the tree.
> @@ -483,7 +481,6 @@ struct rb_node *rb_first(const struct rb_root *root)
> 		n =3D n->rb_left;
> 	return n;
> }
> -EXPORT_SYMBOL(rb_first);
>=20
> struct rb_node *rb_last(const struct rb_root *root)
> {
> @@ -496,7 +493,6 @@ struct rb_node *rb_last(const struct rb_root *root)
> 		n =3D n->rb_right;
> 	return n;
> }
> -EXPORT_SYMBOL(rb_last);
>=20
> struct rb_node *rb_next(const struct rb_node *node)
> {
> @@ -528,7 +524,6 @@ struct rb_node *rb_next(const struct rb_node *node)
>=20
> 	return parent;
> }
> -EXPORT_SYMBOL(rb_next);
>=20
> struct rb_node *rb_prev(const struct rb_node *node)
> {
> @@ -557,7 +552,6 @@ struct rb_node *rb_prev(const struct rb_node *node)
>=20
> 	return parent;
> }
> -EXPORT_SYMBOL(rb_prev);
>=20
> void rb_replace_node(struct rb_node *victim, struct rb_node *new,
> 		     struct rb_root *root)
> @@ -574,4 +568,3 @@ void rb_replace_node(struct rb_node *victim, struct r=
b_node *new,
> 	/* Copy the pointers/colour from the victim to the replacement */
> 	*new =3D *victim;
> }
> -EXPORT_SYMBOL(rb_replace_node);
>=20
>=20


