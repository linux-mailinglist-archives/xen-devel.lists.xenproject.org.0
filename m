Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D555987CE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 17:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389663.626746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOhnM-0003Sd-PZ; Thu, 18 Aug 2022 15:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389663.626746; Thu, 18 Aug 2022 15:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOhnM-0003Pb-MR; Thu, 18 Aug 2022 15:50:56 +0000
Received: by outflank-mailman (input) for mailman id 389663;
 Thu, 18 Aug 2022 15:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLbC=YW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oOhnL-0003PP-2d
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 15:50:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aa650b7-1f0d-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 17:50:54 +0200 (CEST)
Received: from AS9PR0301CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::35) by DBAPR08MB5702.eurprd08.prod.outlook.com
 (2603:10a6:10:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:50:51 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::92) by AS9PR0301CA0006.outlook.office365.com
 (2603:10a6:20b:468::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Thu, 18 Aug 2022 15:50:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 15:50:50 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 18 Aug 2022 15:50:50 +0000
Received: from 68c2dd1976a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 616EDB4F-16F4-4F67-9535-9EB486CF5F9C.1; 
 Thu, 18 Aug 2022 15:50:43 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68c2dd1976a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Aug 2022 15:50:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5202.eurprd08.prod.outlook.com (2603:10a6:208:166::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 18 Aug
 2022 15:50:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 15:50:42 +0000
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
X-Inumbo-ID: 8aa650b7-1f0d-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fKYha+gg3tKdUDy+yvs0+hsdBpxo1xyBi5S74hAkl+mPYLH9uI1tKGcz3F9jQ7NTaPXGTyxNirhz+JoM+OMTK+zm71QMILgkxl4f73E9q4uul08C/zNT4u6WKtzoWlSDT61zeGz3bLmmGRTEEkY0AVn7C7KT1FJT/PGLJm6KRTAdYZs817RPx6NVDgrGebYzhebNuNjG7ptufNkf49OgaTiWSUZkD0LF6lPZ8X2WT9C2WRzTueM2THk7/t8XItNy8Iuud77WBrlrSVPrWChZ66WVz/x04DEuDdgEsZwRtA0IA/bSOT5oh72PGXjpck5xs6fkUrKuF4ImOdpiO8289g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucRyjCWzIV/kcdluUxKTf4R2mXjqu7ArjFcEA4o+VJk=;
 b=h4Y9ecBBmQn6ETGGxUJkUNSM7UECI9pS1RSVFKdwZ92Wfjg80Jj/Ra8/Jw7J066I4BIuK68p7mEncL19HIgfnjUgM77aXFXp+xqaG7Hxxct4DFAaMzyLTg/6bbc3K2W0BAzXz1GNYXluV2hXFMKDJYGR44cDlD04/jXQadMmKFAjWEevbq+6VohpiOm6GAZpWc6slmu6Oi0QJx30xsCBgatFar1Sw1g2h/FgdNtdKJHdGwpOvewEi7j/aZHaPAtNhmLBVbSIANpA25cJLY5HQ0PXBdLC9zNCfb/XJ71NPXJQGxd+duUC6bc+et/cw+DCuhRO5ewzsWCNUCKdaOdEMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucRyjCWzIV/kcdluUxKTf4R2mXjqu7ArjFcEA4o+VJk=;
 b=7VVVGg3MTbSua9/q3yixO6aF5kJAFmOJjLemqUcLA2tAxrajw1UGDmhDMpyvWynE/W6ICd+jMtYRyi1xpSobFLYsBNfied8waZrkDKZNJC1Y1272n/7DnOwTFOuMfKTRQBAwHiaY+WsIM5RSgKMBMWNY+/4xEHUjcKeOagrZ2s0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ec138b937304e49
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWNYkouRa/WI/IF72qWTnUNcvRHig9w8d4+B9ahwob3W0bF5ihHxH/Cn88QW6QcsJoR9aNtmKEaC7TZoyWl4o/3kixj7J/+lnAwzbQHGWLejfHG4x6vgJKDA4CRTKGfwxFeLhjwJbvb7dcUG/RALJ0REtLiJri6+q0v3RCi1kwQsP8kQlnVTX+tO8XCGZfYVmyxJLoTYag7sU7Xod74EdaMCDo9MaiFkcw4r1Kpqty1KN509AjejE958dwVy5Ai3kbg1HrU18/pFxAiEpesCk/8bY5HDCf5xvV2uMJvExRTJll4jAEbTltHzdIyUgHatg4YuE1NjKuo4sB4eQ7pALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucRyjCWzIV/kcdluUxKTf4R2mXjqu7ArjFcEA4o+VJk=;
 b=jhVSmaAmV1MeLJ+3sbH8q3teDiEYirp1imlkjJ0cK9yZYgJMeq5ACHEfpnnu0pzjFH+5WaumQbHGdixd8G/mBmmGaUDbeZ5Obvp3tTjtLZjRbuBtFNulgGUE4C/UimvNs8YuMsg3jG3r3y/Qit6uSuEGvM9Xr/GOdo7G9ACcq5c0nZ6ZhksKeOE6/RSDcYoXP3ahkdW1ErvlXcGz5X129y4bMno8qtXmfOxTdE44FWKbbDRcxYfUGMvCp/g5SMuy6PFrP2qNM9YSPwso8nzQb1srbnblGQPOtXzVLlDwigHkXFJHjDX2ZGEa3527HsJVciBKL80putdLfNoO+qchuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucRyjCWzIV/kcdluUxKTf4R2mXjqu7ArjFcEA4o+VJk=;
 b=7VVVGg3MTbSua9/q3yixO6aF5kJAFmOJjLemqUcLA2tAxrajw1UGDmhDMpyvWynE/W6ICd+jMtYRyi1xpSobFLYsBNfied8waZrkDKZNJC1Y1272n/7DnOwTFOuMfKTRQBAwHiaY+WsIM5RSgKMBMWNY+/4xEHUjcKeOagrZ2s0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] automation: Remove build-* from gitignore
Thread-Topic: [PATCH] automation: Remove build-* from gitignore
Thread-Index: AQHYlf2h3D1pYVHMJUWskUaBieWyaq208g8AgAAWf4A=
Date: Thu, 18 Aug 2022 15:50:42 +0000
Message-ID: <7F650359-E32D-46F8-BA69-A9DE3A1C3224@arm.com>
References:
 <199cc377eb38606bfa4b33942f0ed688080cf535.1657636714.git.bertrand.marquis@arm.com>
 <2682b544-aea2-f3a3-48ae-4ebb03ac0acc@suse.com>
In-Reply-To: <2682b544-aea2-f3a3-48ae-4ebb03ac0acc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 61a3861c-7141-4362-bb42-08da81316d04
x-ms-traffictypediagnostic:
	AM0PR08MB5202:EE_|AM7EUR03FT032:EE_|DBAPR08MB5702:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9Lj81+5orKIgIzYWa4gzZEnAUlKPVasMf1by4XK+sV0loAOiTuZWHasB9e5dgU+oL1VZ+0R10xI+XBgIpRIjoBznTPuMZ+GXLY/mAjX3lJKw1qqvdsP28r5ljRFRLC+MOBTwICRaUd9bi3h/8DOddRuqMWE7kiItuWHo+Tj6bBf+XAS8IaQehhPywY84VwAjsjg4kFR/tUaNHBAHVh4raH2YoBVj69Fj274RA6MraDwqm9L4GhE0K/ercvMkW6GvGbyNssZ4/pA0imr8y7yTW2gyKOIkYCFR8pAVHztw999S+Um2BqnJd4sj2Sq0T/6LXC9NlbsHimYuGTK8zrUjJea5ZreqpOUJGX6JzO1Y1hS4Mb8jsLY0R6aDGIMbT4frZZ5oua3O/47HKE+fKhx93KUG9/uyX1JsNL6Z7ciQMX7wSi8zqDBPXpcRpKdBT7M+qjNgBg5jPlROdkHoftvePHK0QwM20Um3KKGKZYd2GmyZhrVMKQGLAwULFOY321tEgbP9FnGREoQq5B3iVHrWVQq2Fit6H4HeqqZcT20A37n0XQUx0elgkUVMAjeZzCJKBRQQrIrEhGqf7TJ7Y+ZZ5qCoYdFwwA1LEVWYE8+JCZIfG/ol7bIridEFQ6GVE/dwfNB2L9VtwZwHBdRwjoaPrCqi+EYvVSTXAkkzXCGvYo557fkwbLpykxB0ivx3hG6kk0KffNogySHgcF1OGO2ftHnC7RdZADUmzFyOb4hFyEotgXtY651zrJmklbuJa6mdSLLR8ccMFOKec+eoKKom/tJP86izZXwr4nAO0FfI87wj89KZiQY6NHC+O3T+GVVCZQnXmGKcpMiw4n4wQVmM+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(8936002)(8676002)(54906003)(186003)(33656002)(478600001)(6916009)(66446008)(66476007)(4326008)(64756008)(71200400001)(122000001)(66556008)(6486002)(76116006)(91956017)(86362001)(2616005)(316002)(38100700002)(66946007)(41300700001)(26005)(53546011)(6506007)(2906002)(38070700005)(5660300002)(6512007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <71D059DBFB083D479B0540ECD0D94EB8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a385d7b-e3e9-4ede-01bc-08da813167d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l6+Y1+k1pXIVMXLxdROr7MFyU33cSs3Tu+8K3jpIxLBeJowl1PeLCl8HCEg3Ps2txJONk9rBapATuuS8A1VgMUXmsSs8n2yu6tYCKRwTOFhzcwPPHigPuMpZZRiZFHsE1ckx25OQv0UHc5O/Zka/hTas8sZ+BwR33/C7Xf4phjKiO7IiWEv3gxwqQ/XKqmid/uYvZVmjPkx700gKbKNiGy3PI47UYI9ev5MixoBNxKhxYSxageAoc59/BDKhLGcBnqvwngTpo+Aik7jHQaJsqneanTE0JaC47vT9mxl5Hk4UZilc2kgs4tOnYvNHYgXjz6i1SRHQ9N97tiHzFQlzriseLpzNtCG0s+v8gwu4npHfvhoOTKOk9SIgHsRtI5aLGebiyfwC7sQ4E8lz75yTtbujqaaVxKCptm+vpruMNz4hvc4fg7hjiQByCjAtTJ2bQiQi19frQXunD9g1Vn5azRqBdUbeO5TJMZ41Vyc4u42xwdud/JNOWyymj0FdOMRlHsDBs5LvKbsZ6qgu4KYkCX1qGEIydb50y1NoSuL56PAqJirMIe0tEGUqwxSXoipiDAY5c+M4fY7czsHZT2ftzqzWEXmPphklIuWKYRhF8VrgEjQ5+uMqKXBW/WV9X0XSbCEMY54RgnPQ73LzP/+VGAUmqUllfo+gblvPYzMsUF7pTAZTR8whedu33zoQ3bhqlqj8bqzcER6YxijoZQdJIDcGUo38PnWGy1YcsWpza2dAuCp0IinUzMLPu9hVBl5W55poRDarFYQs8BBKfM+cbXkJmUfSPPQg4ocXRJ56p8Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(40470700004)(46966006)(36840700001)(356005)(6506007)(54906003)(8936002)(81166007)(36756003)(36860700001)(82310400005)(82740400003)(40480700001)(316002)(6862004)(6486002)(8676002)(336012)(478600001)(70206006)(53546011)(33656002)(70586007)(47076005)(2616005)(186003)(40460700003)(26005)(5660300002)(41300700001)(2906002)(4326008)(6512007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:50:50.8285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a3861c-7141-4362-bb42-08da81316d04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5702

Hi Jan,

> On 18 Aug 2022, at 15:30, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 12.07.2022 16:41, Bertrand Marquis wrote:
>> ...because there are some scripts in automation corresponding to the
>> entry (build-test.sh and build-each-commit.sh)
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> While it seems odd to have this simple a patch sit un-acked for this long=
,
> it looks like I'm not the only one uncomfortable ack-ing it without knowi=
ng
> why the entry was there. Old .hgignore history only tells me that at some
> point build* was changed to build-*. This recent mail from Andrew
> (https://lists.xen.org/archives/html/xen-devel/2022-08/msg01043.html)
> matches my vague recollection of build-* being used as sub-trees for
> building stuff when out-of-tree builds are possible, yet people also don'=
t
> want to build in an entirely separate tree.

Thanks for reacting on this, I should have pinged in fact.

>=20
> Hence as a compromise between keeping the status quo and deleting the
> entry, could we go with changing it to build-*/ ?

I must admit that not knowing why it was there I could not suggest how to f=
ix.
This would work for the current issue so I am ok with that.

Cheers
Bertrand

>=20
> Jan
>=20
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -44,7 +44,6 @@ config.cache
>> config/Toplevel.mk
>> config/Paths.mk
>>=20
>> -build-*
>> dist/*
>> docs/tmp.*
>> docs/html/
>=20


