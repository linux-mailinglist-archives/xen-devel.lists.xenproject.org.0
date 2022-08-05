Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF958A9F5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 13:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381057.615564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJvE4-0006nW-WB; Fri, 05 Aug 2022 11:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381057.615564; Fri, 05 Aug 2022 11:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJvE4-0006km-SI; Fri, 05 Aug 2022 11:10:44 +0000
Received: by outflank-mailman (input) for mailman id 381057;
 Fri, 05 Aug 2022 11:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIDu=YJ=citrix.com=prvs=2098568dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oJvE4-0006jz-6V
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 11:10:44 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dcfe243-14af-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 13:10:42 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Aug 2022 07:10:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6509.namprd03.prod.outlook.com (2603:10b6:510:b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 11:10:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 11:10:17 +0000
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
X-Inumbo-ID: 3dcfe243-14af-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659697842;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WbQjmE9q6jg+VjB4JDRg+Fgiia03s44YrTmy40lpr3w=;
  b=CDXKshJhU5mr3z4UhUaMRthqQHLIPgL4CD0pQX+2q3/IalKbVO0F1FTS
   JyyIp0Y7vrZaaTBtzyNv6zAA1+f/4CdS0aiy6xbijhCHqzd4W5SJtQhjQ
   BUt23amup5BcxZioLSTXTMPY+OzV8Yypbts1MYMSmLUnF67WYLv1ZN3Pk
   Y=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 76700401
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J8J7uqh7ZAsA+vpUezYxUsPCX161eREKZh0ujC45NGQN5FlHY01je
 htvW2jVPKqMZ2HyKItyOYu0oRwO7J+Gz9FkSFA5pCwwRCIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSq5GtD1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eD40ao6VHXn530
 e0xCwkPbleIgb26+efuIgVsrpxLwMjDGqo64ykl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF+BTM/fpfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2i3y2beXwXuiMG4UPO2DrdNr3HzQ+klJGgRKfEqB+6GzsHfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoOYHECRA5cu937+thr3lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslROuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:O4uzqaFFV3DzSDWHpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="76700401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msR3t7UXY/jm6A16Ubk53PFA8WDB+iWrEuTlq+duc6a0hhryZEYxdO75AAKXR6d1T+zqlosKke5XPn+nPwfMWpMyHbxAv/pvmnRS4eYU6TNlKa54B40SDscj0OuQB4kB49O90K+IuxHhaDAZP01HFgxfns7yV1El1r8DdRvr3LC9jyRhPRY1sCNHiawRIDRPwY46/LEWer54SVfAiTcFy6qgybDisjKMU+gRJt7gEA08W5/bIm0chGMdgWPTR0MQaQLKh0jXd0ExZhPL639djyUPv1L7yjjYSU5gsvLP+iIZHG6vMHpyuk9yM3hYozI5Xz2LmwGto9/QFe/aIhRcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbQjmE9q6jg+VjB4JDRg+Fgiia03s44YrTmy40lpr3w=;
 b=RIGlDrLpiFO52oES/S4Hw0lzCsXBLEmbwU301Rt7ovntcAqXL+zDArcnalzAGX47FCl5dP2DHPvuzqYf744tBHgKY4jCS5Pn31cskgmjFCsJL71Or2FzbHCHt1Rl6V3B3SQqKo5g4wsRf2WN4932yRSAlKnJeWBhasr4aUxE8xcfPMNJzSVtse4xoRxdXa99TYScaE3Y5ZsUc9oNXAlEcUVsKVhkyIPywPDXCZVc2dEOFWXmavA+8OiOvWNDslYURoDFcLelfjSZRpeFwBoj/otHaU9loNtpm8FxMHx0FGOb1B326Olx3Z9JSXji1QOg8Z5MlF0q6Ij5TREXUT5gGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbQjmE9q6jg+VjB4JDRg+Fgiia03s44YrTmy40lpr3w=;
 b=BQaS8gXO0f0ldyJ6xG7nfz5iAlKpJ+m6QJcYbLfJa+ABqSI/LZXcbua7ioZczpMyf0c8/gPvcp6rCCcler6KH0LrrKvj+wwqXewtgvywlWEVyMNRNAXB54ishRJo19Wzqf1fpx0vYcJVJHBjs7TS7UOT6+W8vznpOemQq1OmHLw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/wait: Describe RSB safety
Thread-Topic: [PATCH] xen/wait: Describe RSB safety
Thread-Index: AQHYqLeZRPHbs/fcFkKmBoS12c4tV62gITQAgAAFPYA=
Date: Fri, 5 Aug 2022 11:10:17 +0000
Message-ID: <f84f74f7-a8f8-bf70-c2cb-a2a493a61ce8@citrix.com>
References: <20220805103840.23796-1-andrew.cooper3@citrix.com>
 <cd835582-a9e5-f756-8a08-148ae4d46983@suse.com>
In-Reply-To: <cd835582-a9e5-f756-8a08-148ae4d46983@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 822a7bb2-6291-4364-3b57-08da76d31436
x-ms-traffictypediagnostic: PH0PR03MB6509:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YHzqkx25LumOVjzbCAQVk4Ies/GN30n5IJgCdB06ZWdegwMhCwWmG0wGDwPDmLOnYZxnetffJrd1VV3gfQstFgepp7uKquQ2Hz+7v0KOn6necWmLcL3SAr9DSzz7WKb+Q89myIfzBPHEiLSK3alwpqaHVc4nI9RBnpQpVfXXVZddsUvUunbBvo1P6zBBjrDXDJyaovLmOC/hhl9/BR3icdW2Y4DCJpesjgNNmHgGBKakyMCNuAyGa3gUUxEa5Vm3qR3VccCnLgjyWpvCSSrGkkaTwBwnjvO4ZBxrP33QfDyeWQRJg30wMW5LK6du8ag8VJ81T543zmQnPWrXFG/SD1JqCFVZzqcUGvfVV2vqGYM3d6bI60CHTSbkufUL0DMRuhEYNPcmhOuQbRKBQJvvmeMu0Fe3ufHvc7O2IAwlg3emNYYj+AMoyKlpzSHL4JdWOOM9ytPjrrK4s8xqShNKdiXUsaou/h29byOUMi+76J0UEI8LJZ9Jz1P1YYBpFRsR4QxjH734bzdNyj4DHYU4r0F55phPx+v9HWdXn49JtVwHiBiktRiNpPEyIXuyQQLHEKTvNfbRrYuQiadQcG7u4R7GmMVwLO5SoakZfxDc+IArc28Ka4LLsn+5LrfxlGwjTApFnwKvKntw1PhbTCrZBl3c75NQ5oPJ0x4TnSJhcQ8IRO/bw0LzZktTFEEnqTIXseXls+dhSjDMoC0cGDMxgXyiI5v1OwxiwMpNPgcJTKEEQioybgaWqjoYfm+55busUYovPx5ri8zaWXnMz82qqKdq3M8HCEAmHFqi8rSshleMMAYHDcUy/RqB8ti1yqgHUK2oyGE8ab6FwmAtZ3WIO4HlCA7YsEW8rXItQ8BLyUFYsl39qTnPM06qbHLGSbJ3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(53546011)(186003)(6506007)(2906002)(41300700001)(26005)(2616005)(6512007)(38100700002)(86362001)(31696002)(38070700005)(83380400001)(82960400001)(122000001)(478600001)(5660300002)(6486002)(6916009)(54906003)(91956017)(66446008)(76116006)(316002)(36756003)(66556008)(8936002)(71200400001)(64756008)(31686004)(8676002)(4326008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmppenJ0N1RGVDh2dmdwd1V2RldOVllXbThhODhhSG8zVG9NVktScUFFSlNy?=
 =?utf-8?B?cU83UWdydnBHZ2kxNXphSXhxZUpaMEZPTllDVHpTM05UZ0JmczFhM2F3ZEVB?=
 =?utf-8?B?cXppZHVPMjNTK1owR2wyelhIdTVtb0hEV0RjQWpaeDdMZzRpeUxjOUplTDUw?=
 =?utf-8?B?SWlJb01uZDBCdG9RY2hxR2c1NHFEMyt2QVVGdkQyTjdsa2tjMnVxSVlUNU1B?=
 =?utf-8?B?cDVKandmNG1BTGtCbFhYazNrSzBaWHZWZXRqWVU2dlBueXNWS1J2Tm9jZUdP?=
 =?utf-8?B?QjhhN2Y1cVRTVWFzWlpaTXZLa25mVHBOdWUvOEoycFlySUcvK1EwWEtSaW1i?=
 =?utf-8?B?Zkpuc0xraVlSRTBXQW15b3hYQWhCck1laGh5eElCQnNPbWtueGlIdm5RUFFD?=
 =?utf-8?B?cVVzemUzaXN5VUN5NVlqNUFENUQwdzR2UDhhQkp4cGJFeHNhc3VmRm1pSkhq?=
 =?utf-8?B?aGZDa1c3NjNBckxGYzNkeWlWTCtvSDE5WmlsQWYzK1pkMmVrenJiOEc0STJV?=
 =?utf-8?B?alNqRkRuMFROa1k1ejgvdkd6VmExL0M1emJSeGZYOUhNUEwwWDJWbkhuSEE1?=
 =?utf-8?B?MlFWa2VFOFZld1RZTW9oSGZTamZPOWxTOEFHdi8wNFlNbUZjSkZCZloyR2tT?=
 =?utf-8?B?WnRnak03NDRYKzR3d1diUUNjeGgwT3RwVGsxOUN1bHM4VWpuK0lmU3RqR2dM?=
 =?utf-8?B?VDBGVWdId3MvQmxJYklmRERqZHEraHB0bmRKU083VFgxMmYyK3JtSFU0aVFC?=
 =?utf-8?B?VU84VXFqZkMwRDVVMkhxQnduaER0MDV2OWk4bldIWDh6VUxuMjJTZzRrOVFR?=
 =?utf-8?B?WDZrQlJ2TDVWaEtlckhYY2NPcDQxdCt3eUlqZmtIUUJQYnY2ZzN6TjNRWXVh?=
 =?utf-8?B?MW9pTnhESFVuZ0tiTCsxRHdqeFhnT2VTVXVlaHdjZE1taDZydUhGQnF3b09t?=
 =?utf-8?B?SGxnbkY3RGxROW1zWUdkVGRZSG9ucndva1N2cld6VWU1Wk5aWE9naDlSOVNB?=
 =?utf-8?B?VWluREJYeVB0OWUwTDJoVWRTVEozOFhTQjhZbFE5Tk5ETHdxSnJva2c1TFVv?=
 =?utf-8?B?VDRzSE91S3B1WkpiRW9wZ21RR0N5dEhrUTlvcE5KU0RTclVhV0kvdHJqeTVK?=
 =?utf-8?B?N3BKRDIweW9OeStrU2pHV0dsQXVvcXZia1Qrd2YrOCtlU1VuS1NMWk5ld05V?=
 =?utf-8?B?MHFiS3FLbFd1ODdBNklxc3N6eWt2aDNqb214VlVsbGsyOWxKeXJ0V1ZRMkFV?=
 =?utf-8?B?NWxab28wc2NyWktUYXV0VXUrVzlQWEY1YXZGL3dENnY0R0lpQmVvZlZoMExH?=
 =?utf-8?B?ZStwa2IxWEEyN003OHdlSTNUMHowUHB3UllTbk45aDFDZzVoSHFCQzBEWlNw?=
 =?utf-8?B?bGZXaWZDb0FtTHVQY09YdnpySks3NHR4eVpZdWlCNWkxWGJmK2JhNWdHNmdt?=
 =?utf-8?B?MXVyOS9tamdIM0R1QmVlUVlLbTBJZEpwL0grL3V1RlVSYkZacG1mTDJiem9H?=
 =?utf-8?B?YkdTMHd4UjgzSGRmSU5xdStXQjZDSlFnV1dLT0hFckZxUFFsU2pjYThQanJN?=
 =?utf-8?B?RFE0Z1FrVkZmZ3lwNUx6dm5oZ01PTkNiMHNLbm1zZTBMSlJuL3NKQ3d5cktQ?=
 =?utf-8?B?MnZXdm9hQ0ZUMGh2d2ErZWV5a3gxbGMxeE04ajVVZjQ0N05sN21tc0g5ZWo3?=
 =?utf-8?B?ZWFqQ1BjMDFoSWV3aGprU0tSVXlmb21oS2tYTHl0bVpMMnFyTnVvZ2VZZzBw?=
 =?utf-8?B?QUdqMlF4UFdYZFZPRmNBWmlUczlzZVRuY2Y0TEdpYmFoNGtpU3NYNG0rb1c3?=
 =?utf-8?B?YUtsOU1HUTd5c1dKMTNTRWdiOE85M1pZOGoxQ2xlQXZOdlJCYWN6aW5CVjZO?=
 =?utf-8?B?NzBxQVZoRkhtRFFRL3NxN2tRNk52N0lvWU1Vd2ptMEFtVytkU2c1bGdHOUdY?=
 =?utf-8?B?Mlo1V3hIY0pVSjM4RnliK1lmc2dKbW5kT3RvRzhnSnlPelFINmF5ckRtTjNa?=
 =?utf-8?B?MjNKdGJzdW12Y0gyYXNwV0R0UkFLUkdoWW9kbzAzZktIVFRhbEN2QXZtTEFs?=
 =?utf-8?B?TnpBNzFPUXZ3YjQ5d1pFSk9UZ2dWRjhoekJ5ZDhweW93VVNSU0pwZEtBSGR6?=
 =?utf-8?Q?KwTwWdMO3BrEG0tNTppPuf+q/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64E30F8BBB2B9849873CE295B00941CF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822a7bb2-6291-4364-3b57-08da76d31436
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 11:10:17.5153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6TYyJzwakcQeDV1RauZNu9JPhfHDd3/8qwR4LLB1JMmjgWAtdk+gF2y6ixrbbl7/8c6U4WhQnTHuC4cRtR6Xu0isnwhPmlk67BzkpxF9CyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6509

T24gMDUvMDgvMjAyMiAxMTo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjA4LjIwMjIg
MTI6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBJdCB0dXJucyBvdXQgdGhhdCB3ZSBkbyBp
biBmYWN0IGhhdmUgUlNCIHNhZmV0eSBoZXJlLCBidXQgbm90IGZvciBvYnZpb3VzDQo+PiByZWFz
b25zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+IHByZWZlcmFibHkgd2l0aCAuLi4NCj4NCj4+IC0tLSBhL3hlbi9jb21tb24vd2FpdC5j
DQo+PiArKysgYi94ZW4vY29tbW9uL3dhaXQuYw0KPj4gQEAgLTIxMCw2ICsyMTAsMjYgQEAgdm9p
ZCBjaGVja193YWtldXBfZnJvbV93YWl0KHZvaWQpDQo+PiAgICAgIH0NCj4+ICANCj4+ICAgICAg
LyoNCj4+ICsgICAgICogV2UgYXJlIGFib3V0IHRvIGp1bXAgaW50byBhIGRlZXBlciBjYWxsIHRy
ZWUuICBJbiBwcmluY2lwbGUsIHRoaXMgcmlza3MNCj4+ICsgICAgICogZXhlY3V0aW5nIG1vcmUg
UkVUIHRoYW4gQ0FMTCBpbnN0cnVjdGlvbnMsIGFuZCB1bmRlcmZsb3dpbmcgdGhlIFJTQi4NCj4+
ICsgICAgICoNCj4+ICsgICAgICogSG93ZXZlciwgd2UgYXJlIHBpbm5lZCB0byB0aGUgc2FtZSBD
UFUgYXMgcHJldmlvdXNseS4gIFRoZXJlZm9yZSwNCj4+ICsgICAgICogZWl0aGVyOg0KPj4gKyAg
ICAgKg0KPj4gKyAgICAgKiAgIDEpIFdlJ3ZlIHNjaGVkdWxlZCBhbm90aGVyIHZDUFUgaW4gdGhl
IG1lYW50aW1lLCBhbmQgdGhlIGNvbnRleHQNCj4+ICsgICAgICogICAgICBzd2l0Y2ggcGF0aCBo
YXMgKGJ5IGRlZmF1bHQpIGlzc3VlZCBJUEJQIHdoaWNoIGZsdXNoZXMgdGhlIFJTQiwgb3INCj4g
Li4uIElCUEIgdXNlZCBoZXJlIGFuZCAuLi4NCj4NCj4+ICsgICAgICogICAyKSBXZSdyZSBzdGls
bCBpbiB0aGUgc2FtZSBjb250ZXh0LiAgUmV0dXJuaW5nIGJhY2sgdG8gdGhlIGRlZXBlcg0KPj4g
KyAgICAgKiAgICAgIGNhbGwgdHJlZSBpcyByZXN1bWluZyB0aGUgZXhlY3V0aW9uIHBhdGggd2Ug
bGVmdCwgYW5kIHJlbWFpbnMNCj4+ICsgICAgICogICAgICBiYWxhbmNlZCBhcyBmYXIgYXMgdGhh
dCBsb2dpYyBpcyBjb25jZXJuZWQuDQo+PiArICAgICAqDQo+PiArICAgICAqICAgICAgSW4gZmFj
dCwgdGhlIHBhdGggdGhvdWdoIHRoZSBzY2hlZHVsZXIgd2lsbCBleGVjdXRlIG1vcmUgQ0FMTCB0
aGFuDQo+IC4uLiAobml0KSAidGhyb3VnaCIgdXNlZCBoZXJlLg0KDQpXb3cgSSBmYWlsZWQgYXQg
d3JpdGluZy4uLsKgIEZpeGVkLg0KDQp+QW5kcmV3DQoNCj4NCj4+ICsgICAgICogICAgICBSRVQg
aW5zdHJ1Y3Rpb25zLCBtYWtpbmcgdGhlIFJTQiB1bmJhbGFuY2VkIGluIHRoZSBzYWZlIGRpcmVj
dGlvbi4NCj4+ICsgICAgICoNCj4+ICsgICAgICogVGhlcmVmb3JlLCBubyBhY3Rpb25zIGFyZSBu
ZWNlc3NhcnkgaGVyZSB0byBtYWludGFpbiBSU0Igc2FmZXR5Lg0KPj4gKyAgICAgKi8NCj4+ICsN
Cj4+ICsgICAgLyoNCj4+ICAgICAgICogSGFuZC1yb2xsZWQgbG9uZ2ptcCgpLg0KPj4gICAgICAg
Kg0KPj4gICAgICAgKiBjaGVja193YWtldXBfZnJvbV93YWl0KCkgaXMgYWx3YXlzIGNhbGxlZCB3
aXRoIGEgc2hhbGxvdyBzdGFjaywNCg0K

