Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE415068E3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308010.523478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglHw-0004EE-0X; Tue, 19 Apr 2022 10:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308010.523478; Tue, 19 Apr 2022 10:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglHv-0004BS-TK; Tue, 19 Apr 2022 10:40:51 +0000
Received: by outflank-mailman (input) for mailman id 308010;
 Tue, 19 Apr 2022 10:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nglHu-0004B7-Lj
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:40:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b8f2237-bfcd-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 12:40:49 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 06:40:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB3897.namprd03.prod.outlook.com (2603:10b6:5:49::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 10:40:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 10:40:42 +0000
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
X-Inumbo-ID: 2b8f2237-bfcd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650364849;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XHl5zMVUI9JQj3qnO004w1N0WeBh1P6ZMNp8VXwha3o=;
  b=gI3XEmFvZVMzt2S4xYVbiqzc+QV22GZ9lDJkWqO0hO65esR44wrk/Uh/
   E5osRlVVPOpAzfDfXBht0vEAbpxcgyjLo4pO0VRy/yY4hSEkRiiJjBNip
   IPB+lEa83mTy/1qmSYT66IsILbvDnL3U2Hx2l1XSrW25VaR7gGpWVjjRx
   E=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 69797790
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L2AcvKkg08zrlvvxEXtvE63o5gxhJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOCjzTPPnYY2enfI1/PtmzoEIF656DytRrTAVprHw8HyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWlLV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYdCgQEoPFp/UhVgRSKzt7eq9ix+7tGC3q2SCT5xWun3rE5dxLVRhzFqpBv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXu5kBgmdYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfRmvDmMk10puFTrGMX8e9C1TMJ7pUi7i
 2vc023dLxYiDeXKnFJp9Vrp3IcjhxjTWo0IE6aj3uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHOAsxgVHcdeEugm8wyTw4LT+Q+SAmVCRTlEAPQkvsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkA9L3IGZCICZRsI5Z/kuo5bpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7pcUL2rS2+1bKxS2topzSZgEw7wTTGGmi62tEiJWNYoWp7R3Q6q9GJYPAF12Z5
 iFay46Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 Sc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:ThXG9KwLecosll8NRQskKrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.90,272,1643691600"; 
   d="scan'208";a="69797790"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLWBfiVab6VPaxtxu6hUL4dS5r+6RJGAeDC1AzL9Ov0F10gfOFw3av6w5uov8vHbXerXV9Vlq+r/n5Y6dCcIceUGvc2I5f55M0I3a2kZvIT44wRqgETNMZ2Iw+V3Po9HapdguOERHgpSIZHA6spDANdOL5DVSh4fdS5WGW8lLdEZj/SWl/NLxRztHu7mJf19x0RrmxM9o5g3BXzUiNXv8TE0Y1OBNI98S3unvAQ8aK7dZOEaiwkCbRhYSqBxe2ltIjiVZvyAH3p87vVueiRVqRnk1PlDw/KLXJzopRLTgXQhsqFufXwp0Drf84Ut3K1VlkkBr2Uwb7qF9O6AAbl3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHl5zMVUI9JQj3qnO004w1N0WeBh1P6ZMNp8VXwha3o=;
 b=DtCyR1fWRqkc71Z9zvg8iFEhZzJUHucdjAuCcRjfvUc7aiCQ/QSIfgx5PA3A4Cj23GRR1JmhrvPNZF44+AFCTU/FBfbugd1dFCDd5b9pfKpbi0qGsRvnbgPVgTlIKkd1dofRy8s7k7MQS7iHvJ6KDSI+TBrkA/LFtujfs6FfXlTUR94XWFHXb8E4wcOYOLMRFaJA9XaST4PGaClcYXWbxm2VIe081YaV0Z/vZlYSk7+WS1ZQw6tRW0DxlInx/KYUd2BE35OmmCFpGqBxdg9T/iyKYiNy4W6+5KlpsU8/294T7s+gYs2RWsATU4Q2zJfHQRJegKpO/j3SBglVMLKVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHl5zMVUI9JQj3qnO004w1N0WeBh1P6ZMNp8VXwha3o=;
 b=g9FIRwNmxHtiswuPCB6c+dumiSuIp9Yoxc3z1v/qk+Xu4bHNA54OWi71q5pXJ2i13J8t7Fw50JRQ8YxQ3f0BLe/jrkI5kQxRNVxUt4DgSFynHx1zyUJCRPWHFWg9IrU+XHOh3ftEnhuApuw8hj+VZKBGP620mmL5yelVQQlVDvo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Cheyenne Wills
	<cheyenne.wills@gmail.com>
Subject: Re: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Topic: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Index: AQHYU9bjmHO326ELbkuQmQOwkh6+0Kz3DCaA
Date: Tue, 19 Apr 2022 10:40:42 +0000
Message-ID: <5c6f75d7-d5d1-856f-c8d0-da1bd823be63@citrix.com>
References: <20220419101850.3045-1-jgross@suse.com>
In-Reply-To: <20220419101850.3045-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a90934f-7599-4b46-55c7-08da21f10d6e
x-ms-traffictypediagnostic: DM6PR03MB3897:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB389791D75E07C312615DDC11BAF29@DM6PR03MB3897.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5afWwdGzeaSW7ftU97ATZrAXaidb58XBwveHPxGKZFBLeYAHYHyiJnRLfAPMZNLvJ/snGV1EDCSHBGYw/yyjrT0S0h+1Xv5iHM0kM17/x58Ybl8BYmPKTe4p0IbqamwEpJ5Krl/ZtWHxx47Zeh5LYeFbUFF2He9VghMiWijo6a9hAl8dhitI4EaTlC7T4+hJuwDODBvZaLvnaPv1xi1V7QODVxGoSmnHNe9+OHYhqCP6OyNKrtgCmN/9MP0mRchvt4woselHVUaphxzzsCPNp7Fesz3IAWPxB0Af8XSJe5W+K8RJgzn4b1QT/bhnhYqeBIzPS0UMKC0sQOcFMGO+/VYJcfxEWsVa9wmRRm+FNQrPa44ZnTR+6EdqNUUvLYl+kX5B789naiIJqvA9I0IOXaOuhYhH89PUrG65UHkm5aFfJ8t3Jjcl9nhcyWUWlOjwAzF7AAfHPHlvuh6wFRrIWQImsAY/p4nN5v9hXx4YoGiPSBqynqhvTPAEtwSq7PxwiRuS8Ba0NdE8f2MQk6Xqlz09cYF5Tzy352RfPQVh5l4201pjtmqtF4maeKBs572jGcR6frQI+g2gsoAXq8Z6+iv8ISbWxoXKxuOinEXf2XPXUJJpjtTAS7PGNNuMuyJOaOFqwcxVyqbf97FAUN9nOktnJATgil6tyxzMj6EHW4mYVF84Ct/rbBzuWFr9Vb7rsBrDoWgqYtOC/MEcTDWTL2SdfmPCN6O8VuIDKv/nKJCN8Y/7JCCvyVuExYePNexGVl4lapaEamynDKHFFAZGjw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(508600001)(86362001)(6486002)(6512007)(8936002)(2616005)(71200400001)(2906002)(83380400001)(5660300002)(53546011)(6506007)(31696002)(36756003)(76116006)(66946007)(91956017)(66476007)(31686004)(4326008)(66446008)(64756008)(66556008)(8676002)(110136005)(54906003)(82960400001)(122000001)(38070700005)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkttUFJBMHVEMG10VDJMZUpCTmV0enZwZWRGSEZabkRMMjBWMVY5MjlkanNW?=
 =?utf-8?B?SytsNDk0SFBMSG9HY2JFUEliM091VFBqOWVDQkZieDN3UFhqSzF0VXlnNXd4?=
 =?utf-8?B?bHZ3RE5BUllHa2RnSXE5K2d5TFhaUGZUeVY2SExKWTM4Q2QwcjlJWTNCekJs?=
 =?utf-8?B?UENCMXhiMDJKei9BK1M1WS9RZ0Q3U1JtZkpCRWo4bjYrMWxtRWc3dGl6bTFB?=
 =?utf-8?B?S05TUDlTalpYRTVScTUvdXQ1RkwzazZzb01kZTF1QWtLeldKOUZneEtVZEtZ?=
 =?utf-8?B?enBOSjVXQlNNMUlmMzVxT0h1Qi9qSERNbzkvTGpzcVo1ZHd4VElaV1R0dHRS?=
 =?utf-8?B?YWpMdFRjSmFrRXNiZ2thL1pHRWMxOEZhcEZyZHFlMHdvUGtnNnNKMGYvU1Vs?=
 =?utf-8?B?U09iS1ovSXpucmg4eEllUHBsRDJGbExKTnJOM1FvaEpQN0UyTHFISnlVYjVp?=
 =?utf-8?B?SkQvb1dmb2ZpM2MxTGgyMnhuZWJqOTJmZ3NOTkhsekZPTTVZek0yRVJSY051?=
 =?utf-8?B?Z0xIUjI5dlVOYldTV0o4aEd2aVBGQ3VSVDBCMC8rTWNhK09nRFRjVFNQS0dB?=
 =?utf-8?B?TVJTQ0pMUUJ1WW9ObDZvWGh4OWk2dkI1NGtKSy8wZENuUytJNmxPeDY2d1Fr?=
 =?utf-8?B?b2ZJS1ZDSjVieWdVS1RxRmpvWjBzODE5VHRIZ000R3d6TFdOM1hweTdzd2dR?=
 =?utf-8?B?Q2ZVbVNJRVhyY2RZTEQxYU1mUmZmUTRQb3M5cS93cERuNEs4a2ZIanFxTlRn?=
 =?utf-8?B?aWhkcUdJeDJDZkRlU2o1NHU1WjlpMGE1VzA0RzJmYUtna29qNWVrZ1pvZzFo?=
 =?utf-8?B?K1Qxd3EzNGFsS2tVV1oycE9MT3YvOUZZS3p6YlJQbVN0VGtFMVg4enFUY1ZL?=
 =?utf-8?B?Mkp2K2tzcVRjK1JCRmEvdHlmdmlpODdUUGhvdnhaWnNURkF0eXVWQkVrSHdJ?=
 =?utf-8?B?UzZmVXlZRTZXS3htNFFqQzlwUi9ieUE1RGFJbmZSM1VCOWM0Tzh1U2NqajBH?=
 =?utf-8?B?V2NBR3hHamN0SjNnbTYxbnEyV0JmV00rdVlvYXFOcVozUmNVTXc5U3hScVlU?=
 =?utf-8?B?RW5YajZtbVk0VUErNXA3SzdjVE5KTUQ0WGRidWRhNGxSM095U2JsNWJyV3VB?=
 =?utf-8?B?V1ZNM09SRG5lT05oSjVXQ3ZSRms4c055VjgyM1dOajdBdmViZlZBZGRmS2p4?=
 =?utf-8?B?TlNDQUNET2R4NnhXS3NJenFnZlRkNUJMREV5bk0xZ3YrdTA4SnBvR1RYVzd1?=
 =?utf-8?B?VFBmVHY5dkE1MEFTTGREVVlNRTBPdEIwMjExODQwZTljV1FjWnhNU25hdE9W?=
 =?utf-8?B?WjAzRHdDVlZ4YXByWFVBVSs0UFBYNzNQU2EvcldYUVBhOStqMkh4WUtOUlQ2?=
 =?utf-8?B?YlpZQVR4bG9iRkFic3RVbmJva2pudnNtZStKWDZYTUU5VHlBR1NJZWtZcHdT?=
 =?utf-8?B?Y0hnVW1rbm5Lc3F5Q3hJTVI3SzN0U3pxd0VjNVB0YTBxdUJCMnhBSnAvaHl0?=
 =?utf-8?B?YzlJVUdMSXpHcDJvN3FVYkZYTVdiTFVNNlNwb2pHWG8ydHJEZ3VHdmhqUDZS?=
 =?utf-8?B?QUtmbXhBdlArOTlUeUp2MHNXRVdzcU1vc3ZIZ2tIVW9VcmlaaDBjSUlEVDV6?=
 =?utf-8?B?QWJ4U1VwcU5HNGFmQ3VYbTY2aGhRYTBYU0FDRjBDODlEY0c0TmxuM3ZVRzhS?=
 =?utf-8?B?SmkxVS9lNkQ4ZjJGMWNsRWQxNy9WdzZkMHhiSmcxNmtGT2prcE1vK2dWZkFB?=
 =?utf-8?B?M2pKSVMyRExFOEt5MzRKWFlJbWhsRGNkTHNaczJvbGxUUzRXRGYrdVdDeTRa?=
 =?utf-8?B?ZUxEMWtSbHpDUDUvMFZtZ3RFYmdxckxnQVltRTJUemhFNUhjeitTbVNtWGJN?=
 =?utf-8?B?U0ZSMkhrK1NlQkN4ajhqVjJGSk5kb3E2TERkWTdtRWV6M2ZMZ3QwWEZLZ2lM?=
 =?utf-8?B?WEJQVlNjbnFxT21iS1hiWWRXMkpFRUhQaWhPMVFFTUtCbnpxcUM1a0ZWdFRR?=
 =?utf-8?B?OFdyS2IvQkxkRDlUYW8rU295UVdhbkt6QWVXazM1enhPWHJMSXFkRTNkdnA3?=
 =?utf-8?B?VDVZN2pXQ3pRdWhGL0t3VThrenlyaXYvKzNTZGFOTnZWQnAzNkNDWXY3MGZi?=
 =?utf-8?B?cjJoZ09LTlJZVk5Pc2VmNlpHQjZsbElhUjJ3Z05SU1NPRXNVZ3V6ZnF3WmdV?=
 =?utf-8?B?L0JOR3VyQUc5NDRXa3J4VTdnZFduS0tPOHg5d1BqYnVMV3FwQWk2NHpVVEFh?=
 =?utf-8?B?Ri8yaWs4dTlHaGhzV3daREhKMTc0TEZUandNM0YrTzdzK3dhMCtLbGNtRkxa?=
 =?utf-8?B?dlVrTjJGOGVvM2wyamRpRUlQV0o1alNRR0R6c1lHa0ZFbjlDNnJhQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <490B5D0497AD5540AF7D2A41FD3AB4CC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a90934f-7599-4b46-55c7-08da21f10d6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 10:40:42.1422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+ceVgegdC+AEwYVXJtgqNQWh/ZP9KO35v6TUHAO1cb+4tqS7PiNGvk1Yxm4OB/pRcYuMhI8S+OlCG4UBysOyMq5zVWgLmBgGRrtw/MewtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3897

T24gMTkvMDQvMjAyMiAxMToxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQSBoeXBlcnZpc29y
IGJ1aWx0IHdpdGhvdXQgQ09ORklHX0dEQlNYIHdpbGwgY3Jhc2ggaW4gY2FzZSB0aGUNCj4gWEVO
X0RPTUNUTF9nZGJzeF9ndWVzdG1lbWlvIGRvbWN0bCBpcyBiZWluZyBjYWxsZWQsIGFzIHRoZSBj
YWxsIHdpbGwNCj4gZW5kIHVwIGluIGlvbW11X2RvX2RvbWN0bCgpIHdpdGggZCA9PSBOVUxMOg0K
Pg0KPiAoWEVOKSBDUFU6ICAgIDYNCj4gKFhFTikgUklQOiAgICBlMDA4Ols8ZmZmZjgyZDA0MDI2
OTk4ND5dIGlvbW11X2RvX2RvbWN0bCsweDQvMHgzMA0KPiAoWEVOKSBSRkxBR1M6IDAwMDAwMDAw
MDAwMTAyMDIgICBDT05URVhUOiBoeXBlcnZpc29yIChkMHYwKQ0KPiAoWEVOKSByYXg6IDAwMDAw
MDAwMDAwMDAzZTggICByYng6IGZmZmY4MzA4NTYyNzdlZjggICByY3g6IGZmZmY4MzA4NTYyNzdm
ZmYNCj4gLi4uDQo+IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPiAoWEVOKSAgICBbPGZmZmY4MmQw
NDAyNjk5ODQ+XSBSIGlvbW11X2RvX2RvbWN0bCsweDQvMHgzMA0KPiAoWEVOKSAgICBbPGZmZmY4
MmQwNDAzNWNkNWY+XSBTIGFyY2hfZG9fZG9tY3RsKzB4N2YvMHgyMzMwDQo+IChYRU4pICAgIFs8
ZmZmZjgyZDA0MDIzOWU0Nj5dIFMgZG9fZG9tY3RsKzB4ZTU2LzB4MTkzMA0KPiAoWEVOKSAgICBb
PGZmZmY4MmQwNDAyMzhmZjA+XSBTIGRvX2RvbWN0bCswLzB4MTkzMA0KPiAoWEVOKSAgICBbPGZm
ZmY4MmQwNDAyZjhjNTk+XSBTIHB2X2h5cGVyY2FsbCsweDk5LzB4MTEwDQo+IChYRU4pICAgIFs8
ZmZmZjgyZDA0MDJmNTE2MT5dIFMgYXJjaC94ODYvcHYvZG9tYWluLmMjX3RvZ2dsZV9ndWVzdF9w
dCsweDExLzB4OTANCj4gKFhFTikgICAgWzxmZmZmODJkMDQwMzY2Mjg4Pl0gUyBsc3Rhcl9lbnRl
cisweDEyOC8weDEzMA0KPiAoWEVOKQ0KPiAoWEVOKSBQYWdldGFibGUgd2FsayBmcm9tIDAwMDAw
MDAwMDAwMDAxNDQ6DQo+IChYRU4pICBMNFsweDAwMF0gPSAwMDAwMDAwMDAwMDAwMDAwIGZmZmZm
ZmZmZmZmZmZmZmYNCj4gKFhFTikNCj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKg0KPiAoWEVOKSBQYW5pYyBvbiBDUFUgNjoNCj4gKFhFTikgRkFUQUwgUEFH
RSBGQVVMVA0KPiAoWEVOKSBbZXJyb3JfY29kZT0wMDAwXQ0KPiAoWEVOKSBGYXVsdGluZyBsaW5l
YXIgYWRkcmVzczogMDAwMDAwMDAwMDAwMDE0NA0KPg0KPiBGaXggdGhpcyBpc3N1ZSBieSBtb2Rp
ZnlpbmcgdGhlIGludGVyZmFjZSBvZiBnZGJzeF9ndWVzdF9tZW1faW8oKSB0bw0KPiB0YWtlIHRo
ZSBhbHJlYWR5IGtub3duIGRvbWFpbiBwb2ludGVyIGluc3RlYWQgb2YgdGhlIGRvbWlkLg0KDQpU
aGVyZSBpcyBzb21lIGV4cGxhbmF0aW9uIG1pc3NpbmcgaGVyZS7CoCBUaGUgYWRqdXN0bWVudHMg
eW91IG1ha2UgYXJlDQp3aXRoaW4gQ09ORklHX0dEQlNYLCB3aXRoIHRoZSBleGNlcHRpb24gb2Yg
dGhlIGZpbmFsIGh1bmsuDQoNCg0KVGhlIGFjdHVhbCBidWcgaXMgdGhhdCBub24tSU9NTVUgc3Vi
b3BzIGVuZCB1cCBpbiBpb21tdV9kb19kb21jdGwoKSwgc28NCndoaWxlIHRoaXMgaXMgZ29vZCBj
bGVhbnVwIHRvIGdkYnN4X2d1ZXN0X21lbV9pbygpIGl0LCBhbG9uZyB3aXRoIEphbidzDQphZGp1
c3RtZW50IHRvIGlvbW11X2RvX2RvbWN0bCgpLCBhcmUgbm90IHN1aXRhYmxlIGZpeGVzIHRvIHRo
ZSBjcmFzaCBhcw0KcmVwb3J0ZWQuDQoNClNvIHNvbWVvbmUncyBnb2luZyB0byBoYXZlIHRvIHdy
aXRlIGEgM3JkIHBhdGNoIHdoaWNoIGFjdHVhbGx5IGZpeGVzIHRoZQ0Kcm9vdCBvZiB0aGUgY3Jh
c2gsIGFuZCB0aGlzIHdpbGwgYmVjb21lIGNsZWFudXAuDQoNCn5BbmRyZXcNCg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2RlYnVnLmMgYi94ZW4vYXJjaC94ODYvZGVidWcuYw0KPiBpbmRl
eCBkOTBkYzkzMDU2Li5jMGRkNmVhZjE1IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvZGVi
dWcuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvZGVidWcuYw0KPiBAQCAtMTU5LDE3ICsxNTksMTEg
QEAgc3RhdGljIHVuc2lnbmVkIGludCBkYmdfcndfZ3Vlc3RfbWVtKHN0cnVjdCBkb21haW4gKmRw
LCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICAgKiBSZXR1cm5zOiBudW1iZXIgb2YgYnl0ZXMgcmVt
YWluaW5nIHRvIGJlIGNvcGllZC4NCj4gICAqLw0KPiAgdW5zaWduZWQgaW50IGRiZ19yd19tZW0o
dW5zaWduZWQgbG9uZyBndmEsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYnVmLA0KPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGxlbiwgZG9taWRfdCBkb21pZCwg
Ym9vbCB0b2FkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGVu
LCBzdHJ1Y3QgZG9tYWluICpkLCBib29sIHRvYWRkciwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQ2NF90IHBnZDMpDQo+ICB7DQo+IC0gICAgc3RydWN0IGRvbWFpbiAqZCA9IHJjdV9s
b2NrX2RvbWFpbl9ieV9pZChkb21pZCk7DQo+IC0NCj4gLSAgICBpZiAoIGQgKQ0KPiAtICAgIHsN
Cj4gLSAgICAgICAgaWYgKCAhZC0+aXNfZHlpbmcgKQ0KPiArICAgIGlmICggZCAmJiAhZC0+aXNf
ZHlpbmcgKQ0KPiAgICAgICAgICAgICAgbGVuID0gZGJnX3J3X2d1ZXN0X21lbShkLCBndmEsIGJ1
ZiwgbGVuLCB0b2FkZHIsIHBnZDMpOw0KDQpUaGlzIG5lZWRzIHJlLWluZGVudGluZy4NCg0K

