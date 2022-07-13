Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FA05734CB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 12:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366486.597286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBa41-0003i3-Oc; Wed, 13 Jul 2022 10:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366486.597286; Wed, 13 Jul 2022 10:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBa41-0003fX-LE; Wed, 13 Jul 2022 10:57:53 +0000
Received: by outflank-mailman (input) for mailman id 366486;
 Wed, 13 Jul 2022 10:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKIO=XS=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBa3z-0003fO-Vs
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 10:57:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a27e5de3-029a-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 12:57:49 +0200 (CEST)
Received: from DB7PR03CA0096.eurprd03.prod.outlook.com (2603:10a6:10:72::37)
 by DU0PR08MB7591.eurprd08.prod.outlook.com (2603:10a6:10:31d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 10:57:47 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::72) by DB7PR03CA0096.outlook.office365.com
 (2603:10a6:10:72::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11 via Frontend
 Transport; Wed, 13 Jul 2022 10:57:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 10:57:47 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Wed, 13 Jul 2022 10:57:47 +0000
Received: from 3d49880b7065.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 522FA513-5E9F-4DC7-8C6C-A3B4B05C35CA.1; 
 Wed, 13 Jul 2022 10:57:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d49880b7065.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 10:57:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB6736.eurprd08.prod.outlook.com (2603:10a6:102:13e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 10:57:38 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 10:57:38 +0000
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
X-Inumbo-ID: a27e5de3-029a-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dZfjOlrAjqXnWHFn3sSxZOUUMxOFvfJRrOfOe6ytoaqY7TQWNx01SI2ilHOKL+fSbLxmD4rZmOaS7w/Jzsi8nb75eDcRHdo6c2DBc2z3isHv0kuR23NWV/ALBvz8VlZBu+InzJ7HjhFK8Plnt85PQ7h1cOtmrGtmrFwGDjtqIZ3vOigY4IfVopGrjudn1m5z23tV8yLnEPe8D7yKqMATaBOMX0dAD+wCHyLsiJ3GfGdnJ/xVD/zo84A/HnZw+wJPfSWnTFgmgxWt2q5pN2o9QFv0me6PpZt5xHGmqrByO1uYGXmPlj6I6luxnZ7mQ7qStHUoL/bS2tOQ4eCFJ6NEjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCmnoGlduf3Wjof3Fd/mchffRshtX3rIq+qGkCBrN+I=;
 b=IQ8bXkU3j1kKVbBfLcxfHHuBUfEQxqnvUFOcC/jYm0LmnCpBZC4kGz+5sM3oay3n7ddEWi4PhBeXhAu7p5c+VToM9bEvtAbdoJsNKJatjCvYwDTBo1+rFl7nlLpof4gM8N9m5HTKUMmOA/l557kUHtz/ocog5i3/dTRrX9rFUX96GkvDZpKI4QpNN3cnxrGF+k5UmOAlRA82FJcp8cGp7qvcBeMj1PQ6bYBOUPs6PwattXTshKP4fBX7ckzn57np/P00s1G7T+IVNgiEeWD5F5Qv/sc3qobHJoTtDMCV6MCfaSwYVdtr3fifdj14gFBR2zGHpMLdwVnmEuiv/kBmZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCmnoGlduf3Wjof3Fd/mchffRshtX3rIq+qGkCBrN+I=;
 b=aRDSq3+USKV3yGgI/m6T5WMLtkPeZ/V1w6twlNkG1Yq/Ufrm3LH1wY4j+XrZ3SMzc6gZaoECkjbWdEzzd6CY7evfTFyeylPP7fFu6gejNnhXCI+WJYncRKEwMb/vjdX4lycdpbd47pstxwYqbdpCHT9WJuCtv20UqSJLRhtY7+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejEKUODl4GirKhx9OB1Au/ONBGyelpu/IZl7Q43x5eLb8ArfgLbFxSPiKdyGE5sTan1aOvzhnLQna5MkxTSzjwb6+Aqw9ss+aqwlsGLt8bdlvpS+woKrMHPDGTNG8Jvj4k7rTAu8vKlvY5gDCwVmOCXFK0PPFBPHs9MybcrqzXgW48b5RcSGH6OpJDhckeW8Rlk4KMacrB5AG2lAybzx7yBywscTofts4WHE5H3uRjJqFQq2lmHrfuVE10FEs+lsft++X6v+TTe38aJYUxctRQpYXBXToD8k8IAMK2S78zuZQuQp1AYyOhx1fUPDSMfKGohu9YGcDpXkWsSEW3Z3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCmnoGlduf3Wjof3Fd/mchffRshtX3rIq+qGkCBrN+I=;
 b=Z+zJwqbLNs00W5dkok7ezqhvetvvXCZ18ufJeM9oI4YHSCLJLPlf3xE8UIMDxa1s+y8NW9eGIIxTfV2vuQNj13KPM6AAdBHvKhOlBaEcwCAqL5yCTdbjhMw+AHeIDKOfMA5PC/0jh/laxNmSQRwlL8aar8rRuDkfgD7I0Jk8Ou1B4685QrHNB4m19c6emZ6boMFoTMMMiwLphxZT3QhnntR7OWcmOX7UvCdA8Yoyih9C/sMfkGkSV/m2TudiN0NQLnYmed2HHW/KlLjK+nodjYXI2sU0y3reG2mUKmkHDN2SA8aq7JeefXuYHETjA6DMHxGoySj2CZgNjCY1Whz/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCmnoGlduf3Wjof3Fd/mchffRshtX3rIq+qGkCBrN+I=;
 b=aRDSq3+USKV3yGgI/m6T5WMLtkPeZ/V1w6twlNkG1Yq/Ufrm3LH1wY4j+XrZ3SMzc6gZaoECkjbWdEzzd6CY7evfTFyeylPP7fFu6gejNnhXCI+WJYncRKEwMb/vjdX4lycdpbd47pstxwYqbdpCHT9WJuCtv20UqSJLRhtY7+Q=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 6/9] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Topic: [PATCH v2 6/9] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Index: AQHYktrGVPLQPv5uj0Cju/uWI8P+lq16z5KAgAFVoUA=
Date: Wed, 13 Jul 2022 10:57:38 +0000
Message-ID:
 <PAXPR08MB74202A2BA8E612AC355A8D199E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-7-wei.chen@arm.com>
 <357fc6ee-3014-4be9-9bf4-60669a4ca914@suse.com>
In-Reply-To: <357fc6ee-3014-4be9-9bf4-60669a4ca914@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AEA303847BBB0040B77DFB5099FBFDC7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f0e97da3-5bb9-4e04-96ac-08da64be85bd
x-ms-traffictypediagnostic:
	PAXPR08MB6736:EE_|DBAEUR03FT022:EE_|DU0PR08MB7591:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DNJeCoN9YMsOHyCHvPPH9Y8FcBMnp6CMQXm9DIxYey+amM4EhcJhvsMzmBT4FT3vn/g8qT+D+vEEYdgYwRfHGd5MY32MGI/tVFvPn3uax7c3Zf4mTttJ4GqysslRe8peTib2k350HN988j2kPG1uRPCiPwqU4ryzVn7GnFuB3uWRmVYXdAw+4SOLG5SwoLM+YxU0z0KXt+HMhQaJWDWsHdYD9weDIHqGdjBrCHhf4PqKaRh69nRWZ8leVQKJzA0aHd2QFjcibZEl90kj6YJawRkjVvAjxgErtkL+7RCEoxQ3qUxjD2tSS9QPh+X9JsoDe0c9zGDGPXmUVKU67Z40owhKgklimiHDkDvK3Nwy4YDPtCwXGXhako0RmSBvygeCNF7Qv0/RJn4dm0yML4rvAfQ3Rl4lOYY+8pHM29wSIZan6i4ByQd24cgl1NYMvMzY1H1mI6t2CGakvCoqguzxfqklC4bgx1sJHkTlrIdldZU8UL/IEgsKApYI4cIF014bcS23ier88o5aoO+9mAGxeJ2IPa8M8GLxTCE8AOzkNzrOzmoMxnWJX0YvwUj3J9NNrEA62Or9Dl5m87cC82aK8T9o3KUJVVAPmsmgnurJURCX+R1YlVp/qlx1o2opsVNwVtLmduLcHCHp7aloBcUnhsbAXJagPgMIcB+0rvsOcF6qV3hFv5Sx2+b8u6Fe4IHPW724IEwUmQrorXubIts7JBhgyltnY3ymKu4FovQCLqIv9GuVzB4d1TssKYyiA05HzHnKUz6TubRJF/X6Rex8J7fiNOde4TNKznW3vUF4jGcULEBdRR5OeEDG+9MlPurl
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(4326008)(7696005)(6506007)(8676002)(76116006)(53546011)(26005)(66556008)(66476007)(122000001)(66946007)(64756008)(66446008)(52536014)(186003)(41300700001)(8936002)(9686003)(316002)(38100700002)(38070700005)(5660300002)(6916009)(478600001)(83380400001)(33656002)(54906003)(55016003)(2906002)(86362001)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6736
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7318e302-b5b3-4717-e301-08da64be8043
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MLFEiwL/+hdt/g2NNUMvXSf4nP00NymsHL+YTai/CSHpTMfl4nI3vL4tuy5hyg3XE0XoHXiWPUk4NJWN6irCzBhFYiSu/ouxWt0HbcNVi4GWk8XrRn3ByjtLc5Ri8R1cp8NNH0tU6VD6rYK6S7rbFpJZ5v2Zz3conVVJUEdJrGEzmdJ7tugCYZaAPwH1qLq5uzNNKw8h/5Qf2HsGyGVzwEEtT6iv3YaK49lf6Y+mRbOGffhCMSOcF2pBeImYu+Ym8QXI01yINhgYPs085JBYBShbxn1rqZNcz0fzrWoosEUyixabsdelpA3VgAWIKNG6at5SBH2DU1IrAqqrJIDMZuR6EW7j4wSump/giUsQvvXfcBxzhDb9GZCAt1aMQkOMCLNvIAO1G4cklZjyga/j2Rt5J8iaX9BHXXtGjVnsks0xN/qXDL0LTcXb2XHbm0w25vqmv9COcQ24LAPO6662YUGqsBHmM8nIFjuUHlB9VLTmkVEpGt2olYYuIZy2iv1EhyHrK6ZQ1ghjLlG31QDrKAptmLJZPu47JFvHY4/neVdDmlzS+/9KStRxwgj+izU+z+U5SH3NIgpgWErGHxwIkmms0yZGKL1Jz2UGUvC4w+0RBzHPPy0wM8kJfUarnlL/p/IZSwCXuK9mvzkzdFsoXW37g0KGC84EoYrpV/Wl0Q5Fhfy3yCQwHYNLfBbU/XuvhFk1Pl5/3cji9IzfnMYV/hGBkxA22wn+0BxWsyAO4zpeBQ0kEBS2Apjz8P/pvGF+mEB4QRi6D9REj6q5eULGdprSt8dg+oELtA4/O1CgRUi8mnEYXYw7zIfd6OJuyItE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(40470700004)(46966006)(5660300002)(40460700003)(83380400001)(8936002)(186003)(9686003)(40480700001)(55016003)(336012)(82310400005)(356005)(36860700001)(6862004)(52536014)(2906002)(82740400003)(86362001)(70206006)(54906003)(26005)(478600001)(70586007)(33656002)(316002)(4326008)(53546011)(6506007)(8676002)(47076005)(41300700001)(81166007)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 10:57:47.6704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e97da3-5bb9-4e04-96ac-08da64be85bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7591

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMuaXpSAyMjoyMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgNi85XSB4ZW4veDg2OiBtb3ZlIE5VTUEgc2NhbiBub2RlcyBjb2RlcyBmcm9tIHg4Ng0K
PiB0byBjb21tb24NCj4gDQo+IE9uIDA4LjA3LjIwMjIgMTY6NTQsIFdlaSBDaGVuIHdyb3RlOg0K
PiA+IHg4NiBoYXMgaW1wbGVtZW50ZWQgYSBzZXQgb2YgY29kZXMgdG8gc2NhbiBOVU1BIG5vZGVz
LiBUaGVzZQ0KPiA+IGNvZGVzIHdpbGwgcGFyc2UgTlVNQSBtZW1vcnkgYW5kIHByb2Nlc3NvciBp
bmZvcm1hdGlvbiBmcm9tDQo+ID4gQUNQSSBTUkFUIHRhYmxlLiBCdXQgZXhjZXB0IHNvbWUgQUNQ
SSBzcGVjaWZpYyBjb2RlcywgbW9zdA0KPiA+IG9mIHRoZSBzY2FuIGNvZGVzIGxpa2UgbWVtb3J5
IGJsb2NrcyB2YWxpZGF0aW9uLCBub2RlIG1lbW9yeQ0KPiA+IHJhbmdlIHVwZGF0ZXMgYW5kIHNv
bWUgc2FuaXR5IGNoZWNrIGNhbiBiZSByZXVzZWQgYnkgb3RoZXINCj4gPiBOVU1BIGltcGxlbWVu
dGF0aW9uLg0KPiA+DQo+ID4gU28gaW4gdGhpcyBwYXRjaCwgd2UgbW92ZSBzb21lIHZhcmlhYmxl
cyBhbmQgcmVsYXRlZCBmdW5jdGlvbnMNCj4gPiBmb3IgTlVNQSBtZW1vcnkgYW5kIHByb2Nlc3Nv
ciB0byBjb21tb24gY29kZS4gQXQgdGhlIHNhbWUgdGltZSwNCj4gPiBudW1hX3NldF9wcm9jZXNz
b3Jfbm9kZXNfcGFyc2VkIGhhcyBiZWVuIGludHJvZHVjZWQgZm9yIEFDUEkNCj4gPiBzcGVjaWZp
YyBjb2RlIHRvIHVwZGF0ZSBwcm9jZXNzb3IgcGFyc2luZyByZXN1bHRzLiBXaXRoIHRoaXMNCj4g
PiBoZWxwZXIsIHdlIGNhbiBtb3ZlIG1vc3Qgb2YgTlVNQSBtZW1vcnkgYWZmaW5pdHkgaW5pdCBj
b2RlIGZyb20NCj4gPiBBQ1BJLiBBbmQgYmFkX3NyYXQgYW5kIG5vZGVfdG9fcHhtIGZ1bmN0aW9u
cyBoYXZlIGJlZW4gZXhwb3J0ZWQNCj4gPiBmb3IgY29tbW9uIGNvZGUgdG8gZG8gYXJjaGl0ZWN0
dXJhbCBmYWxsYmFjayBhbmQgbm9kZSB0byBwcm94aW1pdHkNCj4gPiBjb252ZXJ0aW5nLg0KPiAN
Cj4gSSBjb25zaWRlciBpdCB3cm9uZyBmb3IgZ2VuZXJpYyAoQUNQSS1pbmRlcGVuZGVudCkgY29k
ZSB0byB1c2UNCj4gdGVybXMgbGlrZSAic3JhdCIgb3IgInB4bSIuIFRoaXMgd2FudHMgYWJzdHJh
Y3RpbmcgaW4gc29tZSB3YXksDQo+IGFsYmVpdCBJIGhhdmUgdG8gYWRtaXQgSSBsYWNrIGEgZ29v
ZCBpZGVhIGZvciBhIHN1Z2dlc3Rpb24gcmlnaHQNCj4gbm93Lg0KPiANCg0KTWF5YmUgd2UgY2Fu
IHVzZSBmd19yc2NfdGFibGUgb3IgcnNjX3RhYmxlIHRvIHJlcGxhY2Ugc3JhdCwgYmVjYXVzZQ0K
c3JhdCBpcyBvbmUga2luZCBvZiBOVU1BIHJlc291cmNlIGRlc2NyaXB0aW9uIHRhYmxlIG9mIEFD
UEk/DQpGb3IgUFhNLCBJIGhhZCB0cmllZCB0byBrZWVwIFBYTSBpbiB4ODYgQUNQSSBpbXBsZW1l
bnRhdGlvbi4gQnV0IHRoZQ0KY29zdCBpcyB0aGF0LCB3ZSBoYXZlIHRvIG1vdmUgc29tZSBjb21t
b24gY29kZSB0byBhcmNoaXRlY3R1cmFsIGNvZGUsDQpiZWNhdXNlIHNvbWUgbWVzc2FnZXMgdXNl
IHB4bSBmb3IgaW5mbywgYW5kIHRoZXkgaGF2ZSBkaWZmZXJlbnQgbWVhbmluZ3MNCmZvciBlYWNo
IHBsYXRmb3JtLCB3ZSBjYW5ub3Qgc2ltcGx5IHJlbW92ZSB0aGVtLg0KDQo+ID4gRm9yIHRob3Nl
IE5VTUEgaW1wbGVtZW50YXRpb25zIGhhdmVuJ3Qgc3VwcG9ydGVkDQo+ID4gcHJveGltaXR5IGRv
bWFpbiB0byBub2RlIG1hcC4gQSBzaW1wbGUgMS0xIG1hcHBpbmcgaGVscGVyIGNhbiBoZWxwDQo+
ID4gdXMgdG8gYXZvaWQgdGhlIG1vZGlmaWNhdGlvbiBvZiBzb21lIHZlcnkgdmFsdWFibGUgcHJp
bnQgbWVzc2FnZXMuDQo+IA0KPiBJIGRvbid0IHRoaW5rIGEgc2ltcGxlIDE6MSBtYXBwaW5nIGNh
biBkby4gU3VyZWx5IGZpcm13YXJlDQo+IHJlcHJlc2VudHMgbm9kZXMgYnkgc29tZSBpZGVudGlm
aWVycyBldmVyeXdoZXJlLiBBbmQgSSBkb24ndA0KPiBjb25zaWRlciBpdCB2ZXJ5IGxpa2VseSB0
aGF0IHdlIHdvdWxkIHdhbnQgdG8gYmxpbmRseSByZS11c2UNCj4gc3VjaCBudW1iZXJpbmcgaW5z
aWRlIFhlbi4NCj4gDQoNCklmIHdlIGhpZGUgcHhtIHRvIHg4NiBvbmx5IG5vdywgd2UgY2FuIGF2
b2lkIHRoaXMgMToxIG1hcHBpbmcgYmV0d2Vlbg0KTm9kZSBhbmQgUFhNLg0KDQo+ID4gLS0tIGEv
eGVuL2NvbW1vbi9udW1hLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL251bWEuYw0KPiA+IEBAIC0x
NCw2ICsxNCwyMSBAQA0KPiA+ICAjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4NCj4gPiAgI2luY2x1
ZGUgPGFzbS9hY3BpLmg+DQo+ID4NCj4gPiArc3RhdGljIG5vZGVtYXNrX3QgX19pbml0ZGF0YSBw
cm9jZXNzb3Jfbm9kZXNfcGFyc2VkOw0KPiA+ICtzdGF0aWMgbm9kZW1hc2tfdCBfX2luaXRkYXRh
IG1lbW9yeV9ub2Rlc19wYXJzZWQ7DQo+ID4gK3N0YXRpYyBzdHJ1Y3Qgbm9kZSBfX2luaXRkYXRh
IG5vZGVzW01BWF9OVU1OT0RFU107DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IG51bV9ub2RlX21l
bWJsa3M7DQo+ID4gK3N0YXRpYyBzdHJ1Y3Qgbm9kZSBub2RlX21lbWJsa19yYW5nZVtOUl9OT0RF
X01FTUJMS1NdOw0KPiA+ICtzdGF0aWMgbm9kZWlkX3QgbWVtYmxrX25vZGVpZFtOUl9OT0RFX01F
TUJMS1NdOw0KPiANCj4gU29tZSAoYWxsKSBvZiB0aGVzZSBsaWtlbHkgd2FudCB0byBiZWNvbWUg
X19yZWFkX21vc3RseSBhZ2FpbiwgYXQNCj4gdGhpcyBvY2Nhc2lvbi4NCj4gDQoNCk9rLg0KDQo+
ID4gQEAgLTMyLDYgKzQ3LDI5OCBAQCBub2RlbWFza190IF9fcmVhZF9tb3N0bHkgbm9kZV9vbmxp
bmVfbWFwID0geyB7IFswXSA9DQo+IDFVTCB9IH07DQo+ID4NCj4gPiAgZW51bSBudW1hX21vZGUg
bnVtYV9zdGF0dXM7DQo+ID4NCj4gPiArdm9pZCBfX2luaXQgbnVtYV9zZXRfcHJvY2Vzc29yX25v
ZGVzX3BhcnNlZChub2RlaWRfdCBub2RlKQ0KPiA+ICt7DQo+ID4gKyAgICBub2RlX3NldChub2Rl
LCBwcm9jZXNzb3Jfbm9kZXNfcGFyc2VkKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAraW50IHZhbGlk
X251bWFfcmFuZ2UocGFkZHJfdCBzdGFydCwgcGFkZHJfdCBlbmQsIG5vZGVpZF90IG5vZGUpDQo+
ID4gK3sNCj4gPiArICAgIGludCBpOw0KPiANCj4gdW5zaWduZWQgaW50PyBUaGVuIG1hdGNoaW5n
IGUuZy4gLi4uDQo+IA0KDQpPay4NCg0KPiA+ICtzdGF0aWMNCj4gPiArZW51bSBjb25mbGljdHMg
X19pbml0IGNvbmZsaWN0aW5nX21lbWJsa3Mobm9kZWlkX3QgbmlkLCBwYWRkcl90IHN0YXJ0LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IGVu
ZCwgcGFkZHJfdCBuZF9zdGFydCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFkZHJfdCBuZF9lbmQsIHVuc2lnbmVkIGludA0KPiAqbWJsa2lkKQ0KPiA+
ICt7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gDQo+IC4uLiB0aGlzLiBCdXQgcGVyaGFw
cyBhbHNvIGVsc2V3aGVyZS4NCj4gDQoNCkkgd2lsbCBjaGVjayB0aGUgY29kZSBhbiBmaXggdGhl
bS4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiBKYW4NCg==

