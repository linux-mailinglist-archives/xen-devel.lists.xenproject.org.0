Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF577A60B0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 13:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604601.942069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYZG-0003E2-HJ; Tue, 19 Sep 2023 11:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604601.942069; Tue, 19 Sep 2023 11:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYZG-0003Bd-EJ; Tue, 19 Sep 2023 11:06:58 +0000
Received: by outflank-mailman (input) for mailman id 604601;
 Tue, 19 Sep 2023 11:06:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qiYZE-0003BX-Sq
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 11:06:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3245d84-56dc-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 13:06:54 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 07:06:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6158.namprd03.prod.outlook.com (2603:10b6:5:399::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 11:06:47 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:06:46 +0000
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
X-Inumbo-ID: a3245d84-56dc-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695121614;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=9pmBBFPJzQNYBCaHCZgzrn330g5J9H2WaO5kJqeMN8c=;
  b=INgtW3eQLinoaJ+2bZ6i+eyYUTQm0f/9EkvSwpZJF5KYxgIkKqBcSro9
   sN2bJwklHAwmc2BKE2zuHAGWq2NtKoyHg6e4LeaytRByRFwG/KHkrBTU3
   sOzxLFZX53KR5FES7yiSdjUSgfuhC3GyfuMSoKOaBW6w+Ew+Hdd546Io0
   c=;
X-CSE-ConnectionGUID: 4QDYL1O3RBi2f/XE2ATWpQ==
X-CSE-MsgGUID: uSfOj1pjRUaiMtUtClAsZw==
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 122337571
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:T7S4BqOsc2famT3vrR2DlsFynXyQoLVcMsEvi/4bfWQNrUol32dWm
 DQcDGvUO6uMZ2XwctwgOd/gpktUv5TUnIdkHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tJ5w1mP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rpOLVBqr
 NtDEhoMNB7Et8/s6Y6EUtA506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj23bSQwHyiMG4UPKCD+Nlo2UWR/FEaCTgKaEeQpdCiuFHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+pQSiaPCEUKSoIY38CRA5cut37+tht31TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:EB5NcaFDip4MTCM1pLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-Talos-CUID: 9a23:8J6ck2Hu+U4IQ0/LqmI7zWIlPpkCKUf3zS3eZH+VU09Vd6WsHAo=
X-Talos-MUID: 9a23:lKyftQowjC+LKC7qYmkezyxZOuBqurysMn0EkLAahtWvMQVrCSjI2Q==
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="122337571"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+zus5xlfgYeE4xa5K9TNRRjIkbMNjLEQW6REkWFU48+pYyrGsXHAol6cSrF3f4rMnUENqcqooPs85xgtBUSHzpxGMNf+HDs8IME5U3RSGSw72wnXfGbob/Mu9mIn9N94YaseWr7JhtbE4Tg2HbZz+CGtUi8+m/Lja4yyb0g5kCAdMdhdYB17e9Yt1cyJLCgAu8x8UWN+JH4eoV4Fg18L8jOWkzrPygsC7PQ9uFiTOc+oldkAykdQNF6E9ziyMckhlrPcWh+aF9eb477l5RceP6X8NmUSSsxLB4KFPKwsGh35XbnB1GXKPzCmR/axOZu85j/6IZJWjnrcA2bTwJ+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UX1eXRHpKe+Hj5+QRAop5/FRgFcMkLQbGSBj77udeCE=;
 b=LcuFoILpgw04FCKjOr4gKttSoHAO0yMSl8i57IHcx70NEkzh8q5crEjZFFBBXpejuyKBNlpRp0TIPEX5RUiXi93uBcS0XRTVrG94PD2JKgxMx+OwTaWnODdngeBDqMPpBi13mw5/GCy3aPWQn3mPzOkg+VsHmefLo+MowANc0pWnU7I+i5ZrtkhQPOEXUERZ6KqD9J91fzPEdAmag0jfBoNE3iolxzk1paDyJ4BLkt6netBVK9vvRkfvzyiohqM5ZDDT1b9QFQwPsjiT5Al+rU/7Gq0G9lHzw2zNzbh4SWLN8WSp+C2alCMTL9oZ5mdJUnX1BtDz10qVcBZQ7PTA4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UX1eXRHpKe+Hj5+QRAop5/FRgFcMkLQbGSBj77udeCE=;
 b=WaslZwCMepIf5vZRav2IJFtwkoVweFPTsL9g8+pXe7i4a8It4N5QQZrrVMxX8CciFPvb7sO8b+Taag2ztCX9xCZv4oJGFChUyFNb1wIAiVzdX/3CGYGPgYavCRd5k6PJlPt720gMiu4k7nJnOQOoPfuF0MaDi44Luu5jZjUYWQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/i8259: do not assume interrupts always target CPU0
Date: Tue, 19 Sep 2023 13:06:37 +0200
Message-ID: <20230919110637.12078-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0686.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dcf8a7-04bd-4b58-00dd-08dbb90083c7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mrhkg3iikizVVlnXOg5S6iGzT1mQRslCdCK77ljKBq76vYAfE7tKh/+5flgdbChZtxNvCUDEn3zcRFrpmXIB8cdWn495AqfQ3GB49pSJuZZxk5bTSA+dWWj7wqG9FDrCiMjvfPrDoleC+Q9P+gecwFjxlLDWbOQBMvWikszKQrwni0/HCLz/Vx83sWWbHzsNV5LQZq8QpUXTITE6a+8edwU+2yNzj1Yb1WVjH6uPh7PjX7jeCilvDjosbQP1SPWldRFxq5Ut/ALVKLSQk5H3FP/fwkf7HY7isEbEFPXup29JwW5IXBxShZtxUbnd0dhLKku3wlo19gKFn9NhR029lKqCxNiaoliRxBw997YToExCSEkXELOfp1Rp1grrzte9xNxabvJr8npvnCtLmlYd+hI3mHOu9nZQx3chdnL73EdhjKdhBmJFr/YkffbvtBS+oklthpyp27umZk3VwJelpAxrckqsWJJRQoOEeVPDkCfnJPXA2L4ppMtItMKnCO2FsDhTEYa2k4E10tTdwuxmrtfgu/NctLZFnF10bS3LHNBUwledZt/srxV5r7j85r/J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(1800799009)(186009)(451199024)(83380400001)(6512007)(6666004)(82960400001)(6506007)(6486002)(36756003)(41300700001)(2906002)(66946007)(66476007)(66556008)(316002)(54906003)(6916009)(5660300002)(8676002)(8936002)(4326008)(38100700002)(478600001)(86362001)(1076003)(26005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW1vdkJwbGRMUWhTcWVZdXJLTmRXUjhBM2NOaCtxRm83L2FMUzlrY2J6MVRM?=
 =?utf-8?B?Qm14VlZONUlMKzlQVTc1UjNlRTB4dlpVQmVuaUJTcUZ6a0RGckRJWlQvSkpP?=
 =?utf-8?B?OXQwaktobFdiYlVOWUpCTThIN0l3cFd3V3g5K0RmV001RUVWbTN1MWxWMy82?=
 =?utf-8?B?a1JLaDJZYk1rWmp0QVFFY3dHcVhRQzFPM003Y3pnZmhNU2p1ZVVGTml6bk1U?=
 =?utf-8?B?cmIvbUpNa21xcytGcHhZU2pyeVg0UCtReXRTN014YW1SckFRUXVmbTBuWFVK?=
 =?utf-8?B?bFk0VUdVV1lhOTlVZzlyaklCUkVFMlNsQzN1RktheHJNWnZxckhXKzY2eWNY?=
 =?utf-8?B?R1R4MmRsbUJtU1B5dmJ5MHNUb0VoRkFHTFBHYVhKMTF3MU9jSWpZZi8wRXIy?=
 =?utf-8?B?cW9QVkx1SXB4eGxUWUN0b3RWNVZubTBKVVJxa0RPb2VYNmQ3UmVHYzBMc2xB?=
 =?utf-8?B?NjZ0S0RyemVZSi8vaEYvYjZSU2xFL0JZODVvR1hmOXBzTUtwZVA5SVcwVWZ4?=
 =?utf-8?B?WEkzNW83djFZT29sdE1GRTBCcUo1SlpPNU03NGExQWV5bHlLeEFCS3BEQW9y?=
 =?utf-8?B?ck1KZEhtc2NlRTM3cjZsY3J2VTNrcTNFSUYyaUcyNGtYWEdKRERJa3hrZmtp?=
 =?utf-8?B?a1J1SkJmT1grVEpCbUtLdzJwallsZktxZTN4bC9xeGYzOEljK2JtU2Ezc25K?=
 =?utf-8?B?MjFjTWJSN1ZBenh6SGxPT3FCRDNsVXZyMzF1VEtmZDFpMGtPSVRKSzBRK3Yv?=
 =?utf-8?B?NmVyVWdDQ0VTcTE0S2xwK1VGNFFzS0l4cVpCTDRYaTJYZjhxSERsbWttS3VB?=
 =?utf-8?B?UlZSam1xSEtBT3dHQ1FxM05raVU2ZXdXWFlrUG9KeG9KNGZQbmQwQmJPRzlI?=
 =?utf-8?B?TFFBNGEzL2lneU04UXVpdEpWMTdSQ0FvZFFiY3pYZFB4YXZSTUNia1lpclZm?=
 =?utf-8?B?bkpObm12TlQ3UXNtRzJNbDlabEtrVVdnZFovZWU0SStqeXBCbU9XQk1PMC9K?=
 =?utf-8?B?M2M1dm4zcmI3NWt6ZG11Z0JFa0xXOU1kbzF5ZzBmcDFHWkJKUWpYR0NXbHN0?=
 =?utf-8?B?ZUtOL3pRRWx1alYvTVB0WXVXLzgzM3N2bUVTdGczNkk2eGVhNEVzNytwTHJ2?=
 =?utf-8?B?VDJuNmtqL05KMk1UQWEwUnZ3WmtUYlJyM2hYbktXZUZCVk9vcVp6OXNJb0RG?=
 =?utf-8?B?UWU5Y3VKdG5xVUp2Zmx6SFZna1FDeHZxTGxma2RmZVk1ZlFuNWZxMWRoYTVH?=
 =?utf-8?B?QWk2ZmtyTHQrWWhmQ1FUdThHTlRZWi9EWWdxeDdoVzBYVVRxdUg2bEtzQUtw?=
 =?utf-8?B?UGFLRCtKQStkTFl6dlRyd1dyRFNmZHVsQStaaWZrK2xuWS9LMm9pZHNvZ0pm?=
 =?utf-8?B?bEVNSEFHNmRkNk9PZUVpOUVTcE9pLzIvelpNTFJOR3N2MWlFTXpNNHppanFu?=
 =?utf-8?B?YWE1bnhEbCs0L0JqNXJaZXI0Tk5NWTNWb3BNTHplV0NaRGRUWTlmVE50QTM2?=
 =?utf-8?B?L2xsaFhIM3VZQTNKc1ppOE9tWmtzVGlzcVNVU1AzTzBoYkFJYkxlY3JVamxP?=
 =?utf-8?B?OXIwc01GWmhoNStITi9DdUlnck5UaWUxNzFzMUdNaXQwL09Ub2JRQUR5YzRB?=
 =?utf-8?B?WXoyTFQvdlRINlExY2EzWHlsT3RQeWxzbkZmb2o4emlScmYvbG5RYmxLUjJD?=
 =?utf-8?B?bUZkNXZ0Uy9BelJveVQzTDFtRWJ4RjN5YVRxNThiRWlKV3RidG1kOEE4QW4w?=
 =?utf-8?B?NUc3K0E0ZmpiT2JiSldOV3hZRXhLN0JkOXQraWFQODFOMU85QWpyWjB1OFVr?=
 =?utf-8?B?UkJ0aTNTR0RlcWg4b0EzeE5mVDhtZUpVOTN6NlpWRTA2cDdnYTNpZWtsUzBx?=
 =?utf-8?B?T2lCSHQva2J1YVNTSTJVZlpKRjhuQzJad3ZpTXBWM1FEU29FUlByT1BidG1D?=
 =?utf-8?B?dFN3SDkrQTRNd1B3a2JjdHhXUCswUzJMRVlZNjdJdk9panhqanZ0UW5LZzhJ?=
 =?utf-8?B?WnJ1RG9MaERXdnNuUXNWWVgxbUxGVTJLcEEyWHVScGRNUFVkeFRGdWt3TUsz?=
 =?utf-8?B?S1QyNmR2eGtyTjhBREhMOE1oRnJ3S0tsTDVPaGhSSXY1R09nSm1nd3VaTU5m?=
 =?utf-8?B?SWVOKzVnSkVwTDZZRjIzaEJveGpxS3ZDMnpocmFOZzUzSDhZUnNPaU00RG5V?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5PKF+7xg0SmjTmxv7I3mn3BZeouHMwtW9AQVI9W45PPxNLKWu91wMIsheyJcFfJa96jmFTsXno4RZj3iGlSkrl0caaadIR1Dm+D2MZ5a0+TKRUXaLQm47OezSZ2BingSO+6kBCGuTV9jlul5BkpBeZYZ28Z8JIERbx6YmYa8NOpqhgq7UT2J1+v3k/wt6MfIaJehZz987DZvay3XB4KaO/taltlYRWAMDjic/ZFu+u/HoPFzZA4WIMDdo9rGixHUXKk/WbqP0QFLHLokSa+YR1Gb3B3jeYCdp+KB+4M57PyJhoGVhLpmLN9SsbmyLI0V2dQ2Ye5KXcik9h7tFwRdrxMUsR8rz9kYqgBL8Emv/wL6T9eS/S1lTPEJyR9wvOw3/YSImi10uhyPXqnmBNZLJ3bK5/RyNxsTWuO/zp4Ol/yW0sHRCd3/92x4rbZqCU0BSBCdjr3CJ908alVscQ1CjLdT9fmiP3PXm0ddE+KQzm0zQ4q8VJ8OEqmrOQyCKzWwetrplHPetz4OJlEeLd2w5jfVHqS6c1kNCMjnjSd9wpx5O7IgQSSt+qxArjLgGFj/I0b75wItdOZYv9UqOdkqPbpPfN3EoxPSra5rpg5Obip21PBgZ0CgPqEyaS7WUpJyw5dwE8wEs0CoOQbEyxTwW/TWgsovFY2WQ5fP/FPAz46k+T9qh6QyX0r5+ddcyA3fwdJUPSQwd4rYuqzv5R44cMwfbjLeAgRg2xHTP9pLQC4HqYOp3UB6ZaVaTirFTn4yvQ6FvOq/56MWSJu+AoQmMKZh23tLlWUUXXR3ghK6A7spz0gESQKEPp855tY90uyIAaaY0pcKwUyXjntbHmG6Wg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dcf8a7-04bd-4b58-00dd-08dbb90083c7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 11:06:46.8249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJklJ/mrZ3nhuyCWE0D3fkdoWjdSErNI7R/IAbU/YdI3cnvzfJz9Jj+outKrawa7uV2Uom9gWM9Ot3lCbF6Abg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6158

Sporadically we have seen the following during AP bringup on AMD platforms
only:

microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
CPU60: No irq handler for vector 27 (IRQ -2147483648)
microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17

This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
also observed i8259 (active) vectors getting delivered to CPUs different than
0.

Adjust the target CPU mask of i8259 interrupt descriptors to contain all
possible CPUs, so that APs will reserve the vector at startup if any legacy IRQ
is still delivered through the i8259.  Note that if the IO-APIC takes over
those interrupt descriptors the CPU mask will be reset.

Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
when all i8259 pins are masked, and hence need to be handled on all CPUs.
Reserve such vectors in order to prevent dynamic interrupt sources from using
them.

Finally, handle spurious i8259 interrupts on all CPUs and adjust the printed
message to display the CPU where the spurious interrupt has been received, so
it looks like:

microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
cpu1: spurious 8259A interrupt: IRQ7
microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17

Fixes: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
One theory I have is that the APs at some point (before jumping into Xen code)
have the local APIC hardware-disabled, and hence are considered valid targets
by the i8259, but by the time the vector is fetched from the i8259 the
interrupt has either been masked, or already consumed by a different CPU.
---
 xen/arch/x86/i8259.c | 18 ++++++++++++++++--
 xen/arch/x86/irq.c   |  9 ++++++++-
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index ed9f55abe51e..ad3bca9895d0 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -222,7 +222,8 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq)
         is_real_irq = false;
         /* Report spurious IRQ, once per IRQ line. */
         if (!(spurious_irq_mask & irqmask)) {
-            printk("spurious 8259A interrupt: IRQ%d.\n", irq);
+            printk("cpu%u: spurious 8259A interrupt: IRQ%u\n",
+                   smp_processor_id(), irq);
             spurious_irq_mask |= irqmask;
         }
         /*
@@ -349,7 +350,20 @@ void __init init_IRQ(void)
             continue;
         desc->handler = &i8259A_irq_type;
         per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
-        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
+
+        /*
+         * The interrupt affinity logic never targets interrupts to offline
+         * CPUs, hence it's safe to use cpumask_all here.
+         *
+         * Legacy PIC interrupts are only targeted to CPU0, but depending on
+         * the platform they can be distributed to any online CPU in hardware.
+         * The kernel has no influence on that. So all active legacy vectors
+         * must be installed on all CPUs.
+         *
+         * IO-APIC will change the destination mask if/when taking ownership of
+         * the interrupt.
+         */
+        cpumask_copy(desc->arch.cpu_mask, &cpumask_all);
         desc->arch.vector = LEGACY_VECTOR(irq);
     }
     
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 6abfd8162120..2379fdda3a7e 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -466,6 +466,14 @@ int __init init_irq_data(void)
           vector++ )
         __set_bit(vector, used_vectors);
 
+    /*
+     * Mark i8259 spurious vectors as used to avoid (re)using them.  Otherwise
+     * it won't be possible to distinguish between device triggered interrupts
+     * or spurious i8259 ones.
+     */
+    __set_bit(LEGACY_VECTOR(7), used_vectors);
+    __set_bit(LEGACY_VECTOR(15), used_vectors);
+
     return 0;
 }
 
@@ -1920,7 +1928,6 @@ void do_IRQ(struct cpu_user_regs *regs)
                 kind = "";
             if ( !(vector >= FIRST_LEGACY_VECTOR &&
                    vector <= LAST_LEGACY_VECTOR &&
-                   !smp_processor_id() &&
                    bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
             {
                 printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",
-- 
2.42.0


