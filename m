Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528E5FB0AA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 12:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419547.664329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiCka-0007Xa-Gu; Tue, 11 Oct 2022 10:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419547.664329; Tue, 11 Oct 2022 10:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiCka-0007Us-DZ; Tue, 11 Oct 2022 10:44:40 +0000
Received: by outflank-mailman (input) for mailman id 419547;
 Tue, 11 Oct 2022 10:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHvS=2M=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oiCkY-0007Uk-Qu
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 10:44:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c65bd20-4951-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 12:42:38 +0200 (CEST)
Received: from AS9PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:20b:48b::26)
 by PR3PR08MB5674.eurprd08.prod.outlook.com (2603:10a6:102:81::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 10:44:34 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::25) by AS9PR04CA0084.outlook.office365.com
 (2603:10a6:20b:48b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Tue, 11 Oct 2022 10:44:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 10:44:33 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Tue, 11 Oct 2022 10:44:33 +0000
Received: from b9b726336b13.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7D8AFC0-3E55-4244-9291-FC831D9C254E.1; 
 Tue, 11 Oct 2022 10:44:27 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9b726336b13.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 10:44:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8010.eurprd08.prod.outlook.com (2603:10a6:150:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 11 Oct
 2022 10:44:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 10:44:23 +0000
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
X-Inumbo-ID: 6c65bd20-4951-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mppKK4Xo0596eqIlNVIEWDWHakZd3IK3wDPxjKLvOdXzbzM78SwpIlkJvYxFvPsn82t1DQL25jmQE5+xgnVQbsyTsPY9WaJR++KnquMnRGxGEAyTPgyd03FnrWBb/l/FQyyYhfdXXBMyYSj39hMNuN88y9Y8lzGk9zbDUYCbTzum5JJtcd7yHteskMWgzodagUiXrs9Vs9+0tjgVcBs5o0Tn+/2OA6BHJrgJrEqsdPQoT/HT2GuCVefACModeAu8+IjhJR2J49REx+eyJHJv+ym2mAdl+9XQAt2izxLSXAoFNfM3553NOi6owgYwZoyJcKChP6/JsN7/gn9GRy8kNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDDhC9dVVuqXaO8kimaQS5XB0AfnLhjX+Pw6ixg6hgw=;
 b=KR9xEls2ldEH7T9vklDE8E6ditbdoEuRnXU19bDnGakYaXiOoiBTTqUAO8P6XKWzxuVw6OuPwY8dq5905LA84Fcw0M5I3Se7y29YSr5MJilVopb+BfrjOZXAUkCAd/8q3lrZpNmdL/uQlpccNRGsI4ZvJOKFS0RtaxM27BLm6JsLtcjJpqzHbEXqPbawFyKS/vYjjkzjrMcSmUKKzL/pQa3eomPVYXlWhp/1PmkijzyQ+otWbm08ehzWO9PZ2mtONYJw6N1W2TIn0NHAJxFE8hluNeYtbf+hvlI1zZB0mlinndhCim3BtyDx2BYP9y0ujpQcMkXvqlgdRRfXDx/JfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDDhC9dVVuqXaO8kimaQS5XB0AfnLhjX+Pw6ixg6hgw=;
 b=Vw3ScPku5ZHbbiQmqK/7CR60wGryawmIGVR/dgGeb68Jph1vUBhVgxfPHFO4uGsU6QzVQTKnMNZALUODrIqyTvVgdi73einPqzbkWtjbNkqTjynLPpIQMqE+Jj2jNvupHwnF0QRE4p6tbcLSvD/dGBQX/YV1ktZF2jQva0BjTic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2pQBBtMxeRyR8+7ThO6dbUxg5KMfsSjLm0FR4VdHAS3C1KRbGw9w67lZ3WUljhFNITW8Mz1jimkkB0Wv1VEktD5QxYuSu2cmOPTqYi/wdzY5laoQlFjxPKbAv38Y6Nt0Iif62TCHSZNKzzGOqMFkdBNUsDT8Rc0I4IfkYimgnuMHH0fuNBNLh7mu75X9xaEY1RTQOyKWHtAFjulEmE+XpK4uA72ECLfzwJ/I6rU44h0SRcOhwYtkTds7waU23jHqNWYueJZ6jPgopJMsistHJFuGgZrGDAML0TInMJ82UyBlBh9HbNHbwu7fAfAaYcEDrE5Nu3biaXOvewQRwaN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDDhC9dVVuqXaO8kimaQS5XB0AfnLhjX+Pw6ixg6hgw=;
 b=kWRED51UOO53TEHDviG4PtiRC6f8GeZaUwYWuuDTsfOMscofwRQtuiM4Xy3LGngTh61PAxShSFoBiNubbPYQt7DEkYjhc765iKSLBQU/HIrHBojNr18Pk5Vu/OWhquhr9GlR1LPTbEpQTM99QrB5gZvBc6Ouaf0khTZKsebHfn6W/uD3GhGLGBboazLjMVbvbEa4857do6m80SH82pkJ2PjqWJ13nB0KgYmveqG6INQQeHpo5c89o3WtOLyROmuLg1R2a46vmd9K/adkh86modHmr8T9voAiLRSea7g14m/fn72piAd3aV/WE+5KzEPYUErR/lDwbDPDfhYIpmvE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDDhC9dVVuqXaO8kimaQS5XB0AfnLhjX+Pw6ixg6hgw=;
 b=Vw3ScPku5ZHbbiQmqK/7CR60wGryawmIGVR/dgGeb68Jph1vUBhVgxfPHFO4uGsU6QzVQTKnMNZALUODrIqyTvVgdi73einPqzbkWtjbNkqTjynLPpIQMqE+Jj2jNvupHwnF0QRE4p6tbcLSvD/dGBQX/YV1ktZF2jQva0BjTic=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>
Subject: RE: [4.17?] Re: [PATCH] x86emul: respect NSCB
Thread-Topic: [4.17?] Re: [PATCH] x86emul: respect NSCB
Thread-Index: AQHYyNQExUU6HB2zzUWbaDsrkt18Oq4H/XmAgAEhrYCAAAmScA==
Date: Tue, 11 Oct 2022 10:44:23 +0000
Message-ID:
 <AS8PR08MB79917F69AA9899C2A86C3C1092239@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <b0103a30-22b7-c010-3e8b-6eab1c25ee47@suse.com>
 <f5851974-86ab-8da7-3b5f-4196faae7969@citrix.com>
 <1fc32039-5a3e-5f74-d6ab-059ab8037338@suse.com>
In-Reply-To: <1fc32039-5a3e-5f74-d6ab-059ab8037338@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 36D912E2A1E73248A0560A90A5C9F2D5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8010:EE_|AM7EUR03FT060:EE_|PR3PR08MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b56eef3-be40-48ee-1ce6-08daab7595d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UJeN7Qk+k5pg7ZI8qJiz9NyqxuUvBbWUHLhrrK8zLFedQvt6L9/FSUnxyJkWNY5BAbpxm6EiI4C6f+yW44Gtkzb++iZBE0NkxbG9A1Ya6aJslQH2K2+YRrV+uBzLCBJHzFbamMB8VL3bijQUtdHeYBN/gGQeIpd+anaCyxN91tR3n2ar/nHfVXcgndRQAMCYrnI+KAfOOKjVqXWrF/rYqwaeM1OiNuNU0ePkaZaYaz7/nOgA6uPTpMta30USf/OW1LzOCLjDFrkg32pfTmTt6TsIcecp3mqUcKZsmuDjX8i1MXQo984/UvegwfpHhCq3z+sikFuv/blMXE+zopr0NzCrQm0dGqNPO9jhzQeY5VD04XOqKcwgQiuarCL3nfr/jpRZcv5oRPFiCf1njY+baMTuJ6zWNHfrCap2HlZppOpYTvI6qIzKYa/HQT2a3AbPTySonz/wzvn5Hyusxvgg4MSgRT8Fe69W5g/D1Qtqg/DZLjzYMkgO91uYz00YQQM7cUDko2n5KCXAcj80NGVMSOP84WZwDg8u3/SA/TsoPHi0HDgt6GRS6nqbLv5FRo2M0KhFNI4H0X5pKYvzNCNtpIkLIFdSP21iPuCjGDNTC+s05chOxJ4hSiRWKGc7XO4CApYxrI2S7P779eTTqYSyfni3yd+T07ovgL3TFRxWwOioUdNqI77d/rac4tJ47+HxF4Aq7fk/4KhNdoG06F3eFTiVv8Q+f/4LOvfVIDip+fG2ODlBrzGgQrjVutek24TGBT20n00ybA8rU36BLCoa6g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(7696005)(5660300002)(53546011)(38100700002)(52536014)(8936002)(122000001)(6506007)(86362001)(41300700001)(66946007)(83380400001)(186003)(4326008)(478600001)(55016003)(9686003)(71200400001)(33656002)(8676002)(26005)(66446008)(38070700005)(316002)(76116006)(66556008)(54906003)(2906002)(64756008)(66476007)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8010
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e765c545-b60f-4225-95ef-08daab758fdc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6LkUX46aqlHu53WULwkCrIY3EppI9e5hXypI/y8X/2qGhpY3tejEe0NkiEf2gvcURSkR6J/LRwq7lIZ9cluQaoVQYnF4w8sXTcD7jE2UzZ7jRg/j5dBEQsozvn+GYCpxcxlNWm9fuZFAlfCs4QnQ15IVqO0afrOb/Vi/n2GoNM4BJTV6cQcN/wWl/SCwDAUEcFh/z/MmRYl8mXTMInMZmjcUTe/onJ6XGTeLpvoP2dk0r6OBHS1x+Hdh0vUujyOCZVQVfuVmhIbcTBaMvfdULA+ooovbi55DofQLhQiWifD4i1mjmArG4YcUjNjXfLJnQQIeCtmfgt3aIU3l8bE7y8ngggCdBwpaSjiI4jJi0aIxjvPG0Wt4LcoRpgXSgoexG2ddSNimU/C/U2mDXe0zq/u0uwN7lFWXTpQaj6VsrfeXtdUMPfVWdBHoiCY7ob8jjRmJPGvfKFABM5C1G1BOMw9HCKKbcDLo5r336wdyt5tj5eJIXd53OrgqhSHCq+Rla27wh4ScGd3sVI/y3mckr3btrD6dgcZ24I5Kkab6SY6fukYFlvjG76j6BDwpvekQrQKZTt/5cu/ae0+AT0GnTphH3WO9u0xGlC7hJAJiV6Pyj1OUHVzhiZnlFGp8BV0969vjI1DMO+6UJuzWYjDuAzDO5Pv19tNSxh0saFpqnnCSKzrtPpyNE7rtHhAJF8KVt2BfxF1f1k7n3fPtSKXdIAc7gYy1HmNmCExA+aLPxV+REMXj5/PSbNDIc6cktBv0rcZ4tVr5OWnvYbxBlRDWFg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(33656002)(81166007)(36860700001)(82740400003)(40460700003)(86362001)(40480700001)(356005)(55016003)(316002)(54906003)(478600001)(52536014)(5660300002)(6862004)(70586007)(8676002)(8936002)(41300700001)(70206006)(2906002)(82310400005)(83380400001)(47076005)(336012)(4326008)(6506007)(53546011)(107886003)(26005)(7696005)(186003)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 10:44:33.9082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b56eef3-be40-48ee-1ce6-08daab7595d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5674

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogWzQuMTc/XSBSZTogW1BBVENIXSB4
ODZlbXVsOiByZXNwZWN0IE5TQ0INCj4gDQo+IE9uIDEwLjEwLjIwMjIgMTg6NDQsIEFuZHJldyBD
b29wZXIgd3JvdGU6DQo+ID4gT24gMTUvMDkvMjAyMiAwODoyMiwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+ID4+IHByb3Rtb2RlX2xvYWRfc2VnKCkgd291bGQgYmV0dGVyIGFkaGVyZSB0byB0aGF0ICJm
ZWF0dXJlIiBvZiBjbGVhcmluZw0KPiA+PiBiYXNlIChhbmQgbGltaXQpIGR1cmluZyBOVUxMIHNl
bGVjdG9yIGxvYWRzLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gDQo+IFRoYW5rcy4NCj4gDQo+IEhlbnJ5IC0gdGhp
cyB3YXMgc3VibWl0dGVkIGJlZm9yZSB0aGUgY29kZSBmcmVlemUsIHNvIHlvdSB3ZXJlbid0IENj
LWVkLg0KPiBNYXkgSSBhc2sgdG8gY29uc2lkZXIgZ2l2aW5nIHRoaXMgYSByZWxlYXNlIGFjaz8N
Cg0KU2luY2UgdGhpcyBwYXRjaCBpcyBzaW1wbGUgYW5kIHRvIG15IGJlc3Qga25vd2xlZGdlIHRo
aXMgcGF0Y2ggaXMgdHJ5aW5nIHRvDQppbXByb3ZlIHRoZSBjb2RlIHNvOg0KDQpSZWxlYXNlLWFj
a2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCihJZiBpdCB3aWxsIG5v
dCBjYXVzZSB0b28gbXVjaCB0aW1lIG9mIGRpZ2dpbmcsIHdvdWxkIHlvdSBtaW5kIGFkZGluZyBh
DQoiRml4ZXM6IiB0YWcgcG9pbnRpbmcgdG8gdGhlIG9yaWdpbmFsIGNvbW1pdCB0aGF0IG1pc3Np
bmcgdGhpcw0KYCB2Y3B1X2hhc19uc2NiKClgIGNoZWNrIHdoZW4geW91IGRvIHRoZSBjb21taXR0
aW5nPyBJIHRoaW5rIHRoaXMgd291bGQNCmhlbHAgdG8gaWRlbnRpZnkgdGhpcyBwYXRjaCBhcyBh
IGJ1Z2ZpeCBzbyBpdCBpcyBtb3JlIHJlYXNvbmFibGUgdG8gY29tbWl0DQp0aGlzIHBhdGNoIGlu
IGN1cnJlbnQgcGhhc2UuIEJ1dCBpZiB0b28gbXVjaCB0cm91YmxlIG9yIHlvdSB0aGluayB0aGlz
IGlzDQpub3QgcmVhbGx5IGEgZml4IHRoZW4ganVzdCBpZ25vcmUgbXkgY29tbWVudC4uLikNCg0K
S2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gVGhhbmtzLCBKYW4NCg==

