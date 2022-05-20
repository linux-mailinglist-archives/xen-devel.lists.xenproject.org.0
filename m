Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301F552E988
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 11:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333654.557515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzPh-0003Ym-QS; Fri, 20 May 2022 09:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333654.557515; Fri, 20 May 2022 09:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzPh-0003Wd-Mf; Fri, 20 May 2022 09:59:17 +0000
Received: by outflank-mailman (input) for mailman id 333654;
 Fri, 20 May 2022 09:59:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dhdo=V4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nrzPf-0003WW-KZ
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 09:59:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8095aad8-d823-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 11:59:13 +0200 (CEST)
Received: from DU2PR04CA0062.eurprd04.prod.outlook.com (2603:10a6:10:232::7)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Fri, 20 May
 2022 09:59:12 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::17) by DU2PR04CA0062.outlook.office365.com
 (2603:10a6:10:232::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17 via Frontend
 Transport; Fri, 20 May 2022 09:59:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Fri, 20 May 2022 09:59:12 +0000
Received: ("Tessian outbound c1f35bac1852:v119");
 Fri, 20 May 2022 09:59:12 +0000
Received: from 84fcb394dee6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B341E55-FDAA-4014-9E52-E2A3C6D20A90.1; 
 Fri, 20 May 2022 09:59:05 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84fcb394dee6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 May 2022 09:59:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB4203.eurprd08.prod.outlook.com (2603:10a6:10:ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Fri, 20 May
 2022 09:59:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 09:59:03 +0000
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
X-Inumbo-ID: 8095aad8-d823-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dfMqCYcKt4MJccWxSakV/MgMAn2CL8n+bLQPjsF4jgySUDgfKNkHHXQ5++42fGUviM1Yt+r6ugcEuB8JxUL/ahJNb5SGwU3PxlbpvBFmaTL8EbK8e53NKY1Om/AU/QMce5QdBjRP/JcmKXcsWbE57u9cactOq1WTF5G13jXnIbXCDcY4qbZGf5KlDkA+MQqajO5ObEKKDW3ZbFZsPav4uJkWhn3l7zkRu69tcHPhqssCmVl4u/NS9mef5/kml++edgOA8sAvsej8B1h2YRRLTjUOYhnNM7ls+H9og2I/QaFmNasS1fleUdijM5EHlCHieV+NRpnULnpJCRRTVZpcug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PW6L+UHr0I4Egz+Ef+UDCrUa3rCGJEm+zZMjtcVPBw=;
 b=MCUbN16Oo0r6DCn1bFDS6z6TPuptjwyIOWTI4IBbuPEuG4egzcnt1GejcoqKq1Gd38a+ckN0XRz9FsBRAWKp9d4sG4JQZnVInuzFOfVezZVXyFpoA1yAUfqMFsJO4iU6woJmOf0/FjbyLN4RZblVs2qpFotZgV3aZFp1s0Ph7rjg3WBiI0OSLIhkhkstu9D7/GyrE9ReIjLwxv9LiaGFaV/4shb4iel+viNWumZgfz49JhPT/6mlQmlZxPuxjszFT+IfOtSFNfROqNWDE2w25l01uv0/0WNWFVH+/fj6eRsCEPyhBoyTAjLQl8fPG0M0ANk3wVy/nPHzp+XvMOUfzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PW6L+UHr0I4Egz+Ef+UDCrUa3rCGJEm+zZMjtcVPBw=;
 b=OnGsoyAfOQ7q/n7mqG9mzJXdU4XsQd95XKN2Kv4Ivw4trNZYUpdPYateTEujSHZghWgV9JxwIsC2k9UM54mEzcRyihFPj0YTFJeC5LrTdSoasz2TxaSs9I0ezoQ19kr7/zq4q1qypO7HFwpEUMnc/dz1Hsgbe/4bDt9yM+vE6bU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb779eb9896c884a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFZhVLWWqGp1GASt3GeGFX2RGyVy+MDrrmRv5Txe0Wv1YaO1RX+YJpj0plVja9xIgbLp6TxZCu0MEAFPE2rTYnCHk1/tzE9S4dKm8SF/ke903Y0wsaMWJ9xkHqRW8HX4GYuh0S89LBRCHE8gYlgZS7DUy8auP68Edu4FF31J8+4HQXplJTz583pba3HGN8N2CQuvEbeV+wwNQYAjT7hFWTEDlZ9VJeWnOtBFUF594XmHJsCEdPUSqMaRCzCg8EioiGflDqj8zpiOdpmo35P0a8JTUoIBpy+OOd0DnTNj8P4Qn1B/jSgsIHAJDldJg3W6jOFdsGEZTmPomFF2uMiJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PW6L+UHr0I4Egz+Ef+UDCrUa3rCGJEm+zZMjtcVPBw=;
 b=hUdHQOyBn3eQooNRjwVdJl/aL8MODr7D0lSzpq+S6nbYM3v5Fsm8J1NTjgxq3/k44yFVvOf2zHmpGycNQpWNc8CWzv+Zr9Kf8lg5JV/jhyG1QJ6ndgUDM4hCoXbMq5O++5O6Uc+BGOdC8leCI5gGNUJv6dh6+UCAeEiTakS1vrZRMWwSbs3XrXPdNQJzAutIL2sO34wyrNaHLbgyTX8Lk3/DoEnP37qwPV6JcWMX/Q2uGkeROdeSvAfu2ZInUw4jYJmQYPJ1BYuB55mS9NZCWweegqBxlLIEoQd8HHILEoM3qMd4QJPFtynlFvWyifAq1vDmni0Z9SYhspq+36KBdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PW6L+UHr0I4Egz+Ef+UDCrUa3rCGJEm+zZMjtcVPBw=;
 b=OnGsoyAfOQ7q/n7mqG9mzJXdU4XsQd95XKN2Kv4Ivw4trNZYUpdPYateTEujSHZghWgV9JxwIsC2k9UM54mEzcRyihFPj0YTFJeC5LrTdSoasz2TxaSs9I0ezoQ19kr7/zq4q1qypO7HFwpEUMnc/dz1Hsgbe/4bDt9yM+vE6bU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <Michal.Orzel@arm.com>
Subject: Re: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Topic: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Index: AQHYWWqn4igAeGv7Uk6q5mD33SrErq0nrOiAgAAAuoA=
Date: Fri, 20 May 2022 09:59:03 +0000
Message-ID: <185A2E52-AE50-4914-BCED-3E0831EF3A8E@arm.com>
References:
 <8a8ffce11591efb284c93214b77534fa4e4134b2.1650976647.git.bertrand.marquis@arm.com>
 <69ec386c-6d2b-635a-0d8a-b72afe09f579@xen.org>
In-Reply-To: <69ec386c-6d2b-635a-0d8a-b72afe09f579@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c0c86be3-c5e4-40e0-9dde-08da3a476443
x-ms-traffictypediagnostic:
	DB8PR08MB4203:EE_|DBAEUR03FT014:EE_|AM6PR08MB4408:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4408C1026AA691200B0FEE449DD39@AM6PR08MB4408.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Bf/qQnKOPANz/wALAySf0NGNXhQcbER3I9XquZVduRjzbJ7P8M9YLVWSSjZKBt6oHfkbFtNGMbn8dwlGfvBVMEyaSCTb+WAgAv7U1lIe6b9V1IaZ917LQSQRUhDLSJOHkllJeb96joFxTSK1mfLMsraVyoKUrzd776OGgTT2yc6FN8hleI45oraNxNqSdeu3mEw7kURQLTXhEPRc0smlA+olmxtTv3hUVhnJv0WvWGovhbvzS0AAm6x5MvD5E9XXHlxKQUUDVTnri8dRwuD9mfBk+2BBANf3lNo0T20huhXIDoJ6f1VKCK/j67ha36W71u6QTZIfrb/768zy9iOi+WrBTJbX4YKNdu5Vm//SK5ox9m0kG84RrBcggdgsBzJX733M8sh3yDAVViwyICHeDie01kiHPBnzVDNUEJ6uWDocm5D6u7GZPx+yqIOazEiPneG00droVLYB3TQmeOAkN6UYJ4cZbiSVLlcyuyBkm9SLTIvKjQazyc88On8mrAJb9lG3szjflLedHnGJI/eW5awUq8v9FFYAbZ9OgIVmP9HUcSE4Ayw8ySSc7v1frGHTkdnJKroNvsTLgCBpV45lOk/U56QpfTiWPg0HRZyEyHHkEJ7ZCf3H9P9jbYekcYdrnDrp6NM4QAaEgICPr9h5N/KB7sIvhrKBhbKhdExeMJVpQPotlwEidSCGziwLVZigFwt0+9Yom7cp8m/qK7OqPHtN87X53kPfKA5VHajKqWiBxArC0ssT3idInepNLNXo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(508600001)(316002)(38100700002)(5660300002)(71200400001)(86362001)(6486002)(54906003)(6916009)(4744005)(2906002)(8936002)(76116006)(66476007)(66556008)(6506007)(53546011)(91956017)(64756008)(66446008)(8676002)(2616005)(33656002)(186003)(83380400001)(66946007)(122000001)(6512007)(26005)(36756003)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B113AECF16BFAB44954E2C333204901A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4203
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8e1c5ff-7af6-425f-b739-08da3a475eec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wu3+d7ISfK6ebUmQyVNLr4N5IFLmveUS5CBxFDWaxgenFJrtrDtmp+l291p3cJ9JqHGanLzQ6Gh1LKiWz62d/5EMrhv3h0OLKz3cRdvwMyqk9guqOeuCt84uYuiSb/5YbpuKIdghJnVmA4p55M/eXWyaCwLty3Wr4JiiysxHQuwrJbHbqDO4ilvGqvy1L0EUeT6WYcrgwkPG5x2izAvf+mTO42RM8SYarwMCQmXHnXrGoo4VKgBZG+XHR4bRQF7tAJ+qf90jQn2i6AkJA8RGANShI0ks45wa7tpQ52IjNSlV8EfaBpJr0tCQUi1IBeqqgLocVlRh6Xv/c8DyPV75J2pBXDq44W+lA6cr0MBiSeP606qpvidV+Ly9uJ3xZSBS6LA0NLbrVrdOJbJcqTsKukboQgMw8ahix/CT5fK7eqaokNvjhNSxEEqB64NZhvzI4bJYEL5aLzTGQ1iMCMdtGFnC4lFDZdJCNirJ5jerKeoKO7hE5vja4CD6kFO4p82kqt9onWce0zFQP3auuzL77+C2GI1qTcXbH2EoGlSh8+2IQTg74t0yg1gFfGxBlkbjepaEKXjWr3mYJTrqZp/KrwEf0Jd5YsshvR+KojUSrGpDOfTRW0RmlXzkNiAinqgPruSJZ6HaqX/dWNw3PRt0MsKOjJa4oMxBw76bcvVaxtVjdO6bRBnIcoMr2yoW15kq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6506007)(8676002)(2616005)(6862004)(70206006)(53546011)(33656002)(82310400005)(6512007)(26005)(36756003)(83380400001)(4326008)(70586007)(36860700001)(47076005)(40460700003)(336012)(186003)(5660300002)(356005)(81166007)(316002)(86362001)(508600001)(2906002)(8936002)(6486002)(4744005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 09:59:12.5432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c86be3-c5e4-40e0-9dde-08da3a476443
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408

Hi Julien,

> On 20 May 2022, at 10:56, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> Since this patch has been committed, I get the following message for on e=
very build (make -C xen):
>=20
> which: no cppcheck in ([...])
> /bin/sh: cppcheck: command not found
>=20
> I wasn't expecting the build system to check every time. I think...
>=20
> On 26/04/2022 13:38, Bertrand Marquis wrote:
>> +cppcheck-version:
>> +ifeq ($(shell which $(CPPCHECK)),)
>=20
> ... this is because ifeq is similar to pre-preprocessing. So it always ge=
t executed.
>=20
> So far, the message is harmlesss (I can continue to build) but I think th=
e check should really only happen when the target cppcheck-version is execu=
ted. So can you have a look to rework the rule?

Sure I will push something to fix that.

Thanks for the notice

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


