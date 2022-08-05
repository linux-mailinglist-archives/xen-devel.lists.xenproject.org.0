Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694458ACB8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 16:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381337.615972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJyld-0002wd-36; Fri, 05 Aug 2022 14:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381337.615972; Fri, 05 Aug 2022 14:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJyld-0002u6-04; Fri, 05 Aug 2022 14:57:37 +0000
Received: by outflank-mailman (input) for mailman id 381337;
 Fri, 05 Aug 2022 14:57:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIDu=YJ=citrix.com=prvs=2098568dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oJyla-0002ty-Ib
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 14:57:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed0c0205-14ce-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 16:57:31 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Aug 2022 10:57:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO6PR03MB6209.namprd03.prod.outlook.com (2603:10b6:5:355::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 5 Aug
 2022 14:57:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 14:57:25 +0000
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
X-Inumbo-ID: ed0c0205-14ce-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659711451;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OrkBGEzgD+hPyFzyKdNKRLo0vS5YS2565uyHyG8RF4E=;
  b=YEISwzfK0vw3tfB9QDpRwiJyRkORBdxOtJcQCJRU9GqHdEcZvHMwFCsf
   VATtMC3X6GJ/QAeaXvy10n3kbJ/oqyWaVk9jlyuJFBOSXLRUwP6Df4VyL
   elYVFi5oCBOys6WhUq7eh0MxFKQU7vlzi5dC/OidrmV8D3+etkFgP+8qY
   k=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 77465736
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Ak38Tz6rPcjI6pHceMMeonu416+heBgzWbkX39?=
 =?us-ascii?q?0b9NTMEsmFhBb0lAxN0WSfWymEg+FsMj219OT4V8D5p1RRBJuSajspdBUZ6q?=
 =?us-ascii?q?Fb6aBgWNsfOFmrT+qUpoREHwkRf0CGtdPFz0hoArbXZWufD9vy3odezvF55R?=
 =?us-ascii?q?ghdRPYKYYfrMZhPcH7oIw0tkWSdd9931nQd8JAbVeBm6NMyv5FDqJ6WbAOZx?=
 =?us-ascii?q?BN/teQzWIrT83QyDOIy41WFFoYZ0Yvjd9fty687rfPI1C3KamcIrldQIfI4/?=
 =?us-ascii?q?N6VAtcqnGk8fj2eREyr0WlUjvbDsojwW7Len1PhrF6CKX9g6m40doWq5ctlO?=
 =?us-ascii?q?JyxSi9ScbnmifnrycAGUa9TIe1eA9Se12Nk4L60kV2OPMF4Emm4+QX8ueVlu?=
 =?us-ascii?q?5zjjkvS3xVXB8NXgf8eDXQy3i47u975hM0/AuC/uRdhX3hJ93tJciHfEP/aT?=
 =?us-ascii?q?18UKjaksXvGtLV6ImsMueIEwLtKr6ffw/a2Bge2q4ljx9rey2gAnt62Q6WqS?=
 =?us-ascii?q?OrpaH9onZYzgHilb2tRe8OLWqY4fTmSsmZgrew50YaFx9dhCTUDOh7EZGQnl?=
 =?us-ascii?q?zR2/DTGzCCGupvWvS2Xp6lhAKcwIfqI7AhDbrhIx392b+SM1yvEquA0qr8a+?=
 =?us-ascii?q?xXoiacP1H5AAdrVpSlNjEFsrBmHWVxBkwD7PhCm5je4eVq8DK7b5f/ld4hpq?=
 =?us-ascii?q?8zQTijW0oDBp8dPXwCiywExJsZ5lP32aTwDHE68RKkgpxSz5j9YONY0pBSZX?=
 =?us-ascii?q?EuajYqHQRrCsGIPl8nn73VSq7k+nob9u3SDcPykPS0LeMXbXvjTRDkzF1WX8?=
 =?us-ascii?q?G4Or9UWZOJz5zStphyrn+1LVqovR8m0aC8Hi9qtQ0D44BAxfCeB119+mEL4R?=
 =?us-ascii?q?EE6Bv0VADW0WTieWKVC8O5i+mCNAYnfljPuNYrlv01JPrVWDmmshZwdu3jHx?=
 =?us-ascii?q?WUwnn+1kGoRe9kQn2tYbiKQYLTe1zbBvI57XWZOrLUnd2eVMjR/35Ocd6t1G?=
 =?us-ascii?q?yLitgkkfRej9VDoJ4hkeLuVDHDFlTOlVg9yMA0Ht90DeXHjHJhguh2IQpmD0?=
 =?us-ascii?q?wZjX9Qi+GY43VLhQyMDLi7yLzf0ECKYc2973h9VHk3IYNf7zZVyuwIXp+zr7?=
 =?us-ascii?q?dU4YW/kS4BgJkRosHgBIQAOUMI7JWfKgNsadLXzMg2jwdOVdrNAlBqtIgkuO?=
 =?us-ascii?q?t6w3SeMZOYeZ7Xjrcyz6S9CtK14bF9Bn6cKLAYfhv/O7b2uuZF7fiBQE8eh4?=
 =?us-ascii?q?5qOGGNThahqyvRHx/PVi+y4qqWESkKWEyZkazpFJKxJxkUCqU0JTjLYeYfW6?=
 =?us-ascii?q?MMQX9CabxTiyOXqkPjo7xdlTfR0d7kaKP694Iijwg9qQIOhcsuKex5a8WRxE?=
 =?us-ascii?q?juCkDNC3rtaZ6TRPPJ/eNyYK7DvdX1XmCbyBMBOzYA2cdZUnGDi8lFfZ9A1g?=
 =?us-ascii?q?+bUdz1ef0WVD5KX3yTYnAIpClPwP+Lk1LxyvwPxqvPs9pl/Hd4ufLTxIcVFb?=
 =?us-ascii?q?ZMRotHlySNjZTvDso/RpG50gVKi7y67gd7Z6+++8IlVMEA3f7z8dRN28qDHN?=
 =?us-ascii?q?ir+iy3rxs0xpgcEO6zUgHty9bL8g2c7VfoHiJodlpnZIDIwwX7cFKwzhMALO?=
 =?us-ascii?q?DKOtnuIcz/EIVUYuDdX2quiuQWlZZJVVtpGrKy8iljCgDrxX5ELDL2W/50hS?=
 =?us-ascii?q?+DET0PBxuI3c0/Qx4hdqO2u10gYEnPs0k8TIbXA9lJcGTdaNXKKg2vLMN+GJ?=
 =?us-ascii?q?D1VOi8elSx2y8EjWlzUFZiWYlN0TEfWfDug3bYb8sB24MeoEfEC05u+Dc7El?=
 =?us-ascii?q?crRnyG1nxSzb0uPQVimzjnpPhhB/lSQuhwvaaQ2f6WQotyTzqeq0BGygcm6H?=
 =?us-ascii?q?Pi7rBo3U6agey7cE3vmI6z20Tpzzp3eVH26pBGOvGK+/F8/g4ytU8xoYhij6?=
 =?us-ascii?q?VatricY92wWMJ1U1DkIGHLcB6vO5cvyfVCSDQSagD25B79pUAl5u6ykHhVfd?=
 =?us-ascii?q?ckWt2Js/Rf1hFULRQyrYyTH9nBCUzW/EdT+Vl9/4CTGgKVLs+aIA6zWNOlMP?=
 =?us-ascii?q?+vdv7uqfgOAKcmwbQkCdTe9UzdcPAbqxNiBraoWSZeh/bExB2etPZzuTLax/?=
 =?us-ascii?q?mtH0TOULCQZIpYU27JPv5LgZXJ/Jv8S95Zwwk9qBwu8qoQldEDz1NFBL+um5?=
 =?us-ascii?q?QbEJ29QABX4zpFmemao9uRYgpxUkOPUf9u9ym1sLQ/BGrwBK8BFvrTkmbqmc?=
 =?us-ascii?q?MV4OA9n4KkFP5T58UfCtrbKah+emhjOEBBslLcbLDHUFChojcTADsyhlKGIq?=
 =?us-ascii?q?Hx4IYe9sIQ7W1g02piE6NcOTA5hqYBlI+8Jzc18M9sfO5iUz6vnAuPM9ltcJ?=
 =?us-ascii?q?N3NVWniJoVBAMPLgG2LlGXtPExdHMuPnZeNNaKdIO8xa0F0/lQO5+w7EqDyH?=
 =?us-ascii?q?eekEXZBop2cfvOHjzOWiGDT4bK+/pDIB+3dyiJgwNe44Hg3XF3+UppBLAl2z?=
 =?us-ascii?q?ARA48IRJZa3JhuO49lSREPqU0CjfswIgSi8IWTtv5uJbpB3DnWxmbQumwsKP?=
 =?us-ascii?q?Uk/uY7uwIcHy5gd3wEyDr51+3nzbJpv+o+HObYNgW9p7GYnwMEyZd1i?=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77465736"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwTslft/a56G8BujM/8MBxSYQyn3Uw1Tld0YqTB1OES8lwQMWpIg6Ddwzyv2nBSZmWPZc8LrsYh+8M32qPoHqs+dd2pYnjl926F1lzA+y8cS572h4YcTsOfO05S8AhQXqB0N9h1yIM5xJPnBIP6edQzKLdPBpQ/BMEexNj0bjzgkdgP9UOxsEGHYMpuIpT2cPiV1OKtoObF1oX/qk6jQ0RmAqBtAwW5BASZzvviI5Dy82nae3+yFBX4ls9p8XcprviQpyM59i3A+SkA+vfsBCaYmc1V+24qo6yDImfebCxdPv35lwbvrW/Pq14WgsqEbvlGh1NFR4R5zdVc2p9AGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrkBGEzgD+hPyFzyKdNKRLo0vS5YS2565uyHyG8RF4E=;
 b=XS/m5DFKGRARidSY7bs/64YrzYXSvwUT+fzNMi55jBBoiL9VJoUGsDvPafv8xTjLzYXoHxCN3JbsR8ES6caRDYnCburzF1yk0mL9LugY5UaZqjZUgph27GImhg+tECf9m6wOFFm5drwwBExiYS+uwzgKbNpbfx5wHd3hK3+Sfu4XT1B5AFPKafAY4JLctoKApNXpwjep6K+kFKp3gSc2mGxMtmrFxqK0rzOk6NDKND3dDQDy8O8kc78XJQORt5p+ZGhb+/Td6mDjpe5UWMH0mLAWlPj7E2g/gyADnnyz3gEXiFQpgkDvRqrWASsMhfhsG9XFSk4srqMBF7SgirUYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrkBGEzgD+hPyFzyKdNKRLo0vS5YS2565uyHyG8RF4E=;
 b=H3GRB7588UI2kighzFkRhWXZMJe1ndj9Exq/l9YOWo0/wk7msG/z9NZd+zST1ne82P1sCJU/Tp3fq+wyOoPIVib10+Deqbns59+2PkHjb2G7/TU27FKXLOQoMd7/BBV1B3SYRy8bqe2UK83+oZE7+vqipmYMwX/uzlEFky2bbKY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2] docs: correct x86 MCE command line option info
Thread-Topic: [PATCH v2] docs: correct x86 MCE command line option info
Thread-Index: AQHYqNSUm6aLYYN4ckK8TkzDnGlc9q2gZa+A
Date: Fri, 5 Aug 2022 14:57:25 +0000
Message-ID: <20fe587b-5181-12fd-d67c-9a38dfe0c21a@citrix.com>
References: <64ef8170-fd70-cd07-f861-a79639203f7a@suse.com>
In-Reply-To: <64ef8170-fd70-cd07-f861-a79639203f7a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a2bfb9d-41d8-4cc7-6b15-08da76f2cf2e
x-ms-traffictypediagnostic: CO6PR03MB6209:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 16d6N04pyqrlI93qRZHQ6Rt0yWdTezt0/yybR9tfYGFAM+ZKCN9X6O9TLmxo8Gfuj7nh2r+Onex//X9APWuWGhIW9JLMS/y17I2J6Pw+3enSxHcs8oCSCh0gb0fqfZENcmmU02BUlUJhcnIiGvruPZ+imSBvNPmVBer1IVChUBOyg/MwrlnXouDkjLZtrHbbfEpiGFjX1QwZWZfvqgWAwcSe3Dk+9JV5epbmTrr1rHoOpXk7IYSNrV/sXAgP12vI7oCN6rYOxlZ9haGO1zBddpOP5ezHX7BfI3tCybt8NUmIfZPGYbWa9PjpJQjRxmKxAx7mfJ6XfhRIaZQG/DV3ytzL6fo/rhXCHa7Y6eoPDdIjoVp/5ap9X+qcuVEJAnTmnihRP95xToqR7MegynDz0S4oTZ0P8hau7wjl46X5pA71eP0DD8nNoNhHxXHZaiKc508p1ZBQS7LwARMB2r2THzVGn9fHGhFeYzTrGEMyo/ziLebAZBh+V4OaiUYiV9c0Z/Hs9hygvMLqc4JS/gTFF0CWDURvgBXchLTEs05QAfZBK7lhFye6w9Ir+pq2mf3flCGoOyX295wM5PiorWLGmwcYnFjaMXlIT8yunocVbzJztvjyjHWqlK3ie0zAzYBdVtPxMzTM6LC/JiBjYuKQ+mxFm0OW+NndHqMJAV0xAEDaV/W4k7OLy232qo2qe+VupItwxL2/R0MN+ZsZbAQ2RP9VtKpFhh2g0KkjA9Ml8gElWV9MqKbm2YpoNlrA0iHl9Z6En9op6jjQbJDsvzieB3qEzUm2xF77juVh6QzK6d5Mz7+6etzgqdDSTTQS19L3KIT3p3pnTGDcTPsPXy0nbokxPpUv549Jn1plRktYuyiQoZMwlbscmpUQMZLfjLSf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(66946007)(91956017)(478600001)(6486002)(36756003)(31686004)(76116006)(5660300002)(66446008)(316002)(66556008)(4326008)(8676002)(71200400001)(8936002)(66476007)(64756008)(110136005)(54906003)(38070700005)(6512007)(41300700001)(26005)(107886003)(6506007)(31696002)(53546011)(86362001)(122000001)(2616005)(2906002)(82960400001)(186003)(558084003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUxzYmI3Mkc3RGJyQmpYZzJhYUxjb0VLblFXL2RGUG1ybkF3WHMyL3VyNnFw?=
 =?utf-8?B?YUI1NHROTXlLQU1PRnlyMlJ4SGJmNTFRTksxRlJETWlJeTJERUg3d3c1blM5?=
 =?utf-8?B?T0dOM2daZjdpb01uWnpZb1ZtWVVCZkI4bFIzazJiYUMvMDJvZjRaYnhHeWx6?=
 =?utf-8?B?Z0NjR0RFSWdmaDl1VDBOWHNoRW93bnBRQUtoRytIaUk2UzZ0SzFMeitKZk5S?=
 =?utf-8?B?TjIzZWpwMlZmdnJ0NXE4UWY4LzdSTkJrM3B1WitVK0dMTE45d0ZBei9DUmhN?=
 =?utf-8?B?Ri9qTXI0b1BIMWkyODRIMVlweG1ESWRGTTBIeDJiUzA3b1VncE0xT1pQSVN4?=
 =?utf-8?B?YkppSWJCSjdCcjd5ZXlIL2hyQ3FYYTh4TEhxVms3TDhENWhhOTlzL2JZQ3Vj?=
 =?utf-8?B?NmJnVzFLUUk1cXRKQTFiVHlQSFFaM1R2TCtNTVhxSE83MmNLbHBMTnVQd21M?=
 =?utf-8?B?ZlRoUzRrc2pPUW0yaFdzSmRydmVWVEZmUFF5bXZBcnNGV3ljc0hHNG55bzc0?=
 =?utf-8?B?VWh4OTlCdS9IMzRGenoxak9ENHN6L2REaGVtMjJhNlI2MXBiRGV3c21BV3hh?=
 =?utf-8?B?bGh6WHRTQm9LV1pkWVdyQUNGakdtc1RwNlQvb1hJS25iNkoxTlA3eG9jQUVs?=
 =?utf-8?B?RjZVb290b3RnT0RXSEx4Ulc2YldPb0RscG94SnRCbFhtM2FBU2ZUeXMyWFVQ?=
 =?utf-8?B?cEdYNXFPUVpIN2tZc0NwM0d0WnpPcU5ZT2lHNVh0YkErbVJNbHVpL1lZd0Jj?=
 =?utf-8?B?bHJZZVhrbk5HMzk4Mm5lZnBrWisxTk5YS3hmYkJZZmovZ2NucGI2OVVaZDVJ?=
 =?utf-8?B?cHNHdTNIamY5NU9PUVgvUzVsYlRtWHZGUkNtMytva3hnME9YZTloYmd1KzJw?=
 =?utf-8?B?bTRvRm4yL3FEMzBBdGF3MWxlVFcrS0xjVkVNTG9FTUxMYkc5VTdJTE1wd2xl?=
 =?utf-8?B?bmlBNk1XaGROcUxpY2ZFOGJOTTNzZmNhTTFmdTd1VmVvSVVjZGI0b25tRU1w?=
 =?utf-8?B?UjZ6RUtPME5qVUhOdjBTQ3hZYTVaM2kvcTNrZDFNUG1CejdmQmNPY2Zobndm?=
 =?utf-8?B?ZFBnTVFKdmJoa2FUcnArd0Z6bVJ5bzV2bmxkRlA1ZDdHK05OVU5tQzZmWFpT?=
 =?utf-8?B?SUt0RGdxcVc4Umt2RDQ0MVpxRDVJSFU5dWFiYjdiMm51cUlHTjBKc2FtbXZp?=
 =?utf-8?B?NEhFUERISTdPaGNvMWxpQUhMejR6TStwd2lHQTJWZ2VuczVtNi9QeEFxV1FT?=
 =?utf-8?B?dllCdWc3eVRVVS9PbDNubDl4NE1MWWtYVkw3R3FmcWE0aGw5clllQUJDR0Q5?=
 =?utf-8?B?eUNobFQyVm16M29Ud3pKMU9qUFZKRWtILytETkIzWWExOEZJWmhBL0xZQmgw?=
 =?utf-8?B?Q0pXNDRPeU92RVhzU0ZaUHNPUUt4WE4xSUczWUFxUEF5dDFyeU1QQklkZWkz?=
 =?utf-8?B?YTk5R2ExUDYzdjBseEVXMkUzNGtiay84Q1BCdWdHTGl2U2poMjY2TzdybCtk?=
 =?utf-8?B?QVJZa21LVGxiMUNhUmJOYks1L00zZUc4dm9LaW1GZ1AzWUtmMXBxbWkzUTdU?=
 =?utf-8?B?OGRwckdzOVZKdjRzbzBLWFRTS3JDdmFRWm1ZRlFhczVwNXNsVzAwU3VqRGZK?=
 =?utf-8?B?ejJzdVJ0cEI0bEl3V0taU3Y4dTJKekt2N0txZGp6WlZycWZKc2Q4bDE2ZU9u?=
 =?utf-8?B?SXA4dDBoRThQQ0VFdTJYeDdWbWVWSUJ2OFlOanlZQldmclJNV0dSVG1OVzZO?=
 =?utf-8?B?UEhFZktrajlzM3RPUUgrWFRtSWYwRHA2dWVNQVhWNExmYkU4WWZnVHJGalBM?=
 =?utf-8?B?K1VOUFh3MEN2ZnAyZUtnQkVCVVhQdWdMUDlwa0tNbDZLY0VoZENIRUtGRHBw?=
 =?utf-8?B?UjVnMC9TR0NmV0tScytLc2syb2ZMd3dQU2o2eUtUakhnWVRYVWEvNVBSVDV2?=
 =?utf-8?B?YVQvdkJIMDg2cGd6RmFUUm5qaVpRbThhOStCc1BLKzFEQ0p6Z0hLYy9WQ2Q0?=
 =?utf-8?B?dEhTVUVyL2FyV1hYenFlSWh2QXpyQVdxemxpdUZ0NmdlMDVDT2RHcjNscCth?=
 =?utf-8?B?OFM3aHZHVlBkTFg0Zk0wQTFrK3preW1XRHJxVUpWU2duMXNpakJMQTFJUjFw?=
 =?utf-8?Q?lA1SdYTCCX/1pkUr5/8L+UHHy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <585DA6C7D1F88F49A54DECF691EB77AB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2bfb9d-41d8-4cc7-6b15-08da76f2cf2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 14:57:25.5966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svBaC97sW1Qyelk7uXoyWLE0KNtvlnFLoHmAKt0GdmIiixPwynNwR4kwSBJg3Znvl9lyh+PAx9M///WIxAkK7tnlUZt0V+uiVmHcexaG+z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6209

T24gMDUvMDgvMjAyMiAxNTowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE5vdCBldmVuIHRoZSB0
eXBlcyB3ZXJlIGNvcnJlY3QsIGxldCBhbG9uZSBkZWZhdWx0cyBiZWluZyBzcGVsbGVkIG91dCBv
cg0KPiB0aGUgcHVycG9zZSBvZiB0aGUgb3B0aW9ucyBhY3R1YWxseSBtZW50aW9uZWQgaW4gYW55
IHdheS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Cg0K

