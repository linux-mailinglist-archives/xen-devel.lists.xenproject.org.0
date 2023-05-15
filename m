Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9C70278D
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534631.831818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTtF-0006bb-Fe; Mon, 15 May 2023 08:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534631.831818; Mon, 15 May 2023 08:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTtF-0006ZO-CI; Mon, 15 May 2023 08:49:09 +0000
Received: by outflank-mailman (input) for mailman id 534631;
 Mon, 15 May 2023 08:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjwX=BE=citrix.com=prvs=492a8bb35=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pyTtD-0006Z7-4x
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:49:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57724042-f2fd-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 10:49:04 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 May 2023 04:49:01 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5943.namprd03.prod.outlook.com (2603:10b6:510:30::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 08:48:59 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 08:48:59 +0000
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
X-Inumbo-ID: 57724042-f2fd-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684140544;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=i95jhdnRcFZYlTYKQ4D3BgPVddhdALxz3L79+YtlSk4=;
  b=LEBbsLbMpT3tlgX71ETVjDlP7kZzuOqLvIjd8s1lXH2q5pjxBFqIOeci
   BLE+FpJ2vH4CeP8eKpXxS+DvaZ2GiVz91AiKRK1sLX56/9Al5r2zf30DY
   Q1Olbkqmmibopu7PKErrrh55DI65bpxkMJSklFJMjG4sYbNVM/9Wud3/j
   E=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 109050960
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kHIjzql4o6DnmNVI5R43XDvo5gxhJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXmyBb/iOZTahLtglPYq//UwC78TdzdNlSgJrrXpnEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5QKGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cU8dR8RVUmCvOuJ6aOiVrR0mfk5HMa+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC0WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHuqAN9KRePgnhJsqE2znkMsKE0Ibxyykdaw2krjYfUCB
 FNBr0LCqoB3riRHVOLVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLkIw1jxuJdN9sEae5h97yBBn5x
 jzMpy87750IkcMF3qO8u0vbijihopzISA8d7wDbGGmi62tEiJWNYoWp7R3e8qxGJYPAFl2Z5
 iFcwo6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 Sc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:AWX7yqsJEX0/PZvBWFl68tN57skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-Talos-CUID: 9a23:8n0a/W3L90sR1fOu7iOCPbxfI+R4XWHmlXbrKnCRGH91FaWKdEWg9/Yx
X-Talos-MUID: 9a23:pXkKMAay7lLsK+BTpx+0qw5CZNlSpK2eJ0ldlcg8nJSrKnkl
X-IronPort-AV: E=Sophos;i="5.99,276,1677560400"; 
   d="scan'208";a="109050960"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSAJt/emBqfM8SCTEWERw99ZOzVovi9hWcuaCpTZfqVBADHLIzxtei42DlY58SoYM0wThxTMr2HHlpzCGLPznh1k+dPhrGJL6aD6oAXEyUaD6iqNcoxPOYVtQri5iNZVGiZXQi+zRZd1G1i1FZBTKtLITGI0UmAXG7GIJsDqHGnlZ8NeXbuSa8si+Oxi13OApBwZIEOa2rySslKA4zxIbp7MuXxemRivmgUOG7eCzPx2NMPdmjyd5NcK6JJBHWb5nPfQ6iPgvl0r/mg8Z9j8xNZgEyO0mT2bQAytJHmWLMEwN6Tg4EYhK8pTwy3rRPBeT+9su/jgK6DS8XcntpVhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iUFWSD5fZCel+qEQsi7Fu7uh+nvenxPJNXcaoWo3Hs=;
 b=C1Zkk4duAMzhbrh03IFluw2JbF/3mVxIwY+prhk32q6v0Y/mbkU4LAc1q2hWMhqVT/q6IOq6U7UDnEXE6/p1YNiccyd4ZFHasKcXewA+UdjjpsiTmnT/6t+eG8AAd/g7cfxIVkbHfPOiV8WSkxjpk4uEUMlfLtlX3vVCf0rgKCh6aiQl88xHl57Nc2GV8Rq6qUb8sVReEY1RD9r8LJ5aRoDT0VcMz6QM3plc9mXdrPrECQbHX3luutj32Vgm+sfxByC+i5hHkA5SVbH8rcFQXF1xpTpxwn8pxn1ERN06VpU1fy1YPhOov5j1o159R5RJiXD8gOnAOaF0KcE3ywnwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iUFWSD5fZCel+qEQsi7Fu7uh+nvenxPJNXcaoWo3Hs=;
 b=AGpQrcFkyeWKn+6F37aA7/f2jfhYAqLsgfuaYZtbTS9wdHv5gR0nLOlqowOveZ08H0fHz3f8hvoyI6a2WfJK6yE7Z6Kw5S42tpe/zEqZV/JwpNI5eQAxMBf0+weTYF7UV6Q/hJ3vaQPzQ6cyc5aj9SRgwy7KsrOYhHuvepRlwP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 15 May 2023 10:48:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
Message-ID: <ZGHx9Mk3UGPdli1h@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230513011720.3978354-1-sstabellini@kernel.org>
X-ClientProxiedBy: LO0P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 563691e6-87db-45d5-e56f-08db552139a3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yR+fY9QDxLVvBbk8tsZk4wpShUuYZ2Ba/gLj80rtI0SjapNZqT+uWZeP8hHLmgBS5Vrriw7FXFBRWxboFdGG5MgeHaHrFQL0GhPGjwNN1VGoxIT1NdrYn5DZGBS2MoYMsuJJJU9voLCAKHAMlW0z4GFJljmYaqa86kI9A+S0FprLVW+Nonh+LbAlQ+hiaIpZ8oAejV85rio+qxY30UhirWzKF2nOv1YaUyJNp85yNQVC5Qr83TBUVSDmmv+N3kV/Pp6WLC+eQTigkP8FbN61WPR4US1AY0i6ykWwvRqvba1WvtdBa55nAeuQ3NhX8lkiuE1m9ChNPdLNG8KPgluj6MJIA+J24Wps9NrwNPZ6IHAaNnGvDX11Y+IZcbduyAYV1mdD/tgD48osdYb4KH4imSAyVDtUAtE041Q5t48qNEuKdog8U4owJ3JoffPmsVED19aTvt62YaYSR7EFkNTrc6Wu66MaQwKbAkwpOqygfRhlg0WcdtykH83EhDOnJlf2+I/iJ5sAJwbUqE3PrJ8UOj9RZsQXye0k5ILRtbGkUhQTeXq8VHRjGc3MhTxRcYuJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(85182001)(86362001)(316002)(66556008)(66946007)(66476007)(4326008)(6916009)(6486002)(478600001)(33716001)(8936002)(8676002)(5660300002)(6666004)(2906002)(38100700002)(82960400001)(41300700001)(6512007)(26005)(186003)(9686003)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1BLbUU2Ti9KNHVodGoyQmg5VzlrYWtwU0JvRjNyd3BzTmc5dytVc3FMaUVJ?=
 =?utf-8?B?KzZJWUtQMml0WDZVY0hwMjF3YlhGc2t3NmwzcmtjWG1HREwxUEUycFJ2andI?=
 =?utf-8?B?VzZZT1ZrSlo5bXpxKzVWZEZPakE0NGVxNlZwNC9qWWtMSHZNVUR2ZjFRanNL?=
 =?utf-8?B?UWlRdGpFWEdKWkpycHp4VUFpN2ZNdTdkdWIzai82TEsydk9JeDE0V2sxMDZh?=
 =?utf-8?B?ZzVHdTJhdmx5WDNSYnc2blhqOGF5WUF0QTJGNXRsZWxtZFJZZGZzN29DdUpt?=
 =?utf-8?B?d3BqaFF1YnRYVzhLSDlkYlZTTlMvUWxSVEpHZ2M3SkN6OXI4aUFlQ0tDVDV0?=
 =?utf-8?B?bW1VQklJNHQxUXNmSU0va0dyZWJua2NDTGFFcU95d3NYOVBCQ2p1UC9iTTVZ?=
 =?utf-8?B?MlNvVFRWUkpDaUZqanQ3U1ViSmYzakpXbWtNczhPeGhhNkt5R2F3aGlqVjFI?=
 =?utf-8?B?RkMvdVRycUEra2oxeXJaOWpUcjdpMDVuVVpLWTJKMnpLRFlmTE5KOE1VR2lL?=
 =?utf-8?B?TnRQK1ozWG9Jdlk0aFgzczFBL005aFMzZWVWNm9xNmdFNHc0Z211SU5mNXFh?=
 =?utf-8?B?QkhOcHpFMjA4dUxSa2pkYXE3QTlkbTc3b3IxR0k3eWxDMXkxb3hOU0k0Zmhk?=
 =?utf-8?B?TGFlMWdSd1dWKzBHVGZQQ2Rua0tFaldBQnlVNUZFS3RRQ1VBWE1tM2pKaVh6?=
 =?utf-8?B?SVRFVzBvYXFBcGtxMy94bXI0QUJpZ3BOdUdZRldTWGRmMHpvWlBublQ4ZU1W?=
 =?utf-8?B?MzlybG1oUlNqUDY0WDltRDIybVJaK3hWTWR3b24vVk9sc2xrVzRxNXZqd0dp?=
 =?utf-8?B?QUZMT2g0b1FCSlZwR3BodGJsck9oUmt6ZVV2SG1FOHYvVXltcWc4TUtoSURz?=
 =?utf-8?B?TE52M0t5TnlNQUliZFhtczRrQi9ieFhnazZQTHZDL0lvNWt5UGxraVZqaFN0?=
 =?utf-8?B?VmNVb0NPcjA2eFFRaG9HMTN0bDhzMThVakVwM0p3TmpFMDdqam9Dd2c1TW5a?=
 =?utf-8?B?b2N5Y0ROU1dhVERvSlB6MG5ZUElBSjVrQ2JqKzRwSnIzWHdTNWEzZXRPdEJ6?=
 =?utf-8?B?OFdvYUtBYzdPb1FrSENDd2wwQjN1RWI5TElDNmxad3J1R0tIQ1hYSnJJMElz?=
 =?utf-8?B?Z09MclQvUkdKV0xHc0drYWtoUFU4VG5uNXlmZHlRWTQvSWRPNCtKamdPRmVN?=
 =?utf-8?B?YWNYTDJwWmlRZ3FreGRWNHZreFMrWS9nRmJCM0VlOE1mM21TTVdvWlgrUWov?=
 =?utf-8?B?SjYzVHhvU0dDUlNac2xZN2I0M2RjVmNRVERnejZaNDFNVEk1aDQ2ZGEzZzJW?=
 =?utf-8?B?amNWYmJuQUl3Vm95QmtGdlNtMWJlL1dRSWZ6VEh2NnNEQkkvbE44YVFiMTVW?=
 =?utf-8?B?SlFjNXplM1MwUWhMZFRIWWFMZXM2UjliUDVjQ1hpVGVoZmhRL0svOUVKM2dH?=
 =?utf-8?B?cnE1ZjVwcTBmejhBaU00bU9UMmJnRlBvamlYTFRsZWIyRXFuRGNjTXVKb2VE?=
 =?utf-8?B?TWI2Zk5Gb3JsRnFRc0ZGOXV6K2lkaWFPWm1tVWZxNXdnRHlBUlFUZzZodEhC?=
 =?utf-8?B?NmNNSndPejZWRkJKTlZIbWhhdkw0U3ZCSGtWQVBERWNZeDJ5OGRmaW5GYXgx?=
 =?utf-8?B?cjlZdGRkNXh4bWpNUHhKWUpYaUxXQ296d2ZlazdDWTg3aXE0RWlvUjAvb2xt?=
 =?utf-8?B?QzdBWjEzUDFMTEtUajUvWnpFRDRPNTJ2U0FWMTVyU1NKM2tkcUFGbkF0eldl?=
 =?utf-8?B?T05vaCtDSGlUTFgycmhLQndPdlhnVGZ6dVZER0x2b09Eb2RzRXBWNHdSN3pH?=
 =?utf-8?B?anBjZ2gydm50SkdYOWhjbnJCcUlpd3ByR3o2cTEwUWZxWXhsUzF4T0Y4WkNv?=
 =?utf-8?B?OGZpSFBSNUl5WkJoeUhobWxNVGRyRDhWblRuaHBjQVdrZDlZTXFGNkpCZkR4?=
 =?utf-8?B?aVNITGV4bEgrUXRpb2cxMXcybUxJejFRQWtObmpRYXFiTWEvTjYzbXN1MVlN?=
 =?utf-8?B?V0NDalBzbm1yMTl2TmpGQmJQWUpTWmlXeUY2VTFYL0pxcUJ1ejlERnQ3ZEZU?=
 =?utf-8?B?VDNCSlAvallNYWd3MzZqaXkvbmFSenJpTTlrSXZodjdydmdOK0pEZXo5c1dx?=
 =?utf-8?Q?iEF4Z2GGaYJwNXMt2ZLWeQEDk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NFWkODnSaC0Eg+J1IWyWDaEM7f+dYdJv4cr+7bcXCgrAzUA+T8g+QTPE9OXimKzqGNpsvulfLWGnfz3uT1Nr4SJfELIO3bj/NaEj44SC3O5X9d156yHw0N03CsBSxoQvqaaVFe3fbNDAQFP8y3c5V+PmTUK3GSiPd4w7Jhi4pnAbfry6h1E+LXM53gZb657foTG3oFJZzO5oGEerbEeNjM7bumfP52N/KLWCxJl5ZG2zAt5I1RekSTPEghW1wFxWg1MDuxX8iNibpBiRvX757+oKTphPOmu+vIhnmO0JxkoRTUcDxiEQWn4pN29uNv63pxyU6Q/t0CQppCAi4hKWgA5NMDQtI5cm7UikIdNky1tVZXIanVMTTmeOnB1FtTWcD7cA4ST7KSeUiVTFwRUIjmitCU6s1cdoSYHVGaaETyY6p3sPEvzOBByhrqynsY/DINtGvZSNWMK1cRsm/UTM3Tudd0ls3CIqjrluGveoA1mP8wgJZfoIvJf+JIsuautcInIqN1xACPmPQkRJZK6vRo9xwbL5lWKdeLK9j7CTa8gvJpd+9JPWQJARwYatg/zJQ0kp2HPxIySND4j5By+a5bGKGsPpSV5DPxlJDDcMvFZQEtkOpArnqsZ9eEMifNGKAzNX013+yn3Yhfvn5A33Bnk02Wlh2j8Z35t1A3KX3yGl3pAqykjqVSgnQ0fUgmyNWCVuLUowrhY2H+ZtDgfGLvcuynqhg3UYBQt+j/pv/sx8w4qbQ6gjZ51RlNyRtM4TLBaJG9rWdtR7S12MBOhHTyjfOaxCDosU2Cda1mQw2w1YdzZ1UiZv4YWfXWKmId1j/MP3wwygjUjN8pcg0fr/qh5eIU/xp4MPjSpUnsd5kW0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563691e6-87db-45d5-e56f-08db552139a3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 08:48:59.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJuJwv2YYE8ZB9WT6CBMPlYxpxsvxfXVBWS1I7W8mLtGQ8hGaGuSv78RSkpJPx5fvkLHlBya8hQkWwxrzJWHHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5943

On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Xen always generates a XSDT table even if the firmware provided a RSDT
> table. Instead of copying the XSDT header from the firmware table (that
> might be missing), generate the XSDT header from a preset.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
>  1 file changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 307edc6a8c..5fde769863 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>                                        paddr_t *addr)
>  {
>      struct acpi_table_xsdt *xsdt;
> -    struct acpi_table_header *table;
> -    struct acpi_table_rsdp *rsdp;
>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
>      unsigned long size = sizeof(*xsdt);
>      unsigned int i, j, num_tables = 0;
> -    paddr_t xsdt_paddr;
>      int rc;
> +    struct acpi_table_header header = {
> +        .signature    = "XSDT",
> +        .length       = sizeof(struct acpi_table_header),
> +        .revision     = 0x1,
> +        .oem_id       = "Xen",
> +        .oem_table_id = "HVM",

I think this is wrong, as according to the spec the OEM Table ID must
match the OEM Table ID in the FADT.

We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
possibly also the other OEM related fields.

Alternatively we might want to copy and use the RSDT on systems that
lack an XSDT, or even just copy the header from the RSDT into Xen's
crafted XSDT, since the format of the RSDP and the XSDT headers are
exactly the same (the difference is in the size of the description
headers that come after).

> +        .oem_revision = 0,
> +    };

This wants to be initdata static const if we go down this route.

Thanks, Roger.

