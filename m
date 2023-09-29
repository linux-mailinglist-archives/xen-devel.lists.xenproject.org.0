Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45B7B2DCA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610334.949710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8pp-0000nH-Qo; Fri, 29 Sep 2023 08:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610334.949710; Fri, 29 Sep 2023 08:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8pp-0000kq-N9; Fri, 29 Sep 2023 08:26:53 +0000
Received: by outflank-mailman (input) for mailman id 610334;
 Fri, 29 Sep 2023 08:26:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGVc=FN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qm8pn-0000kh-S6
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:26:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efab4489-5ea1-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:26:50 +0200 (CEST)
Received: from DU2PR04CA0227.eurprd04.prod.outlook.com (2603:10a6:10:2b1::22)
 by DBBPR08MB5913.eurprd08.prod.outlook.com (2603:10a6:10:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 08:26:20 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::1d) by DU2PR04CA0227.outlook.office365.com
 (2603:10a6:10:2b1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22 via Frontend
 Transport; Fri, 29 Sep 2023 08:26:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.15 via Frontend Transport; Fri, 29 Sep 2023 08:26:19 +0000
Received: ("Tessian outbound fb5c0777b309:v211");
 Fri, 29 Sep 2023 08:26:19 +0000
Received: from 106741332470.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 68F9254C-0A39-49FB-8C0A-DA27E6853FD0.1; 
 Fri, 29 Sep 2023 08:25:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 106741332470.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:25:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB10166.eurprd08.prod.outlook.com (2603:10a6:102:368::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.34; Fri, 29 Sep
 2023 08:25:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 08:25:45 +0000
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
X-Inumbo-ID: efab4489-5ea1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZv4QVXxFhqWRtjh+/NfpMtiqTMZziieLu2FrKUZ4OE=;
 b=4qBB6slQv9OQXljVGrC3Trap++zdf67qA4ZbFeF3BwQu0mUQ6ZgCiX8H98SD3Ia27eL4ABhZF13S1Ia+rYAq7u4zx24pI08ixr78Du8itfr7IGQtyAOrn92Hf8lBKVFnHbTQZev9FsPvirXNB8MItPMUWkkjMc1wA/pbWKHtg1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 398987bb5a34e7d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD8YdJp16RiuPfyyByu5lndAeaRblX9IWXBkY2YpyzUbQqUJT8ZSrpnFf1i5GIEHlspr8wctyU66vluNRTmQv3dKADDRQf3l8J6AEqgwh7HrbTSY4KsH1PwF2DRYKqZxnVSKVFDXIJ4ISZXBmxIRx4cCP8VhzyYRNkRsZBw6RGFSahvjUHRDuYPW0SSr9migd4gn60fzvXarl+vKWJ82HVfO1k6gczKaOVNaNtsQkp8Hn8IWYuazr+KRiyBSkCP8CV+pzKd1GonU5I8ybbJknpi77jbWtforEIML6Yvfw749D7FvyA8+BFHICpWrqg3tWVwfuS3MxztHfWIMdLPpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZv4QVXxFhqWRtjh+/NfpMtiqTMZziieLu2FrKUZ4OE=;
 b=j9YShkCB/WVpr/+c3Kg9betbP4KkHiZE4Gk/hmegW3BkJ0MnfAn6nMSogO+hGuzRwEC5C0XxpDW46SYvvAfgHdQQuJ21cS9o8fQFzRJkeeGOjAHIYRkptRdQIQDpBy4Ql0WTF6jYitgYG5BkrKy38C+NklsFiRhxmPTBvnkxWROwXhKup6QEg/iSUaGgdZSIEXy9qKcucCKdc5b2tx+9QOyFumqHQVznwxjLB1uo9OvYyB9PrwgoLeu0qz/rgDPbwUyuVd/1tja/8gwDNZ9DfwUXQsNaqPWohHl2BElBcTFk9ApOZa+tdSAGQg9bHpJi3W8sNXrqk19gn2rOdUw46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZv4QVXxFhqWRtjh+/NfpMtiqTMZziieLu2FrKUZ4OE=;
 b=4qBB6slQv9OQXljVGrC3Trap++zdf67qA4ZbFeF3BwQu0mUQ6ZgCiX8H98SD3Ia27eL4ABhZF13S1Ia+rYAq7u4zx24pI08ixr78Du8itfr7IGQtyAOrn92Hf8lBKVFnHbTQZev9FsPvirXNB8MItPMUWkkjMc1wA/pbWKHtg1w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "wl@xen.org"
	<wl@xen.org>
Subject: Re: [PATCH] bitmap: fix n__ signess
Thread-Topic: [PATCH] bitmap: fix n__ signess
Thread-Index: AQHZ8mJT1hRW8AvsV0W7X8Uoqm4UN7AxZzyAgAARBwA=
Date: Fri, 29 Sep 2023 08:25:45 +0000
Message-ID: <7A91A10F-90BE-4C5E-9E58-967D158CB4D8@arm.com>
References:
 <alpine.DEB.2.22.394.2309281616200.1996340@ubuntu-linux-20-04-desktop>
 <592517ec-f093-4789-8cd6-320f886e45ae@xen.org>
In-Reply-To: <592517ec-f093-4789-8cd6-320f886e45ae@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB10166:EE_|DBAEUR03FT008:EE_|DBBPR08MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: e70cc9db-29f6-4b08-fa6e-08dbc0c5c1c2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VJxZx3s56wG0ur/NQpE6/Ga7f0aSY2bwh5mRUiyw5gKbNQPJD+sE5r6ywB518jMejgRlntfU7y+33iNt7WdCgfSXYOQKAoKfYTlcRMduCBDY7Fwy2X5UB8ERiMeRgBwupeOOK9JnrJxU8ChpKzYJQUHRzhUx3QG9QfptdWgrCQmuzD1TY9/DG0Ktzr0WbOOgaIUZX+beiwnYUKVZdX+FeX8DtSbnR1RASMGuxoGjTeFeSJWgZD4UtN+jf/HtHBS9w3b0V/DM+//HvnlEHhEYGHHx1HZsN9lXzg19Otl7UQNfBInryNP4p7t4EmX2LYwZM+0zm3H2D2xMaQcnMC8vNMmwPJgSk2PMNQiGtU7E8aLBMT5nUQOSbEuatlWOJei6OwSwdztNioxpy5eHUhl9BfK3G8+l61bXMFN/AnPay+CReJJ/zhBEaTPtzJd5MQi9jq0x+AXUq3tUmy83Rl0NrsPBocY5gtnPC5FiZVA+MP0w08gJY2vwZa8Xwhuepyf5R0TLqhn/z09xfdm1fiR4QLqpl3dEViM7iLKpW0um6Ov0pz6xb9M1iBCC5X4nrAf21hBP7/MU0ekNOCqyTShrlrh+5k0pIG5L0Y6TQMUcfZqCKm7Ki9QpJQTF3PSTSI2ze5uQxR7xWGlifKWC9WDVKw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38070700005)(71200400001)(478600001)(83380400001)(26005)(2616005)(6512007)(122000001)(6506007)(53546011)(6486002)(38100700002)(4744005)(2906002)(33656002)(86362001)(8676002)(4326008)(8936002)(5660300002)(64756008)(66446008)(91956017)(66556008)(66946007)(36756003)(66476007)(316002)(54906003)(41300700001)(6916009)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <330DC49B641DC04097BF7A2FFF2298E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10166
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4812598e-b233-481f-71c8-08dbc0c5ad75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FlCPpJtfYA/ALodg7eiaBAHo3UGuAvcqB+YkzpipSK61ilRr8vHGh605K4iQYCoMhtYA3juh49UnX/p6IZIrb4KvdoezxfbKI2NMVWzP2Nh8M3VYCUXaaX3ct2qjUNXOrx5Su6ATm+pRjl//cvuGyZBotQDjA6wxpUoghmmq9U/NzJfvvy4CGrFiO9AHo8gdDut9FX+jeK2UOQ6gaGzxu08u5/4GNmrTidonJ9cR84xqnI9e+4lARIhanOFrmSDwjR2Bz7xCgU4/8V3JXBD+FgmQhWWLwgJ6bC5SHobMWmL8I2KO/0WwVb2HJF1Wf6Z2O46My/MRvWCh67WPO34vqxzAKFB3O/WAnE6bZ1OI6QHOl/uQT9Cv8lYcQHREyfMI8p+ekvtAg8EriiOHvJ4Yb6U5OnGYz/OQFmfWQu/OANAtG4KQPI5ENkJgEKqyp/PsAiTTQJhmPx1AqmGVZb2t3JKCL1Uk4dPKbC3PrExxFIMmx8ZMWdUyiPn47Z+mKA3bueIBSK96UyLVmzm8zXJhTizF6GsEihucxJAg3TSTLY4U3yEwApzZM5bhnMwop/ECAvHh9660ogi2QAM6NKaaPMh0z+3T5WKfu9z/V4Ic9n4sf8CVlknDaB+kz0qJHwLWZGm08q2eJwfyNq335RUlXZJ9vFa//NVDXkhcWybH9K5Z5UTmZxgGIgWmwfvUEho5rem148VPBpL+dCZWPfilgTy2v+cuFGxctl1uIGbGrXHIYxH3Tx5yW/ztMz/ndpye
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(82310400011)(64100799003)(1800799009)(451199024)(186009)(46966006)(40470700004)(36840700001)(6512007)(2616005)(6506007)(53546011)(6486002)(83380400001)(8936002)(26005)(70206006)(336012)(478600001)(2906002)(6862004)(70586007)(356005)(4744005)(316002)(4326008)(41300700001)(5660300002)(54906003)(8676002)(36860700001)(86362001)(82740400003)(40460700003)(40480700001)(47076005)(81166007)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:26:19.4928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e70cc9db-29f6-4b08-fa6e-08dbc0c5c1c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5913



> On 29 Sep 2023, at 08:24, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 29/09/2023 00:19, Stefano Stabellini wrote:
>> All callers of the bitmap_switch macro (which are all within bitmap.h)
>> pass an int as first parameter. Do not assign it to an unsigned int
>> potentially introducing errors.
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>> We could also have gone the other way and change all the callers and the
>> callers' callers to use an unsigned int instead, but I went for the path
>> of least resistance.
>=20
> I understand this will solve the issue right now because the callers are =
all passing 'int'. However, all the callers will need to switch to 'unsigne=
d int' in order to solve violations in their callers.

I was about to send a patch like this but Stefano beat me sending this one,
anyway I confirm that switching the callers type will solve this violation.

Cheers,
Luca


