Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C37B9B6B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 09:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612855.952987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoItp-0002Qq-I5; Thu, 05 Oct 2023 07:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612855.952987; Thu, 05 Oct 2023 07:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoItp-0002Nb-Ez; Thu, 05 Oct 2023 07:35:57 +0000
Received: by outflank-mailman (input) for mailman id 612855;
 Thu, 05 Oct 2023 07:35:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCsR=FT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qoIto-0002NV-4S
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 07:35:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d014f05d-6351-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 09:35:53 +0200 (CEST)
Received: from DUZP191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::27)
 by PAXPR08MB6352.eurprd08.prod.outlook.com (2603:10a6:102:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Thu, 5 Oct
 2023 07:35:49 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f9:cafe::42) by DUZP191CA0010.outlook.office365.com
 (2603:10a6:10:4f9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37 via Frontend
 Transport; Thu, 5 Oct 2023 07:35:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Thu, 5 Oct 2023 07:35:49 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Thu, 05 Oct 2023 07:35:48 +0000
Received: from e9d3a97c6a7a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AFED72F9-14D9-47AE-925E-E5364D26F7E8.1; 
 Thu, 05 Oct 2023 07:35:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9d3a97c6a7a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Oct 2023 07:35:11 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by PAWPR08MB10307.eurprd08.prod.outlook.com (2603:10a6:102:366::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.23; Thu, 5 Oct
 2023 07:35:09 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7d2f:80d6:9244:3266]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7d2f:80d6:9244:3266%6]) with mapi id 15.20.6838.030; Thu, 5 Oct 2023
 07:35:09 +0000
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
X-Inumbo-ID: d014f05d-6351-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYnfAiR3pmA3KweHEtsVK5AK5iTxpIKqAN6bUYybXMk=;
 b=2cBwPnFS70CLe65a1poncBUV8BlvzvwnVpb4D0awxJmjv2EFFnH6AQBryGbBnfD5E8y3tHzxiRbz100MO3asVQZg6/Ua+goSMS8hD2JWSlzNgchxDOoPLiDbnwwprNOuiBdqT4ytRj9JZz79Jlq+aZSr/epeaH0OYoxGqnFg4qg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70b76274c379ca08
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnvDTJDIGVXxX6xNW+frjtedo2ot2kBFOt9N1SYAELiWQlKRPNa4tEIMHUdXu8I/1/lWXOoObz7CEGtJGLnceudpCJZJNR6NwMLJDRifd2cjEFnEgrWd7ZIsr7XtYvXRefJSTEIyiDZRHEGcmtH0MXWPNQPVAQAJZF/O5uZEDw7QhtgwiZZy4VdwWrfbZ4DyNB6R/6SumlEVPihN2EUFWvbvz+ScVUZmIFEiyvYG01xssoDjmVQEBKd7WQLJhZ9LD8NhxQJQ2lsuEl7kIRc7WnEe+HonqLLditUmKf3lhgESOTPXp8krGdAk/edXT2YMhpXPfl1+8c4wBAnHP8o7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYnfAiR3pmA3KweHEtsVK5AK5iTxpIKqAN6bUYybXMk=;
 b=iHNWy2unilFLSId514HO+Oa4wfX1s5LgbCXPa2N8uKGfVZgA6I7gH7XAKL5jipy92EA/2pTTwsa/Tc3P1rxIn9TUhKdGQxKu3WckFzjDfW0WuGD4CpQ5RfGgJv2pjxSAf2cjfMsTL0devqnwUJhrRjCfep+NgyTXwwyQRtqYFByNzChMm+vytjjRJ8VdFYnCBg2IjDOHsU3EFXy/DRwtbzpfOnOFbFuxmk2qVLxn1ANLFP2DFgBc2+18u8sevoqTpHEK1Fdt5PZ31IweDiW4GGFSP+Sjp+pdKyH8AaR4mYJa4pxVfbMcoanyT+HzU0WBqbIYF1Sjy4BpTv5DQGUsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYnfAiR3pmA3KweHEtsVK5AK5iTxpIKqAN6bUYybXMk=;
 b=2cBwPnFS70CLe65a1poncBUV8BlvzvwnVpb4D0awxJmjv2EFFnH6AQBryGbBnfD5E8y3tHzxiRbz100MO3asVQZg6/Ua+goSMS8hD2JWSlzNgchxDOoPLiDbnwwprNOuiBdqT4ytRj9JZz79Jlq+aZSr/epeaH0OYoxGqnFg4qg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Topic: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Index: AQHZ9qj87vFsnMRst0ybMa+ffKOLU7A5Z4mAgAAGhgCAAAYzgIAA1KIAgACGqQA=
Date: Thu, 5 Oct 2023 07:35:06 +0000
Message-ID: <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|PAWPR08MB10307:EE_|DBAEUR03FT026:EE_|PAXPR08MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 11feced9-53b5-41ff-17a7-08dbc575b20f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3vTvTCXeGHg2G/EU7i6qi0fSJGzJFlfOcnLstMaAAL5f2MmGPSqHCDl6ZG9owjAiOQruB7/4LftSVr96Ignp9aEUuf+AxlROBztqrr74uPBJ9b7qI1Ybst4wITlvSMtLjQBQUU7svhn78qni2h50gouP7gW4vPtQzV7b3T3QF8bPHWjXFBh4pcY7SYOu4lMxk8RtXaeIHBJ53AfJ0XLg4OREFXSTmeJwDrgYrz9c9bie/2rcWvcDt768UwD+TnSpMXzMseUqcc0L2MaVWfOMo9MOyN/LhAYEnSj+7WEybFkXWMhqNagQZqGQqj+jHLhdaahUgTMnmxgl6KxJqRwvskEdi7YDj/PrAfsd4o4IywvcK2SW9oEuDzWv4FWr9PpuVdvAY67uUz0/WEHRQyz1Des9+D7W76I81ptIaxDvMFWUb3gZ5ZzuhLCwJMUOFsbRWRzf8uokGxaKlUS6GlHMugvNNFj2E7Jo+1NmBQDw8N32e1b//nwW3tW2NZYPL85zogoB11E9lvcysQuhwCCizlWbLvqguttHzxsUvlMtzUog3LIF2WlcPRznrg5Y+s6cvl8KRqqkXH/xPhOca3WynepeddN3vr92BoUxunXhz5NT5+6aJ2FpZzFk855HILtPJk+PrE1BlT1o5xKfEGd8GQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6512007)(6506007)(6486002)(478600001)(71200400001)(6666004)(4326008)(316002)(2616005)(66556008)(7416002)(6916009)(76116006)(26005)(41300700001)(5660300002)(66476007)(54906003)(36756003)(66946007)(8936002)(8676002)(91956017)(33656002)(64756008)(66446008)(38100700002)(83380400001)(86362001)(2906002)(122000001)(53546011)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB73C664B9E22D42A0563C16FF44D5DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10307
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f593da69-bebd-49af-1aff-08dbc57598c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0EjMFqCcJdQeNDIgykgL0/72U2h1GhjPDl6hIRYzFc2OSHfQirKRFbmKMARxpZNqZqIwkX5nvhXxBvyid2/P86wdGVXeVKhcUbMkABbmi+usNDhZ+mgOm+Kkt2+Gefw7xtFjmUqm5+urVQy3NyN7Rq1MufTyHVcXq4N1AlQKxOpSSFPBgMgsBiOeVHTXJ8+5PtQqdlVeZC8WUDKh1I26XbtKJMGZV6vp3u1Xk8o8fW7FwokkdycX3q9V8rivBOCuWtiSTGwksII4wkOH50DdcVM+56Zm86lT38wilLDqUVlAnI/awHTp1MfzUxlCwRm5sEgQks1uepg2C/UqjlSmfeYMppaZE7zoQjIscy1R54uMhtJO0aiI6t/OeFbKhsEt+feR4Qv401NOz1lbgFRRRSC/aCRbbbNWTCVwxRyxvC5K0MygXQMivuoy6CozIsjAIT2VkrfvZkCyhH5sPPk3O0uYHplXthD/5uxaVJYziV3aW565Smt5bTPd1C9Z+poJWdMyjrHPv+75d+g5qZ8+XEKNTD6H2CGwCZ6RKod1aYM6YPM28u/iQNAkdcTyX3J3TY3FSZK3SGnCKJVi1bzgmYVcJD9Iw/ia42dOd+G2csZJ4ifJkP7o2knJOHKhMWUzfkhdmLOcVqqSGt+ziwLqsVNQoxrG9hetekWYkhhQfOhuRS5MXwgIWOxyYdrTw29WyoTYExRla3Zq19x5EFCP3D0bZpab6vLctd9c23LPj9otST+ZQJOM2YyTk7GgMWqB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(36840700001)(40470700004)(46966006)(83380400001)(40460700003)(336012)(36756003)(26005)(2616005)(107886003)(82740400003)(356005)(81166007)(36860700001)(40480700001)(47076005)(478600001)(6666004)(41300700001)(4326008)(5660300002)(8676002)(2906002)(6862004)(6486002)(6512007)(86362001)(33656002)(316002)(53546011)(54906003)(8936002)(6506007)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 07:35:49.1767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11feced9-53b5-41ff-17a7-08dbc575b20f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6352

DQoNCj4gT24gNSBPY3QgMjAyMywgYXQgMDA6MzIsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDQgT2N0IDIwMjMsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gNCBPY3QgMjAyMywgYXQgMTE6MjksIE5pY29sYSBWZXRy
aW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4gd3JvdGU6DQo+Pj4gT24gMDQvMTAvMjAy
MyAxMjowNiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4gSGkgTmljb2xhLA0KPj4+Pj4gT24g
NCBPY3QgMjAyMywgYXQgMTA6NTYsIGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20gd3JvdGU6DQo+
Pj4+PiBPbiAwMy8xMC8yMDIzIDk6NDYgcG0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+
Pj4+PiBPbiBUdWUsIDMgT2N0IDIwMjMsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPj4+Pj4+PiBB
cyBzcGVjaWZpZWQgaW4gcnVsZXMucnN0LCB0aGVzZSBjb25zdGFudHMgY2FuIGJlIHVzZWQNCj4+
Pj4+Pj4gaW4gdGhlIGNvZGUuDQo+Pj4+Pj4+IFRoZWlyIGRldmlhdGlvbiBpcyBub3cgYWNjb21w
bGlzaGVkIGJ5IHVzaW5nIGEgU0FGIGNvbW1lbnQsDQo+Pj4+Pj4+IHJhdGhlciB0aGFuIGFuIEVD
TEFJUiBjb25maWd1cmF0aW9uLg0KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGEgVmV0cmlu
aSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+DQo+Pj4+Pj4gIlNBRiIgZGlzY3Vzc2lvbiBh
c2lkZSB0aGF0IGNhbiBiZSByZXNvbHZlZCBlbHNld2hlcmU6DQo+Pj4+Pj4gUmV2aWV3ZWQtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+Pj4+IFdlbGwg
bm8uICAiU0FGIiBhc2lkZSAoYW5kIFNBRiBkb2VzIG5lZWQgZml4aW5nIGJlZm9yZSByZXBvc3Rp
bmcgdGhpcyBwYXRjaCwgb3RoZXJ3aXNlIGl0J3MganVzdCB1bm5lY2Vzc2FyeSBjaHVybiksIC4u
Lg0KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmggYi94ZW4v
YXJjaC94ODYvaHZtL3N2bS9zdm0uaA0KPj4+Pj4+PiBpbmRleCBkMmE3ODFmYzNmYjUuLmQwNjIz
YjcyY2NmYSAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmgN
Cj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmgNCj4+Pj4+Pj4gQEAgLTU3
LDE0ICs1NywyMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3ZtX2ludmxwZ2EodW5zaWduZWQgbG9u
ZyBsaW5lYXIsIHVpbnQzMl90IGFzaWQpDQo+Pj4+Pj4+ICNkZWZpbmUgSU5TVFJfSU5UMyBJTlNU
Ul9FTkMoWDg2RU1VTF9PUEMoIDAsIDB4Y2MpLCAwKQ0KPj4+Pj4+PiAjZGVmaW5lIElOU1RSX0lD
RUJQIElOU1RSX0VOQyhYODZFTVVMX09QQyggMCwgMHhmMSksIDApDQo+Pj4+Pj4+ICNkZWZpbmUg
SU5TVFJfSExUIElOU1RSX0VOQyhYODZFTVVMX09QQyggMCwgMHhmNCksIDApDQo+Pj4+Pj4+ICsv
KiBTQUYtMi1zYWZlICovDQo+Pj4+Pj4+ICNkZWZpbmUgSU5TVFJfWFNFVEJWIElOU1RSX0VOQyhY
ODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMyMSkNCj4+Pj4+Pj4gKy8qIFNBRi0yLXNhZmUgKi8N
Cj4+Pj4+Pj4gI2RlZmluZSBJTlNUUl9WTVJVTiBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwg
MHgwMSksIDAzMzApDQo+Pj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4+Pj4+ICNkZWZpbmUg
SU5TVFJfVk1DQUxMIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMzMSkNCj4+
Pj4+Pj4gKy8qIFNBRi0yLXNhZmUgKi8NCj4+Pj4+Pj4gI2RlZmluZSBJTlNUUl9WTUxPQUQgSU5T
VFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzMyKQ0KPj4+Pj4+PiArLyogU0FGLTIt
c2FmZSAqLw0KPj4+Pj4+PiAjZGVmaW5lIElOU1RSX1ZNU0FWRSBJTlNUUl9FTkMoWDg2RU1VTF9P
UEMoMHgwZiwgMHgwMSksIDAzMzMpDQo+Pj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4+Pj4+
ICNkZWZpbmUgSU5TVFJfU1RHSSBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAz
MzQpDQo+Pj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4+Pj4+ICNkZWZpbmUgSU5TVFJfQ0xH
SSBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzMzUpDQo+Pj4+Pj4+ICsvKiBT
QUYtMi1zYWZlICovDQo+Pj4+Pj4+ICNkZWZpbmUgSU5TVFJfSU5WTFBHQSBJTlNUUl9FTkMoWDg2
RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzMzcpDQo+Pj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+
Pj4+Pj4+ICNkZWZpbmUgSU5TVFJfUkRUU0NQIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAw
eDAxKSwgMDM3MSkNCj4+Pj4+Pj4gI2RlZmluZSBJTlNUUl9JTlZEIElOU1RSX0VOQyhYODZFTVVM
X09QQygweDBmLCAweDA4KSwgMCkNCj4+Pj4+Pj4gI2RlZmluZSBJTlNUUl9XQklOVkQgSU5TVFJf
RU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDkpLCAwKQ0KPj4+Pj4gLi4uIHRoaXMgaGFzIGJyb2tl
biBhIHRhYnVsYXRlZCBzdHJ1Y3R1cmUgdG8gaGF2ZSBjb21tZW50cyBhaGVhZCBvZiBsaW5lcyB3
aXRoIG9jdGFsIG51bWJlcnMsIHdoaWxlIC4uLg0KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5j
DQo+Pj4+Pj4+IGluZGV4IGFhMmM2MWM0MzNiMy4uYzVlMzM0MWM2MzE2IDEwMDY0NA0KPj4+Pj4+
PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMNCj4+Pj4+Pj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jDQo+Pj4+Pj4+IEBAIC05MCw5ICs5MCw5IEBAIHVu
c2lnbmVkIGludCBzdm1fZ2V0X2luc25fbGVuKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQg
aW5zdHJfZW5jKQ0KPj4+Pj4+PiBpZiAoICFpbnN0cl9tb2RybSApDQo+Pj4+Pj4+IHJldHVybiBl
bXVsX2xlbjsNCj4+Pj4+Pj4gLSBpZiAoIG1vZHJtX21vZCA9PSBNQVNLX0VYVFIoaW5zdHJfbW9k
cm0sIDAzMDApICYmDQo+Pj4+Pj4+IC0gKG1vZHJtX3JlZyAmIDcpID09IE1BU0tfRVhUUihpbnN0
cl9tb2RybSwgMDA3MCkgJiYNCj4+Pj4+Pj4gLSAobW9kcm1fcm0gJiA3KSA9PSBNQVNLX0VYVFIo
aW5zdHJfbW9kcm0sIDAwMDcpICkNCj4+Pj4+Pj4gKyBpZiAoIG1vZHJtX21vZCA9PSBNQVNLX0VY
VFIoaW5zdHJfbW9kcm0sIDAzMDApICYmIC8qIFNBRi0yLXNhZmUgKi8NCj4+Pj4+Pj4gKyAobW9k
cm1fcmVnICYgNykgPT0gTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMDcwKSAmJiAvKiBTQUYtMi1z
YWZlICovDQo+Pj4+Pj4+ICsgKG1vZHJtX3JtICYgNykgPT0gTUFTS19FWFRSKGluc3RyX21vZHJt
LCAwMDA3KSApIC8qIFNBRi0yLXNhZmUgKi8NCj4+Pj4+Pj4gcmV0dXJuIGVtdWxfbGVuOw0KPj4+
Pj4+PiB9DQo+Pj4+PiAuLi4gdGhpcyBoYXMgY29tbWVudHMgYXQgdGhlIGVuZCBvZiBsaW5lcyB3
aXRoIG9jdGFsIG51bWJlcnMuDQo+Pj4+PiBTbyB3aGljaCBpcyBpdD8NCj4+Pj4gSSBhZ3JlZSB3
aXRoIEFuZHJldyBoZXJlIGluIHRoaXMgc2Vuc2U6IHRoZSBpbi1jb2RlIGNvbW1lbnQgaXMNCj4+
Pj4gc3VwcG9zZWQgdG8gYmUgb24gdGhlIGxpbmUgKmJlZm9yZSogdGhlIHZpb2xhdGlvbiwNCj4+
Pj4gbm90IG9uIHRoZSBzYW1lIGxpbmUsIHNvIEnigJltIGFsc28gd29uZGVyaW5nIGhvdyBpdCBp
cyBmaXhpbmcgdGhlIHZlcnkNCj4+Pj4gZmlyc3QgdmlvbGF0aW9uLg0KPj4+PiBDaGVlcnMsDQo+
Pj4+IEx1Y2ENCj4+PiANCj4+IA0KPj4gSGkgTmljb2xhLA0KPj4gDQo+Pj4gQWN0dWFsbHkgaXQg
anVzdGlmaWVzIHdoYXQgaXMgb24gZWl0aGVyIHRoZSBwcmV2aW91cyBsaW5lIG9yIHRoZSBzYW1l
IGJlY2F1c2UgaXQncw0KPj4+IHRyYW5zbGF0ZWQgdG8gLyogLUU+IHNhZmUgTUMzUjEuUjcuMSAx
ICovLCB3aGVyZSB0aGUgbGFzdCBudW1iZXIgaXMgaG93IG1hbnkgbGluZXMgYmVzaWRlcw0KPj4+
IHRoZSBjdXJyZW50IG9uZSBhcmUgdG8gYmUgZGV2aWF0ZWQgKGUuZy4geW91IGNhbiBoYXZlIDAg
ZGV2aWF0ZSBvbmx5IHRoZSBjdXJyZW50IGxpbmUpLg0KPj4gDQo+PiBKdXN0IHRvIHVuZGVyc3Rh
bmQsIGRvZXMgdGhpcyB3YXk6DQo+PiANCj4+IDxsaW5lIEE+DQo+PiAvKiAtRT4gc2FmZSBNQzNS
MS5SNy4xIDEgKi8NCj4+IDxsaW5lIEI+DQo+PiANCj4+IEp1c3RpZmllcyBvbmx5IGxpbmUgQj8g
QmVjYXVzZSBJIHRob3VnaHQgc28sIGJ1dCBub3cgSSB3YW50IHRvIGJlIHN1cmUsIG90aGVyd2lz
ZSBpdCBkb2VzbuKAmXQgYWN0DQo+PiBhcyBpbnRlbmRlZC4NCj4+IA0KPj4gDQo+Pj4gTW9zdCBv
ZiB0aGUgdGltZXMgdGhlIGN1cnJlbnQgZm9ybSBpcyB3aGF0J3MgbmVlZGVkLCBhcyB5b3Ugd291
bGQgcHV0IHRoZSBjb21tZW50IG9uIGEgbGluZQ0KPj4+IG9mIGl0cyBvd24uIEluIHRoZSBjYXNl
IG9mIHRoZSBpZiB0aGF0IHdvdWxkIGJyZWFrIHRoZSBmb3JtYXR0aW5nLiBUaGUgZG93bnNpZGUg
b2YgZG9pbmcgdGhlIHNhbWUgdGhpbmcgb24gdGhlIHRhYmxlIGlzIHRoYXQgdGhlIGZpcnN0IGVu
dHJ5IG5vdCB0byBiZSBkZXZpYXRlZCB3b3VsZCBhY3R1YWxseSBiZSBkZXZpYXRlZC4NCj4+PiAN
Cj4+PiAjZGVmaW5lIElOU1RSX0lOVkQgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDgp
LCAwKQ0KPj4+IA0KPj4+IFRoaXMgbWF5IG5vdCBiZSBwcm9ibGVtYXRpYywgc2luY2UgMCBjb3Vs
ZCBiZSBjb25zaWRlcmVkIGFuIG9jdGFsIGNvbnN0YW50LCBidXQgaXMgYW4NCj4+PiBleGNlcHRp
b24gZXhwbGljaXRseSBsaXN0ZWQgaW4gdGhlIE1JU1JBIHJ1bGUuDQo+Pj4gRm9yIHRoZSBzYW1l
IHJlYXNvbiB0aGUgbGluZQ0KPj4+IA0KPj4+IHJldHVybiBlbXVsX2xlbjsNCj4+PiANCj4+PiBp
cyBkZXZpYXRlZCBieSB0aGUgYWJvdmUgY29tbWVudCwgYnV0IHB1dHRpbmcgYW4gb2N0YWwgY29u
c3RhbnQgdGhlcmUgd291bGQgZm9yIHN1cmUNCj4+PiBiZSB0aGUgcmVzdWx0IG9mIGEgZGVsaWJl
cmF0ZSBjaG9pY2UuIFRoZXJlJ3MgdGhlIGFsdGVybmF0aXZlIG9mOg0KPj4+IA0KPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgIC8qIFNBRi0yLXNhZmUgKi8NCj4+PiAgaWYgKCBtb2RybV9tb2Qg
ICAgICA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0sIDAzMDApICYmDQo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgLyogU0FGLTItc2FmZSAqLw0KPj4+ICAgICAgKG1vZHJtX3JlZyAmIDcpID09
IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDA3MCkgJiYNCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiBTQUYtMi1zYWZlICovDQo+Pj4gICAgICAobW9kcm1fcm0gJiA3KSAgPT0gTUFTS19F
WFRSKGluc3RyX21vZHJtLCAwMDA3KSApDQo+Pj4gDQo+Pj4gdG8gbWFrZSBpdCBjb25zaXN0ZW50
IHdpdGggdGhlIHRhYmxlIGFuZCBhdm9pZCBhbnkgImhpZGRlbiIgZGV2aWF0ZWQgbGluZSBvciwg
YWdhaW4sDQo+Pj4gdGhlIG1vZGlmaWNhdGlvbiBvZiB0aGUgdHJhbnNsYXRpb24gc2NyaXB0IHNv
IHRoYXQgaXQgZG9lc24ndCB1c2UgYSBmaXhlZCAiMSIgb2Zmc2V0LCB3aGljaA0KPj4+IGlzIG1v
dGl2YXRlZCBieSB3aGF0IHlvdSB3cm90ZSBvbiB0aGUgdGhyZWFkIG9mIHRoZSBtb2RpZmljYXRp
b24gb2YgeGVuX2FuYWx5c2lzLnB5Lg0KPj4gDQo+PiBGcm9tIHRoZSBkb2N1bWVudGF0aW9uOg0K
Pj4gDQo+PiAgICBJbiB0aGUgWGVuIGNvZGViYXNlLCB0aGVzZSB0YWdzIHdpbGwgYmUgdXNlZCB0
byBkb2N1bWVudCBhbmQgc3VwcHJlc3MgZmluZGluZ3M6DQo+PiANCj4+ICAgIC0gU0FGLVgtc2Fm
ZTogVGhpcyB0YWcgbWVhbnMgdGhhdCB0aGUgbmV4dCBsaW5lIG9mIGNvZGUgY29udGFpbnMgYSBm
aW5kaW5nLCBidXQNCj4+ICAgICAgdGhlIG5vbiBjb21wbGlhbmNlIHRvIHRoZSBjaGVja2VyIGlz
IGFuYWx5c2VkIGFuZCBkZW1vbnN0cmF0ZWQgdG8gYmUgc2FmZS4NCj4+IA0KPj4gSSB1bmRlcnN0
YW5kIHRoYXQgRWNsYWlyIGlzIGNhcGFibGUgb2Ygc3VwcHJlc3NpbmcgYWxzbyB0aGUgbGluZSBp
biB3aGljaCB0aGUgaW4tY29kZSBzdXBwcmVzc2lvbg0KPj4gY29tbWVudCByZXNpZGVzLCBidXQg
dGhlc2UgZ2VuZXJpYyBYZW4gaW4tY29kZSBzdXBwcmVzc2lvbiBjb21tZW50IGFyZSBtZWFudCB0
byBiZSB1c2VkDQo+PiBieSBtdWx0aXBsZSBzdGF0aWMgYW5hbHlzaXMgdG9vbHMgYW5kIG1hbnkg
b2YgdGhlbSBzdXBwcmVzcyBvbmx5IHRoZSBsaW5lIG5leHQgdG8gdGhlIGNvbW1lbnQNCj4+IChD
b3Zlcml0eSwgY3BwY2hlY2spLg0KPiANCj4gQXMgd2Ugc2VlIG1vcmUgcmVhbGlzdGljIGV4YW1w
bGVzLCBpdCB0dXJucyBvdXQgdGhhdCB0aGlzIGlzIGxpbWl0aW5nLg0KPiANCj4gR2l2ZW4gdGhh
dCB0aGUgU0FGLTItc2FmZSBjb21tZW50IG5lZWRzIHRvIGdvIHRocm91Z2ggeGVuLWFuYWx5c2lz
LnB5DQo+IHRyYW5zbGF0aW9ucyBhbnl3YXksIGNvdWxkIHdlIGltcGxlbWVudCBzb21ldGhpbmcg
YSBiaXQgbW9yZSBmbGV4aWJsZSBpbg0KPiB4ZW4tYW5hbHlzaXMucHk/DQo+IA0KPiBGb3IgaW5z
dGFuY2UsIGNvdWxkIHdlIGltcGxlbWVudCBhIGZvcm1hdCB3aXRoIHRoZSBudW1iZXIgb2YgbGlu
ZXMgb2YNCj4gY29kZSBsaWtlIHRoaXMgYXMgd2UgZGlzY3Vzc2VkIGluIGEgcHJldmlvdXMgdGhy
ZWFkPw0KPiANCj4gLyogU0FGLTItc2FmZSBzdGFydCAqLw0KPiBpZiAoIG1vZHJtX21vZCAgICAg
ID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDMwMCkgJiYNCj4gICAgKG1vZHJtX3JlZyAmIDcp
ID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDA3MCkgJiYNCj4gICAgKG1vZHJtX3JtICYgNykg
ID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDAwNykgKQ0KPiAvKiBTQUYtMi1zYWZlIGVuZCAq
Lw0KPiANCj4gRmlyc3RseSwgbGV0IGFzayBBbmRyZXcsIGRvIHlvdSBwcmVmZXIgdGhpcz8NCj4g
DQo+IA0KPiBBbmQgYWxzbyB0aGlzIHNlY29uZCBmb3JtYXQ6DQo+IA0KPiBpZiAoIG1vZHJtX21v
ZCAgICAgID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDMwMCkgJiYgLyogU0FGLTItc2FmZSAq
Lw0KPiAgICAobW9kcm1fcmVnICYgNykgPT0gTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMDcwKSAm
JiAvKiBTQUYtMi1zYWZlICovDQo+ICAgIChtb2RybV9ybSAmIDcpICA9PSBNQVNLX0VYVFIoaW5z
dHJfbW9kcm0sIDAwMDcpICkgLyogU0FGLTItc2FmZSAqLw0KPiANCj4gDQo+IENvdWxkIHdlIGlt
cGxlbWVudCBpbiB4ZW4tYW5hbHlzaXMucHkgYSBjb252ZXJzaW9uIHRoYXQgd291bGQgdHVybiB0
aGUNCj4gdHdvIGZvcm1hdHMgYWJvdmUgdGhhdCBhcmUgbm90IHVuZGVyc3Rvb2QgYnkgY3BwY2hl
Y2sgaW50bzoNCj4gDQo+IC8qIGNwcGNoZWNrIHRhZyAqLw0KPiBpZiAoIG1vZHJtX21vZCAgICAg
ID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDMwMCkgJiYNCj4gLyogY3BwY2hlY2sgdGFnICov
DQo+ICAgIChtb2RybV9yZWcgJiA3KSA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0sIDAwNzApICYm
DQo+IC8qIGNwcGNoZWNrIHRhZyAqLw0KPiAgICAobW9kcm1fcm0gJiA3KSAgPT0gTUFTS19FWFRS
KGluc3RyX21vZHJtLCAwMDA3KSApDQo+IA0KPiBPciB0aGlzIGlzIGEgcHJvYmxlbSBiZWNhdXNl
IGl0IHdvdWxkIGVuZCB1cCBjaGFuZ2luZyBsaW5lcyBvZiBjb2RlDQo+IG51bWJlcnMgaW4gdGhl
IHNvdXJjZSBmaWxlPw0KDQpZZXMgdGhpcyBpcyB0aGUgcmVhbCBpc3N1ZSB3aHkgd2UgZGlkbuKA
mXQgZG8gdGhlIC8qIC4uLiBzdGFydCAqLyBjb2RlIC8qIC4uLiBlbmQgKi8NCg0KDQo+IA0KPiBJ
ZiB3ZSBjYW4gaGlkZSB0aGUgInVnbGluZXNzIiBiZWhpbmQgdGhlIHhlbi1hbmFseXNpcyBjb252
ZXJzaW9uIHRvb2wgd2UNCj4gY291bGQgaGF2ZSBhIGNsZWFuIGNvZGViYXNlIGFuZCBzdGlsbCBi
ZSBjb21wYXRpYmxlIHdpdGggbXVsdGlwbGUgdG9vbHMuDQoNCg0K

