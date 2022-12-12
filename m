Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45C649B6E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459241.716920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fRI-0000zN-QZ; Mon, 12 Dec 2022 09:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459241.716920; Mon, 12 Dec 2022 09:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fRI-0000wQ-NW; Mon, 12 Dec 2022 09:49:36 +0000
Received: by outflank-mailman (input) for mailman id 459241;
 Mon, 12 Dec 2022 09:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tmz+=4K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p4fRH-0000wK-6v
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:49:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2077.outbound.protection.outlook.com [40.107.13.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4858e9f9-7a02-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 10:49:34 +0100 (CET)
Received: from DB6P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::29) by
 AS2PR08MB8503.eurprd08.prod.outlook.com (2603:10a6:20b:55e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.8; Mon, 12 Dec
 2022 09:49:19 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::c9) by DB6P192CA0019.outlook.office365.com
 (2603:10a6:4:b8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 09:49:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 09:49:18 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Mon, 12 Dec 2022 09:49:18 +0000
Received: from cce2b551a02b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6831D843-ADC6-4150-B850-29AB6ED55B44.1; 
 Mon, 12 Dec 2022 09:49:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cce2b551a02b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Dec 2022 09:49:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7786.eurprd08.prod.outlook.com (2603:10a6:10:3b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Mon, 12 Dec
 2022 09:49:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5924.009; Mon, 12 Dec 2022
 09:49:10 +0000
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
X-Inumbo-ID: 4858e9f9-7a02-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVbswB8/Urp7ZIBWvUb6fW+mofcocw+ykRZ9RAWvLnw=;
 b=ie/W7fMajlL8ApddRW/RCklOFTs9XopEpi7qygEAazfrM9osvXPJPK2pJqm5xY6wg7OnB9O4gAZl8q9lvDALQHwDnhih/Ptfl1fzBGF5mz5zra3Kw7kil9bQEOhQGuNF/ZR426VGZFgDut/tKWOgEH2dNZjoVMlHwUoEF8vLd+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6GLtIGWVFUXeen7Q0OOFUYd1hY8v/6u/R04B6Pxevcm4MFzdyCiundAX4Ta91N3VHmI6YXsHtPpeR5oZbDFu+aioMMUBL/V370iFV28m8UwvjrIsiY2pdlP+/LR3gw++PTfRSVicNBUS+HYTU3BqdyZj6UY55W88slaI5YfU9cXuYXrOrlBc7WbrcMcOlgdX8WmZ3MvwkVjokgMoPXB5kV0iXhhK4Da5+VcqISGMF6FMSoYFs2tOjt1ciJciMionQ9TKa6oXmuUNlTLA7I0wmwGdVkgztjLYFoq0Ug0MihE8oj3o8TM5Yuq8YNKii+FhMEgkxOJAkaxT+ndr2wI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVbswB8/Urp7ZIBWvUb6fW+mofcocw+ykRZ9RAWvLnw=;
 b=oVJUBa8uDH/itPY/LNq/Jw5k6fFa7dngLyRaGyyVjoxDQLBp1entUHatcEzv92V+Jqvf8dyslA76X6LLO+1d8nUnMfrFueZxKZBz7z/WpjP5nM1osTaDcpe4rqNz0lMKnwB06c2LngiBYrGiyxojO52wirDzTfkmFJztw9QxIbhHuSuB7ogslJJfZGsg8dIiP8Zh2ZuaiT3Rsuemeo/OZpBNsup6PVD8VnEGQrbWDNu2I+mVTK/vU9ak/lXEJEw8VrXCf0z8YYdfuZshHxgK7OFjcEkoRh8babSwddJFKMTDu/+nEsxG2bYhVrP2zxiYMjAMGCzL7EOzenc8QIXoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVbswB8/Urp7ZIBWvUb6fW+mofcocw+ykRZ9RAWvLnw=;
 b=ie/W7fMajlL8ApddRW/RCklOFTs9XopEpi7qygEAazfrM9osvXPJPK2pJqm5xY6wg7OnB9O4gAZl8q9lvDALQHwDnhih/Ptfl1fzBGF5mz5zra3Kw7kil9bQEOhQGuNF/ZR426VGZFgDut/tKWOgEH2dNZjoVMlHwUoEF8vLd+M=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, "ijackson@chiark.greenend.org.uk"
	<ijackson@chiark.greenend.org.uk>
Subject: RE: [PATCH 0/8] docs/process: branching-checklist: Update it
Thread-Topic: [PATCH 0/8] docs/process: branching-checklist: Update it
Thread-Index: AQHZDgzxszkPiUX7D0CG3WinrLbsgq5qAQ/A
Date: Mon, 12 Dec 2022 09:49:10 +0000
Message-ID:
 <AS8PR08MB7991A0C040E47BD98123953792E29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221212093410.36289-1-julien@xen.org>
In-Reply-To: <20221212093410.36289-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 06CA0E74C5E8C046AE19036016206F16.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7786:EE_|DBAEUR03FT022:EE_|AS2PR08MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: 1976538f-b7d0-4458-b0e5-08dadc262376
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /U4lq43HZKEcPev90O6+pmfFeRNCceW9DpM+F+Kvj2GRSnYzdLgZIbY3JY3BMmBSFWXYvJPfYRgZbol0WPh1IildeB4tko9jAhZMmRc+GEE7c07YgJV4tjyQUQTOAESr71/IoJ/+qetXdW3nYGfoZdV9dmpyJZ69KUdGlXdD69pgbq2vXS1+91KkBSKUOXrTRumH83xFXmnNkxvxiR4CXlCWb9InwxgEqptqEFNkPVIoq793PmhBqilk3qvvcv7DlAMbuWD5gZ0ESM7nnOFzp5WH7OaFUorLjXBCCeVZwUUnmqyFsCOpu6KgwaGMzzayJaAflFP3Gs4sJgaLHIEXq1zyzFwRW8pHSYMJTIUNuBzntKpjKHf65Q4TSXEy2C+m8q0dM4Q/QvzHvaoN4gkUP03U6UcHNtYytMZAvaCWvDnICysrQctP1l83rVuDcoLEpCCthrlajwsnPZdlgwiW3h+DkL0bf9w6kK5zlmZ8L5UAzYzojHY+vSC53QnQbzDOAYVAZgGgYvxE1u8k4grrVRnKYaFJMHvDMW2Vn8qGtMQLktcqQq7+hvmwhwBgty0cvIA18uUzAIWAH8/TykFRTTSex6+6dDNH7UvZ0Jbtb8+vt8l7AVDsRcPT/E7NjrzIWmq9LAYzKREF1kUulWMnXuSN+uN4Qgzmv+6l3eHzI+eHBONa/igD8BkjFqz7oZWj19jmnHYQoKXdClAfAW8XyQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(55016003)(6506007)(83380400001)(7696005)(478600001)(9686003)(86362001)(2906002)(33656002)(38070700005)(38100700002)(110136005)(54906003)(76116006)(66446008)(66476007)(66556008)(26005)(71200400001)(64756008)(66946007)(4326008)(186003)(8676002)(122000001)(316002)(15650500001)(52536014)(5660300002)(41300700001)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7786
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52985959-b69b-4cf1-c187-08dadc261e7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5bQofXwB31sUD7CkziTMOifmNjXNfR3aHlbEOUcOOsj5BCyvxa0tQg7XOhyRUq12zECX0l+vGbOOICfmBmbqXUdcG3rksS/k3XwcAAVbGFgTTnZ29xwWhywl/Wn7abbxdFU3djm05oxqotYewKAX5H1IImfObm3G03YR+fl6KPtegl44eEEveKO2+5Fi+qvVrojk3aV4SfCQY3LlZ2CPaCeYJz6gwE+yGLDZYhHI7wSgBjX3kdvypp3RumdRrWnShkpn37rA6OVDfBzOHJy/9tLODddAIOkODw8+owWJZEcEXAFXYlR2L66CWcxwuP//hSkFZ0JzIzIbcMTsJcSrnc33avi7ljzjWVwDgH0WAPW19nP5WBumkC6u47qtWUxD6lZg2eLa+aowXId9G3+fpUfSzyz8KY6Zu0kdFFn9DeDIeK0aJqHHFEeRh0BpwJ+TAi/7L4FpJs09z/2xOZpoKMY6un4gg20ksXQKx1XgrQ3VSPeAz6muUQxK79P8tmq34hwcBWI4IMTq30iOZaVkSGGqUYFf4Z7qi3LcakT3Smlg2vanUmKw93zRue1N00Xd+anJ7coMc6xy/DmibYCR2ZpvRI5Zt6an3Vvc3fP2H+fSHF3Wyr0mu9w1SQeVRxbt2MhTu6BM8f3Viv/DXELpNnJvmPtNZ9r/cdnhTQSfesyADC+2NJjFoGyaetzGCpiTsQ5O/4+itxSzSg/RcBM2ZA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(55016003)(40480700001)(82310400005)(36860700001)(6506007)(336012)(7696005)(83380400001)(9686003)(478600001)(47076005)(86362001)(2906002)(33656002)(356005)(81166007)(54906003)(107886003)(110136005)(70206006)(8676002)(70586007)(316002)(26005)(186003)(4326008)(82740400003)(15650500001)(8936002)(52536014)(5660300002)(40460700003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 09:49:18.7570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1976538f-b7d0-4458-b0e5-08dadc262376
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8503

Hi Julien,

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Subject: [PATCH 0/8] docs/process: branching-checklist: Update it
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Hi all,
>=20
> This is a collection of improvement for the branching checklist.

Thanks for this work! Since from the docs/process/RUBRIC we are having:
```
They are living documents, and no special approval is needed to modify
them beyond the usual acks for commit.  They should be updated as and
when it seems expediant.
```

I don't know if my reviewed-by counts but I did go through the whole
series, so for the whole series:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> Cheers,
>=20
> Julien Grall (8):
>   docs/process: branching-checklist: Use consistent indentation
>   docs/process: branching-checklist: Remove reference to qemu-ijw.git
>   docs/process: branching-checklist: Remove reference to root
>   docs/process: branching-checklist: Clarify steps to add the branch in
>     osstest
>   docs/process: branching-checklist: Reword the section about Config.mk
>   docs/process: branching-checklist: Remove section about the cambridge
>     colo
>   docs/proces: branching-checklist: Update the section "add to patchbot"
>   docs/process: branching-checklist: Add a list of accounts at the
>     beginning
>=20
>  docs/process/branching-checklist.txt | 122 +++++++++++++--------------
>  1 file changed, 60 insertions(+), 62 deletions(-)
>=20
> --
> 2.38.1


