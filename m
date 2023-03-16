Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F66BD0D6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510599.788547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnev-00066r-8I; Thu, 16 Mar 2023 13:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510599.788547; Thu, 16 Mar 2023 13:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnev-00063v-4o; Thu, 16 Mar 2023 13:28:45 +0000
Received: by outflank-mailman (input) for mailman id 510599;
 Thu, 16 Mar 2023 13:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcnet-00063p-Hz
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:28:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74a46862-c3fe-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 14:28:38 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 09:28:35 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5770.namprd03.prod.outlook.com (2603:10b6:806:11f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 13:28:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 13:28:31 +0000
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
X-Inumbo-ID: 74a46862-c3fe-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678973318;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=N3hrAAyx6EEvk7LPI7eI8FwU2JKhY9+c2J7EAK7La7k=;
  b=e+ka28s4VGgf/2DHRARxVeS9ABCfywSwWKUQs28flDvD5cVTUYxH3iJN
   K424l5m9Ht5sIio/Qbp107blmHhjbHGqXyfkGy6iI0YCeRr4hToVDRbcv
   UniMNocyBsmL58cC8KxVhhaX9EqNOXYV1AJCrml75OnLgHPbFyn7lJ52h
   Q=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 101117352
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4trM4q5Gf5ZOaRq50JW7fQxRtA3GchMFZxGqfqrLsTDasY5as4F+v
 jROXGiDaanZZTSnKNokaI7j/RxX6MfQmtFjTwE9pS4zHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4geA/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 /hFFwEpUja5meuZxbC7Sddmwek5BZy+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOSF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXqiAd1JSefQGvhCp2CCxy8eSyYqamSWkcSpm0u7RM4AA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAJLGoqdSICCwwf7LHeTJobixvOSpNmD/Szh9isQTXom
 WnS8G45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 hDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:nNLBBavLzRaINzFh7P92Jys/7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101117352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGLeJyXvyny7tYddb+nycQko0fyHJhgW7TwhxCLC4UYiK4vXq9ryGURGn/7gATDeYPu+pXb7qZ0T82gh4Xk63IeSzBUGnLmk7RVV5yu1oEs+/v+Br69ZLym3lLahZGd+vhK/8Jk/RgRMz8kqhSOWd6olOCzxNQ6ky9AXOaME/zXZ2/AYNN3JBYf2AXMQfBkMjZj5Xmd30H48lVChIhl8CQpGiUMIN4XnqgIthj1IGHHR63pw0IpFCoEFEOgTufzwuDubBqeqk+yQrsqRgHytn5xg1zPzCwgU8mwbXohuwboWNg3XdIuFkDNwfaYMObsLeMe50iUy1QMXuZ9fkKajEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKcMv2fIGRp0BwlC7+WzQ0t6smEP2wsWIPqdiHGu/40=;
 b=RrsXX5xPog/K+SUWeIkVOWGHizdQs63ChikjnH0y6zI2utdACzzhaQIrwnS7/pMH4T3BNoNYFzCsY1Ur+Lvd8JoCdCA0f5sX4x4BG9dTufOt/9pt9yIf6dMDPjAr7Cg5DyX0OmOrwxHMIUNgdOwYzuGdcB76Twu/jcdoX1ByOAM1AWgHPHlcQFu6Pku/igXhfnM2Comod7mVNaMkoF9bKHyHomopUX/6YU0UjAr8mkL26Ziz5XO9vuoXVDNSZdyNxxtGJcycooUc7LlbrM+X9mO/7OvG4AiUVhEWmPhFN3Cfl2EVULcR11ejohucEOTz9gDFOoHwCgznQftiB04utg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKcMv2fIGRp0BwlC7+WzQ0t6smEP2wsWIPqdiHGu/40=;
 b=OkxDHdjTp4p3KX1ISv5ah1EzGlbtyQ/JLxEeEGHXu9mGg4ekpVYDIufIYD0Ttx8aPHTAjOQGoLQ25Q/SdizGQ4/gs0TKRv6GNh6W046vOOKYCFWopyDScGY/vqD9cjpoL9+3Nm7DlpnDMeAaYwk018Xy8itHQBz2iR0nrXEQ4d4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 14:28:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2 1/5] x86/paging: fold most HAP and shadow final
 teardown
Message-ID: <ZBMZeXxqUsucQETt@Air-de-Roger>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
 <67b9378f-cf4a-f210-aa2d-85af51c51ab0@suse.com>
 <ZBMKhQWl1pZppgSj@Air-de-Roger>
 <91d3373a-2a50-f868-7471-08f9def8e6b8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91d3373a-2a50-f868-7471-08f9def8e6b8@suse.com>
X-ClientProxiedBy: BN0PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:408:ee::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca2b79e-2215-4f7c-3069-08db26225561
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PhMVwmMYAXnPB1FtfIGN7ijnQUQR/FgqHFj3x/PiX+07Pe4gfRQayDUWL1DS70TIEUXtQxKoQdd985u8Scfr9y974qhL2oat52v21zG2bs2cwd1ftEEPKkyfLPRKJgxkYZgt8R3IwyIDe/Wv2rnUN1nu9aEYHs9Lhp+LjqT376fs5JAZWzrEmT/WpXqqTdYcZQs5cgQpZsTn3n6WCL7qACo/ars1rNh8isXkRBsNsnm+krpbFhulGHTUPM+eQpRH3uNBvoQs9pxjLQ61zaRoPzcapE4qHveFw82qhU0AXCbgZzcXZ1rDemIIgVeif0V/D1oyv7BJWXz5gqiCCPZCtEZCBIZdqyq4hScTG/J5gyoCwrGIEYiJsDmlXtV6m9YK16yi/1yEawdr6PLf+4A5W2jeOPtUHhBNV1aqCHN6aw3Pp9AuwWS3HxJonC3ge9D4IhZo+KqeS0l3+6jZrPLEornvDc8biYgS1gDqngWLzZRAKJ8m9qzJLBfs3PVKxHXBJv3VmNrpQhJhbxxdmFtm378jujQlainSlg/p92godd+kq8h9NC8G8S2m5+N0ZiPDWAxCluPvsYMCdaocL8ETrwS4ndP1sxvDeEtzN7+5ZBV1EC/fRWkqPO9Wpx09hDuC1bBiFr/uO+X5JA2YrJmcVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199018)(86362001)(85182001)(38100700002)(82960400001)(2906002)(41300700001)(5660300002)(8936002)(33716001)(4326008)(6512007)(26005)(186003)(9686003)(53546011)(6506007)(83380400001)(316002)(54906003)(66476007)(8676002)(6916009)(66946007)(6486002)(6666004)(478600001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkhDcjkyeGNvNnZGbmg1V24zM0xOd2QyOERNMWVyNDlwcnNFQ0ZQM0ZRRU5J?=
 =?utf-8?B?UTY3Mmd6bHlxRjVxckpxclpjdGFnRDNsNTlmUzZRZFJabWJaMUMzVTJrcm1C?=
 =?utf-8?B?eFRZNFJJOEV1MS9XeDZ2dGcvZDVKdytrVCtaQUhpMXJybE1NcE1jRDluRkRv?=
 =?utf-8?B?S05YZWl0S21vWGNXc2NnVCt0VDMvUTBiTThCbnlnbHJnTVJldXZtbXdoVmVC?=
 =?utf-8?B?UjcxYS9jSXZoMnk5OG1ZYzhwUGZLSjlrTmpXSVU1L1dNQVEwaGpZVFJLQmFG?=
 =?utf-8?B?bXJ6Y2hPcFdsb0dEazFMZklTR3AyWU5Gd05zbmN0UDZ1bkZBTGF5OTZkTGNx?=
 =?utf-8?B?dzNvTXBKZm9yQ2QzWlhJbHJXbk0ycG90SWU0UVp1MURpWSt2WEVRcU5FSnl3?=
 =?utf-8?B?RGdOaHY5TUtsaklVMTRGL2VhMWVDSlEvdm1KZXVaSnRRTGVBQWlJUlVDQWRh?=
 =?utf-8?B?R1pVVC9DMDZibjNybUx4cVpsVGtSdUN4NWNzbnVKMjRZZ3JSNHRvczJrekp3?=
 =?utf-8?B?cnBKK1dadVI0bWxTVGpDOHlvS2gzWVhLckVncU9lTUJJZk8xSjdFeGNtYTRO?=
 =?utf-8?B?NmhrdDZuQmtDNlBZdG90cCt4NXF4Zm93cjlKcCtUOHA5MGREOTZOWFhkTU1v?=
 =?utf-8?B?NXpSbmlvTFRCWkIzaFlIYWNjZUdpZUtlM28vbjhPTlpUeS9pWEU4ZHBPZXBG?=
 =?utf-8?B?Y09LczlvQUtVWEsvVllvM3N2a2p1RnRtUlZ3QTc3c3dZR3FHbysrVzNKRmVU?=
 =?utf-8?B?dWNwNXpFVHpoTFp4NFQySXRHZ2dVYzZrbHRWTURTdWdiSkJENFdEd3N0d214?=
 =?utf-8?B?eDNUb3FRT0NWTkxTTzJHUjBxTGNTcmU1K2NEbFF1eVlobmF6MjNEbXZhb0g2?=
 =?utf-8?B?Q2dkYlNsMHZvS1VUaHBMSlNJN0RUOHJIYWk1TGtjekM0TUVtc0F3cHU1QW1J?=
 =?utf-8?B?b3RFVFVYR3UvRFcyR0dIR2pFRnY0c211RmZvYzlwSllPb2orVm5yR2tQNDY4?=
 =?utf-8?B?dnZDY1ZEUkdJSVE2emZXZ05ya3ZUbXc0UUZzOWdSMlZ5VE5zdGRZTFo5NCto?=
 =?utf-8?B?SytBdjBpQyt0cHRqallTM2ZKa29ydzlCV1JDcDJxSmlrUmhTai9ZODg1TUZW?=
 =?utf-8?B?YmcxNER5S0s0aTFUbXRHWE41bG5tKzc0SDNOc0NvZ2NrZTdZcytsN2k5b21t?=
 =?utf-8?B?ZnQ3amNSaTlMQTk2eGdrTTRVTWNhZ1loZXlFbkl4WjIwOGk3bUlIV0ZTRS95?=
 =?utf-8?B?cFFIWnI0MFZ5RnpWRkU3dy9pUzB1Z1RDNEt1aWtHamFLTWdFazBGZUNLSjZW?=
 =?utf-8?B?bHZsYnd1a3JkQlNzNlloL2laVHFhRCtsYzFybWYyNE1kSTlxOWFkanhYS3JO?=
 =?utf-8?B?MjcwTzQvSHpqbDRwNnN5aHFNUTJlcldZNXZrZmJDUWtlWWRkNElhMXpqR09j?=
 =?utf-8?B?Uko1U0Qwd1dZL0ZQTk5tNm83THpPMnEvc3R6cWhXNSsvZW90L2dsRy95RG4r?=
 =?utf-8?B?U2hRK1lQbUlqOEUzZ2Fnb2dBOUFMUkNCMDZjaUFHd2pFdkFPNGdQd1NRVXZJ?=
 =?utf-8?B?WTlQK2V5aWZOM29WemdCT0FzcU5hNGVWMkhRdHFjcUgyTEYrSm5qS2JiTER0?=
 =?utf-8?B?UVdpRDAxVVBGNTNvWnhwMjBRWDJJeVpQeml1UzlEODhqdFFtV1ZOMklLSnpO?=
 =?utf-8?B?ZXNHaHdxelJ4MUhIbXQ0S3N1YWJ3WStiTDZoWGc2NWIzbjFxSUY4bkl3SnpY?=
 =?utf-8?B?c25rZm1EVm80d29YWTBURWVBNkNpTWQyYTMvMGR6ZFp2SGg4VWZocldwcmN4?=
 =?utf-8?B?S1dZSm42K1dTMkdHaUFZMUZiNnczMGZ6bHZjNGlyYVBhK2ZSOExQeFR6OGVq?=
 =?utf-8?B?ZHFCa0lUR1RJUk1Vc1c4QWk0TmtQeFR5dXFqblRoQnZHOUZKak9mYWtsbXVM?=
 =?utf-8?B?S216Wno3djM2RVZ5T0dkLytYb0QyTnNQcEo0Vy9IMzJSYm1tRWptbURlSjhz?=
 =?utf-8?B?OElDZjh4RlVQMm9WNnVKTHZUd1R4bmVlTnBZcE5ZZkowNmhCWGdUZE1RUmFL?=
 =?utf-8?B?b1U1cStVWTBzdDhTNWhyWURpbi9lTnVXaTRtNk5RMFg4MjZpSUxQNWJ1Kzh4?=
 =?utf-8?B?Q0JyUjM4cEhIYVg4T0NvNEdWa0lOSHFDOThrNzNIZEorTHBCa0VZRGNSd2hn?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vdYlnDNzCg/dYkE4jX3EzUOJS50qwW8I9YrDMdxjamFRoKNHdOWx+pha88msduQHqTgEFOEiShL+acZwul4jvWAvbC6Cz2vSiTNd50TBNpSMh1ICINUg/IwN+JNqFOA4Ds3WpRf/cS4z8v9sFggIiVN9yNwSDmT+O52FAUrUP3/owi+MznUIYVO39HYlrfwzwzAZDtz1rmVRp8O/mA8Kduyxux9Us7dMt0FNu9uHFhZ6g0Kbn2m3+cWvsNqALleKbAeMKmhj3VGzpQfjtXj5buCUaEBVe06LEMql6qlvUJPYlwQj78ooQXDlxVL/q7x5rFAVsNMG4wRSXotC561d2WWJScjS3dbKe8rv7r5tH7WIhO2G98A1Uos4cYaxVrfN6FnE8ti+50Ot+xYr/jvEr3aHMt8JMoG3UVBWOG8rpHLY9boyjp2vBK3n8J2KyqzaW3z7wTFcG147I4/3x9bRX6aURE6iWM77NSF+co14UgFx8IuNcai8v6LZPWzDGKXZMPDbL9+QrTD+Zod9nHkvcrI2bpPYDgqsogfU+J+oDPKs8WsGdgF0CDjwbUOUg2HGtX5kmWALtAiWlrAr85BfueOhiKEkOmDjT7K5royvNQ79uPL1+A6iSNktYB57w0AxYmUfKxBxk2nfa7QIOmFWK66fIBTNQq123LmwD1xW23TNgj0Fo5B0K9Lr0MbaEwzAqIEcxUifjTlmMeQw9x1HiOo3MXpkJlKM9e6/UAttGQ5epyaNkgmGskZ9LcP12l6FKSZ75hmKCLfixc1BhV/G3/wSK7+fw1V293waQMX9SOr4Wo+lUTevi/2rh4jbJ/Jb
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca2b79e-2215-4f7c-3069-08db26225561
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:28:30.9045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7EPllc54sDCUorf2HOBILaSUFskjYGsaLJvbkZznj7U1z1FTN7lVXuJv5eSvY9LajeFBYBWs9rG9YllulbVBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5770

On Thu, Mar 16, 2023 at 01:57:45PM +0100, Jan Beulich wrote:
> On 16.03.2023 13:24, Roger Pau Monné wrote:
> > On Mon, Jan 09, 2023 at 02:39:19PM +0100, Jan Beulich wrote:
> >> HAP does a few things beyond what's common, which are left there at
> >> least for now. Common operations, however, are moved to
> >> paging_final_teardown(), allowing shadow_final_teardown() to go away.
> >>
> >> While moving (and hence generalizing) the respective SHADOW_PRINTK()
> >> drop the logging of total_pages from the 2nd instance - the value is
> >> necessarily zero after {hap,shadow}_set_allocation() - and shorten the
> >> messages, in part accounting for PAGING_PRINTK() logging __func__
> >> already.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> The remaining parts of hap_final_teardown() could be moved as well, at
> >> the price of a CONFIG_HVM conditional. I wasn't sure whether that was
> >> deemed reasonable.
> >> ---
> >> v2: Shorten PAGING_PRINTK() messages. Adjust comments while being
> >>     moved.
> >>
> >> --- a/xen/arch/x86/include/asm/shadow.h
> >> +++ b/xen/arch/x86/include/asm/shadow.h
> >> @@ -78,9 +78,6 @@ int shadow_domctl(struct domain *d,
> >>  void shadow_vcpu_teardown(struct vcpu *v);
> >>  void shadow_teardown(struct domain *d, bool *preempted);
> >>  
> >> -/* Call once all of the references to the domain have gone away */
> >> -void shadow_final_teardown(struct domain *d);
> >> -
> >>  void sh_remove_shadows(struct domain *d, mfn_t gmfn, int fast, int all);
> >>  
> >>  /* Adjust shadows ready for a guest page to change its type. */
> >> --- a/xen/arch/x86/mm/hap/hap.c
> >> +++ b/xen/arch/x86/mm/hap/hap.c
> >> @@ -268,8 +268,8 @@ static void hap_free(struct domain *d, m
> >>  
> >>      /*
> >>       * For dying domains, actually free the memory here. This way less work is
> >> -     * left to hap_final_teardown(), which cannot easily have preemption checks
> >> -     * added.
> >> +     * left to paging_final_teardown(), which cannot easily have preemption
> >> +     * checks added.
> >>       */
> >>      if ( unlikely(d->is_dying) )
> >>      {
> >> @@ -552,18 +552,6 @@ void hap_final_teardown(struct domain *d
> >>      for (i = 0; i < MAX_NESTEDP2M; i++) {
> >>          p2m_teardown(d->arch.nested_p2m[i], true, NULL);
> >>      }
> >> -
> >> -    if ( d->arch.paging.total_pages != 0 )
> >> -        hap_teardown(d, NULL);
> >> -
> >> -    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
> >> -    /* Free any memory that the p2m teardown released */
> >> -    paging_lock(d);
> >> -    hap_set_allocation(d, 0, NULL);
> >> -    ASSERT(d->arch.paging.p2m_pages == 0);
> >> -    ASSERT(d->arch.paging.free_pages == 0);
> >> -    ASSERT(d->arch.paging.total_pages == 0);
> >> -    paging_unlock(d);
> >>  }
> >>  
> >>  void hap_vcpu_teardown(struct vcpu *v)
> >> --- a/xen/arch/x86/mm/paging.c
> >> +++ b/xen/arch/x86/mm/paging.c
> >> @@ -842,10 +842,45 @@ int paging_teardown(struct domain *d)
> >>  /* Call once all of the references to the domain have gone away */
> >>  void paging_final_teardown(struct domain *d)
> >>  {
> >> -    if ( hap_enabled(d) )
> >> +    bool hap = hap_enabled(d);
> >> +
> >> +    PAGING_PRINTK("%pd start: total = %u, free = %u, p2m = %u\n",
> >> +                  d, d->arch.paging.total_pages,
> >> +                  d->arch.paging.free_pages, d->arch.paging.p2m_pages);
> >> +
> >> +    if ( hap )
> >>          hap_final_teardown(d);
> >> +
> >> +    /*
> >> +     * Remove remaining paging memory.  This can be nonzero on certain error
> >> +     * paths.
> >> +     */
> >> +    if ( d->arch.paging.total_pages )
> >> +    {
> >> +        if ( hap )
> >> +            hap_teardown(d, NULL);
> >> +        else
> >> +            shadow_teardown(d, NULL);
> > 
> > For a logical PoV, shouldn't hap_teardown() be called before
> > hap_final_teardown()?
> 
> Yes and no: The meaning of "final" has changed - previously it meant "the
> final parts of tearing down" while now it means "the parts of tearing
> down which must be done during final cleanup". I can't think of a better
> name, so I left "hap_final_teardown" as it was.
> 
> > Also hap_final_teardown() already contains a call to hap_teardown() if
> > total_pages != 0, so this is just redundant in the HAP case?
> 
> Well, like in shadow_final_teardown() there was such a call prior to this
> change, but there's none left now.
> 
> > Maybe we want to pull that hap_teardown() out of hap_final_teardown()
> 
> That's what I'm doing here.

Oh, sorry, I've missed that chunk.  Then:

Reviewed-by: Roger Pau Monné <roge.rpau@citrix.com>

Thanks, Roger.

