Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861BB2D4444
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48313.85420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0Rx-0007Ig-Hc; Wed, 09 Dec 2020 14:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48313.85420; Wed, 09 Dec 2020 14:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0Rx-0007II-EB; Wed, 09 Dec 2020 14:28:13 +0000
Received: by outflank-mailman (input) for mailman id 48313;
 Wed, 09 Dec 2020 14:28:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn0Rw-0007I3-0m
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:28:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.56]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35d42f26-b0e0-49a7-adb3-acbb924c1e8d;
 Wed, 09 Dec 2020 14:28:10 +0000 (UTC)
Received: from MR2P264CA0106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::22)
 by AM6PR08MB4373.eurprd08.prod.outlook.com (2603:10a6:20b:70::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 9 Dec
 2020 14:28:08 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::9a) by MR2P264CA0106.outlook.office365.com
 (2603:10a6:500:33::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21 via Frontend
 Transport; Wed, 9 Dec 2020 14:28:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 14:28:07 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Wed, 09 Dec 2020 14:28:07 +0000
Received: from bf62841135a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A897CF14-F53B-4866-BEC2-D7BE977BB5E4.1; 
 Wed, 09 Dec 2020 14:27:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf62841135a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 14:27:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 9 Dec
 2020 14:27:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 14:27:49 +0000
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
X-Inumbo-ID: 35d42f26-b0e0-49a7-adb3-acbb924c1e8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnYIawYMtjBZScVMAekXwJUvV5Yzu1NbGzcbtf+PC+E=;
 b=xw90otUFDvYNmT5vpFURt/Mi6zbblhvatjaGu5chEcODFbPMtgm09zO/qJbbGFbI6IfAhZIDsf7SqeunuUkZSKIC1ZQka1200PW57u8oCG45sGlbmW8tbv5PGm0SL/277TNZjmhrODk/JNNf3tPACgGuiqqO2obiTi93KEBuOT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f29f2f68edd540b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvM6xIg95wHQ288ZFUS/9mPB1eO0HdTi7uzx2gExR2Kzu/ePfi0Ap6GvGVNHIOEEol2dHoQIjKQh2OFUmk3gJHDYHAdz+hZAgiUIwc+b4z4HKfjt3m8ppjdXiDK1PRS08dWDk3yGWD2Oc3q0hQ00x6LViI7cxZQuBinUr5sQiTizmaqR/V04Jw6BxVz8+Ttb1wqUqabZmpAHPMnbTAvUZ+JMZdfnX50TDU/W7TmjbgpLhO9fImVQENZeo73kJJPjekOBN9v4zE8XjjOnz/w1NvrMvQ+U8qOz2bSWGRZdU1X3Z3YXiuoBpiXpP49Y7NYBZKNNWcOKfnADkA2ALNlmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnYIawYMtjBZScVMAekXwJUvV5Yzu1NbGzcbtf+PC+E=;
 b=j7ZMls/VIrGonKXTlTqjk9ksg/BBEil9VrzKtkXI/JkNWxaO+nZnXEyGPQ6lBmTkuhzfy2DSKiUosFfhTii05CRgijzATfbAl2YI44LR5a8Y4VMysgT4VUWf209L/gyKU0fLQ9mhjhhXiJ9JiG06LrXs3vXicd78zLbV5Th9t9/ck7sJ5Su7608mwqcsz6Ic9yJO1tDoMjatD3ZeYd+ukCo1raNqD8c9lOPEmN6fczj0+PaZpd7DIZ0QDZa4tQxW+WEcUxBLH7msD2s2UyxQceJovevTugE83W0A98mYHzSkXaOOCsHnFP+CnLXJYL681Tdfbyg5MLJqGpJzlolIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnYIawYMtjBZScVMAekXwJUvV5Yzu1NbGzcbtf+PC+E=;
 b=xw90otUFDvYNmT5vpFURt/Mi6zbblhvatjaGu5chEcODFbPMtgm09zO/qJbbGFbI6IfAhZIDsf7SqeunuUkZSKIC1ZQka1200PW57u8oCG45sGlbmW8tbv5PGm0SL/277TNZjmhrODk/JNNf3tPACgGuiqqO2obiTi93KEBuOT8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 8/8] lib: move sort code
Thread-Topic: [PATCH v3 8/8] lib: move sort code
Thread-Index: AQHWwazCYMZRivICQk+HtBzW3vmiCqnu65UA
Date: Wed, 9 Dec 2020 14:27:48 +0000
Message-ID: <A2E397D5-4F51-46D0-9929-5AB81DCD6E23@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <84bd9aaf-e94d-da6b-f2f9-c2da64df5312@suse.com>
In-Reply-To: <84bd9aaf-e94d-da6b-f2f9-c2da64df5312@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a28cf76-8fbd-4ebd-340d-08d89c4ea5f8
x-ms-traffictypediagnostic: DBAPR08MB5752:|AM6PR08MB4373:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4373358878C85E101A2BC7669DCC0@AM6PR08MB4373.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:556;OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oiiOhYN7cZlTBbgO4SJOolT5yJIj7EY+tdMDPPPnBaTtEtQwSDT/KbhNJ98Q0GSihUcDLuwYswJ5PAxD3EBQWy8oo1EoZtec8V2G6tJiSzBEDxJaAs1LMPUTundBcaURpzJZ6kjRM0jBQV1xLkQL2n029TODY3aaPEjypPNib22DPSzHQ9GNSpBxMkuDj4iJeV9tg5J/jidNhwTlLxIvQxuFIW4/Vzl2/O/+GUfdIk/G20ZZfwbivFQXf+08WosnaY+ZxCFx9t6+fEhbaj///GRWhp28Xe+YAb+4fhQyBoTAYRpNjjXYHiCkzkB9Sp5ywDJH3+3KEY7tuMeLSTnDTagajNsyuWnzV3i5fZnEo1cX3OvlF+OOSOIrQeepsO6p
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(91956017)(478600001)(316002)(2616005)(36756003)(86362001)(6506007)(76116006)(6486002)(5660300002)(66476007)(2906002)(4326008)(186003)(6512007)(83380400001)(54906003)(66446008)(71200400001)(33656002)(6916009)(53546011)(64756008)(26005)(66556008)(66946007)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?v9Z4EIjtS8TM4jv91OyW4i+xsf204je4nL6ciegB3TBM5lsJio+/COlvyLch?=
 =?us-ascii?Q?16OQ+/z7hbjwPFRYgqFZnmPSHS90Ay0CZUIH70kZa9Ic/U3eAkSt7hSfLAaS?=
 =?us-ascii?Q?N7/te8upeZOgwxcnr8j4zIBpIFwDKUM1jH0FphspPDUq4F4N+wwda74b/tJG?=
 =?us-ascii?Q?4dW8Qxtr437KDpWMOmu4W7aSdIn5+PerXOmsnCpi9PnW/h+ZvHXrKKshX12L?=
 =?us-ascii?Q?aduY3bx9+MGndiKScBFtv1u2AHPLHRmZGRrzVY4sRr9tzKQ5Mnm/2m8szK7E?=
 =?us-ascii?Q?8SPC9vZNAiGsqKeDmZlrvDseOv9hgOAv7m0HncB5FZwWY0vU/0jSrtIbeNgq?=
 =?us-ascii?Q?yJaH00bOuYfzw7nV8dMu3HGOZKh99u93Bq1HLR+LqYtTxJSHXMTfPiDVV5xY?=
 =?us-ascii?Q?gX3v6HNn+TdatAyyr0yvMS+C1hMoRyYKq8vfoMuwrckPxOlc5RC0Ju3Q2GSZ?=
 =?us-ascii?Q?hthumv04Ylq/YDM9mNeEclxMJqhGbkIr4HKPP5I5rYb2LGgUmg0G9f3/DG2v?=
 =?us-ascii?Q?3WJWHD2yZaQ4n1Mc4AMqfRfvbD/FkjEN4JAqOcKKTcxx1qa/ZIniUn6/9XC6?=
 =?us-ascii?Q?ysyhn/TaqKRW5Zvwv9b0Q2eFwNBFV1QJ9yvm8aEcaMUjP1ogyNPRBAbOq2fJ?=
 =?us-ascii?Q?j1vjBtERJIPJmR2hVkpD1qdvDT5EvQJeB8o6qgAqabP9uaJuWM77krh51Wa2?=
 =?us-ascii?Q?nMLQgGn+QjpSjC8zWyMqn7mY7dSxGkf6yBzh3v9rrMDrLYqse28AU6RA7gpO?=
 =?us-ascii?Q?L1Pbv3LQUU7AFLJxEoVRP6sxQNflOpo0Xrz527Vii9l2sW9bieFH8gQwUHng?=
 =?us-ascii?Q?R/jbKEmkSEY7vrGsyhPqWcnjp3QMswjsqDctrAxLySITprX8tB5C2u06KGjp?=
 =?us-ascii?Q?EXvSy+h8jGsfJcSCosclMids8s1czHC0j2f30nlKPtI4eKflG3eUm8oy9ZFS?=
 =?us-ascii?Q?CzAn+sjqyMP2R07JA6B2Fns8aT+SBD7SaM5Cp1Rl/vFPtEWyI4qhbWLe7N43?=
 =?us-ascii?Q?dMww?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FE8319227750B146BA6F441958552FD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4b4e113-0d71-4ff6-32f5-08d89c4e9ac2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k/TRAxCEm8r7/4G6f6WEmwPNj4+pKfXsLGHOhmvRYGpEC/4XuZVa8Y7lDHt2CxQ9FiMYGxK4r5dxVbN9vbmMR5uuHw/dA3l7rJGmKYynTGNjtuH9PW4w15RY35k+E+OOCZhDgL/SLXAzRzmu97INF2GDXb4JAJUAjCjXzj9vRG/X65/7szve2b7pH6aP1vm9rfO0qbcSJU0iahFV5QqPhs+H3dtl5LfMvbB0f4W9HmXN7OIkgMBenThZq3jbTdtGAeXGIyM0qFZX2KOnz3HT/+8rtxKnMwIJRPG/aZsKifLTn6uFABK87KpvRR3i26oVePPODqxUEsf6ejD3gzJBF3vUNpz8JKORfipb+E0rBWsRT2hEcmjG/o8QuEzz/EPq6PBH0z/mUxu1l1I4ZeGmsA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(46966005)(53546011)(81166007)(33656002)(82310400003)(8676002)(70206006)(47076004)(26005)(6862004)(8936002)(70586007)(36756003)(86362001)(2616005)(6486002)(107886003)(6512007)(356005)(336012)(186003)(83380400001)(508600001)(54906003)(5660300002)(6506007)(4326008)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 14:28:07.7484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a28cf76-8fbd-4ebd-340d-08d89c4ea5f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4373

Hi,

> On 23 Nov 2020, at 15:24, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Build this code into an archive, partly paralleling bsearch().
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/common/Makefile        | 1 -
> xen/lib/Makefile           | 1 +
> xen/{common =3D> lib}/sort.c | 0
> 3 files changed, 1 insertion(+), 1 deletion(-)
> rename xen/{common =3D> lib}/sort.c (100%)
>=20
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index e8ce23acea67..7a4e652b575e 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -36,7 +36,6 @@ obj-y +=3D rcupdate.o
> obj-y +=3D rwlock.o
> obj-y +=3D shutdown.o
> obj-y +=3D softirq.o
> -obj-y +=3D sort.o
> obj-y +=3D smp.o
> obj-y +=3D spinlock.o
> obj-y +=3D stop_machine.o
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index f12dab7a737a..42cf7a1164ef 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -6,3 +6,4 @@ lib-y +=3D ctype.o
> lib-y +=3D list-sort.o
> lib-y +=3D parse-size.o
> lib-y +=3D rbtree.o
> +lib-y +=3D sort.o
> diff --git a/xen/common/sort.c b/xen/lib/sort.c
> similarity index 100%
> rename from xen/common/sort.c
> rename to xen/lib/sort.c
>=20
>=20


