Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D659062B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 20:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385097.620617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMCaE-0005X3-6u; Thu, 11 Aug 2022 18:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385097.620617; Thu, 11 Aug 2022 18:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMCaE-0005UM-37; Thu, 11 Aug 2022 18:07:02 +0000
Received: by outflank-mailman (input) for mailman id 385097;
 Thu, 11 Aug 2022 18:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMCaC-0005UG-4Z
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 18:07:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62483a72-19a0-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 20:06:57 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 14:06:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6939.namprd03.prod.outlook.com (2603:10b6:510:16d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 18:06:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 18:06:51 +0000
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
X-Inumbo-ID: 62483a72-19a0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660241217;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2zxxZQJOHzIKkHOsVuL+rDKlRwyacsJezRH1V/jpBgg=;
  b=JJQxYvL+A7Cr+8DmYXr8AUdz3ukkvqS4/r6GPm9Ww/72ct2l0yhupYbl
   RfZ9ThFRbRTj8E6iAKza/JcaQOcvuEsG5sl/eQrQcUdKTDreOzwGgCMxH
   uT9d/xu1qw/BQ7nlyrGnc7/imJWFu+1hJBPI2xsdY/KRpxVUw2rQj5vrj
   A=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 77904389
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AktaTza0GhBeJE3T/y/bDix16xUOB0HFdZcB5A?=
 =?us-ascii?q?8V8DSJ0RI/PxWDyaNIpsxBweKiAvNtW2ov4UKlPnc5/wAtukbns/0DgINnrR?=
 =?us-ascii?q?QUueWrPnGjIEwXSaCGQZ6wiXP1+1vUjdBz5Mzn07BgJWwhUjotcs4JdKbJzr?=
 =?us-ascii?q?h169JHkHcLZ2gHfSbGonAo64v9PIJaCHD8VPMp6goRI/sqEfjh3HsxvjAAi5?=
 =?us-ascii?q?WdV6Da7HbACDnI6eBrAkqqIDqHZKsT8HhvjSZ0gY2HrlZBZC+UIg9hmaYYC1?=
 =?us-ascii?q?trRZ7VuG0UChzzqEIy7Bxm0/wmTt8x7V/JsiV+moitgV646pN7Wu4ZbzOcNd?=
 =?us-ascii?q?ON0bm5taIj8deSS+6mWpX6pE9i5+JRAIJSbyAxFG83Vlgabu9+Ko/6edeuf8?=
 =?us-ascii?q?gdDH1hps5BKrYL8B088VBKJs9djkD81Ag9OHKkZ7Kb26hT+D8Cm62lpcS8kT?=
 =?us-ascii?q?Y4eolROnfu42swaOGW4xHUTK9rQHnC+TQfq/0ZDvyByjVZt2AaLsiwqYjL0u?=
 =?us-ascii?q?bVJaATdQA57gzCnGmnbxf5yBbcaYoRMbSTeMbca6kZBBWEcdSQG8RI0U+Te0?=
 =?us-ascii?q?py+bXaYELcfUcHTQxtP+V73pJaVlPzkVmeVTbxNFNxNZlFJ+H1xNE7sy70tc?=
 =?us-ascii?q?OtAWZ+Mjm+Y8ZI6J16INFS5kdHm26k5bSru/IXjNRIYAv2J4MYZGkqtarUlZ?=
 =?us-ascii?q?S0WR4cbrMYGdclW4rBXc9gSKUqRvnYzdaprGv8LOD4QWJ/UUFoJNzDmmCXLm?=
 =?us-ascii?q?cAOl5QWqiI/w0mIOlXdx7FyxUnSw+fXJfLAr4LwJhyRYDYxCcmn3OPur9c4g?=
 =?us-ascii?q?Nz3CPjuDaE3AR7HVuYaWekwvn3qnL23H9aG1FkUCEtq+rqkHKJAXMX+24uXn?=
 =?us-ascii?q?KqSneHv5Hqs2AqOrotNyyynDXnf+vRabNGQy/AuN5o0RiCF4V6mzBZnrj7Ip?=
 =?us-ascii?q?J2ItsAT3Lq8Nec6lA9pruJ6qO8VjNpgyhjBrtOnuKvhtdy014O7MzCt9vEdn?=
 =?us-ascii?q?uTu/ivIQ4VX2HPNVkhcSZPBSbLCZM5rasuwlk34wIxrnIq2T/xau/Disvqjg?=
 =?us-ascii?q?TMTUxhrsifXOcCC45ItorKHvRTKnwY9o9fMigMMkt2pt6qO045Wya/FdQkJ7?=
 =?us-ascii?q?E6yo3NmNS7IZ17EufpGU+wXr4SwPoA+iqlQOuwTzj3zOAXeq+a3mSg1m1eRs?=
 =?us-ascii?q?l+O6v0loRKXcMiU31X9CBlPGbiFmCfhoTMvr9mBZ3VTxtnANh3PlAS7nT3/b?=
 =?us-ascii?q?5KByUCCFAYrjo40kaKiRIp840/ajQD1+27OEsRIOwLqkEFN57h1KLI/msQhL?=
 =?us-ascii?q?1viaQAlrKpDSUHN4SdeLaAchgIdW+d9JX38JsjcUL7rePMnXoQyCFRNfYa3p?=
 =?us-ascii?q?gLYCDXd9FGaHY2lAjEuusTH9e1447mM4AaR9aKRYe26N8aXLUeJdzyp/EX82?=
 =?us-ascii?q?8dk+30Km5ebmO774tkP6A5pTjogNEUm8zGM2ZxdLpuyzMDMqMrQkO7oeQggU?=
 =?us-ascii?q?kQ9ovjEYi0d+Zt7MbXqZogQjmCdV9TOxJKdertuAUjA3TZ1npItcuctqdn50?=
 =?us-ascii?q?Plm3t4dVlz8nJIgBKvldD53zs04N02Wn7bRdfgJ3je+P7xjdeMC/1pwCdyfk?=
 =?us-ascii?q?r63LI3aRwswwYz/mmIE5qWbQwZglhPk2yBa/aKxXWb/s2MvkcjM4BDnt5pgq?=
 =?us-ascii?q?fOnTnC3kX2ZhmfQRs/6pqm+9IwCG3urr5/6grbWRHNAJYanWP2z/ThvZ89Ai?=
 =?us-ascii?q?z9McK2+Kt7Ezwz6AMS2yGHnaPdDVnDkAKR8XQ6TaQtgVfIgU3DZqQnvSLEMN?=
 =?us-ascii?q?m8QArIYuwJ4vya3PzZvWt7jyimllGAUrnE3EDqUAKkiFf/Xig9fhvmaJRJxU?=
 =?us-ascii?q?ax9nbRQxgoGJuFalmz0hV2gf8eMShEnC5KZQt6AYXxHfUQNgiv9KianwziEv?=
 =?us-ascii?q?6kKTKYtQVe5rVYgzVaMPmmrpSw0QA2yjsVol4ODx6O5QTeWles5h8vgf7fef?=
 =?us-ascii?q?CWp8TmictI5MyveN0/740UooXd/6Njrr1m3IF/Su2diOHk5KblZKE/EOoIYw?=
 =?us-ascii?q?hqwKP0o4IAQb9lkkYV9428egJkemPYduM7pYQlTKvonNlbQx/mTTvJXv5/FP?=
 =?us-ascii?q?Mh7fneI4P3/iREcnwCfgohlS0OPa0t+yppc5D0HucEgU1sRM8PmXtLTeT2Tz?=
 =?us-ascii?q?zHr1cIWJRd3JNvIR5StBga/ARAX/aVwfYIv18mKX/uazvTONv1uiar/faWGY?=
 =?us-ascii?q?Hyhn6gfN3y+Ey0CDrwN7GG07ddvCQ8dSvuSdxW13yRIb4XQU9+9b42OVNBHP?=
 =?us-ascii?q?94PGiFeSTTReBGTo+XiYnxJH0nw6S4RrL1vgHJM91bJtkYAI1wTzVVjUOnem?=
 =?us-ascii?q?weu1l831JnAkke50/h9UoPZrv6Ofm7tvyrjm59BPGFVfMnxj6CxS5RJliHih?=
 =?us-ascii?q?QDE8W3ySXhtHyoPq5BLHmod8t8oCia2znzlC3C6wJItvbmJmqSicjuuBAM=3?=
 =?us-ascii?q?D?=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77904389"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFL2WIJuLo1m8Mj0EpxkZxI27lurLg9y+L5ak1Wrn+HvQFRsRCeNjiSM47XTkWXV9xKX5ATPG3ivi2TnOhEQlvlg/ZLrieadIk7lqB4pd9Uk6DrPSFoC8dAn5lH82WQ/Ikjr9PS7PlQqPr6UzoL5RaLuzI1Ku5qYSGUjlwGrbhRqMTLUt8egcVZBCb/DDAesKq2uQS70Q6E7POzkuw+bJ5Qb4S7q5ywOTUKRm3fT24XYvEM/DtB5kIEVZczGwBpBA3Tsz7g7YR+tsA9UysAgr/p3Ss6i8qcChkC7JCySefdF8uLW7XPZyWtjI8D74DqZp1Y6AOuDQ/f6CxnusWquvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zxxZQJOHzIKkHOsVuL+rDKlRwyacsJezRH1V/jpBgg=;
 b=Z7qsctWNPmB9LzgWb211tRUAWZJrOw6AuuZxYCAfVxnMzomE62c6xtbjkgumFtAqZz+gumZ+ptI9db5R4T4tt9tBXCKEQHggbGrVkG2v3k+zUb+EC4F6TfPsZlXa3C5l5+b+4rcpxz1b+vlnUZUKJCFF9e3IFQFbz3BipFLXHzSnt7tbsCOerwXzyOrdtI6KFBPo8ecjF9fO+4wOhJNzwROMF4lYYKaOWUIS11FAGSBnuPjoJCL8Yw5e449iJtjkh2nqEgdve3oh3EwUq5SlE9Bc04g3ZY/h+ox2pNWeLg/aCXOn11OPytYmD6UruuelQykxCzT+sj5e23T+aZkVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zxxZQJOHzIKkHOsVuL+rDKlRwyacsJezRH1V/jpBgg=;
 b=Mn+kLNYcoU6XKwE39WEubO1ma8jG3NQTwucixQSywTivMYFP6cIzkeWtIjyifYSYV4AA0x9lSDrRhqtjYmmoVs7FcIgd8TK5kkGKzh1UWOUnXWAjQVSb7OFvweOGfoO/Pc6P19t8PR+C7+nhdYnO6zKBuyIwx4mX5hchN0CRx2M=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/spec-ctrl: Reduce HVM RSB overhead where possible
Thread-Topic: [PATCH 2/2] x86/spec-ctrl: Reduce HVM RSB overhead where
 possible
Thread-Index: AQHYrBGVOnpsJ3EHKEGHOuDU3gegNK2nxnYAgAI7qAA=
Date: Thu, 11 Aug 2022 18:06:51 +0000
Message-ID: <ba78d9ff-e31e-210f-ebbb-9abb4a4e3fd3@citrix.com>
References: <20220809170016.25148-1-andrew.cooper3@citrix.com>
 <20220809170016.25148-3-andrew.cooper3@citrix.com>
 <b45778e0-9ad3-d32d-e226-7171cfb59394@suse.com>
In-Reply-To: <b45778e0-9ad3-d32d-e226-7171cfb59394@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15751337-d876-40ad-c60f-08da7bc4440b
x-ms-traffictypediagnostic: PH0PR03MB6939:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nw7h+i9XSZ2bd7YBkJ1OjkNa+HWj5sErs9Cf7aEOrLZSELtEdRYa0dvaUoteCk3Oh4GUY+cZ2Iip1z8qhxmjmXGakcvMe6JPY/hAAEC2+CUoaTK1s8mrib2swBplgYmDyfyooejclKJ1z6EHdI2WMK4J24WF7jUTuB2Iy2jCxUu6PWQb6vJk7+dzHjFomvRPg5tOVHXoD6/lQqXdHK0CarCHgn3mIXDdH2woRFvsa2KjAoxRuQziw6/n/JgpWchPIMAAkfD6uYQFw0e9swAafn+8K+99cdoXGp054p3DJmVkf4TOhW+b4b+LuW5IPvIiqRGWhzgLthkfN1YKgaAiNNWlOde+9yfpzQZuHgEh4lS3IJo3z7+G6HL+Lck90HCh3Jm4MZH6d2DXpkUjKMJlz7FX8Z2NBfT861SpRIMgnBfszph/4y2V1qw1ifa49AgOuYri2F4cU3WNMXJ2DpIbItMFfnKdH64fVEBTFyPOGfVCSGKUUO081hvWgtPFboTsdpQwLWJMeY/Addvf/lHRyZVsClLHdefTkjoOyy6Wcr0Sq2IqSQjWMCnI/EAzw34yGyXKcQ00073D88MylsNO4PHke0UzLb666WAMnELM9qaXC9OQ0kuNfhNqbk8pG0QqNHgOkx6b/vk0+r4lF158RvZSP/DwffxwDeY6BkpsxSKvjv3evVt7PWirqXzmUc2X5j6NoFsKeexHhrgXJHgFJlp5twCN1HcureRYrcpoMGQ1Vwejx2raukAknq6jlETj4RfH4JlHi1dE4ivAMhziZgiTmYdLzoh+R7VaFHWRSOXsdJ0NDCk0aoMAuyDLOzXuGJ1AXXaNOxGzwC3kdihRc3EOwKYp9MhoVL6JrgLp1lKxkqn52ZmIGznGm4RYkYoH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(64756008)(4326008)(31696002)(86362001)(2906002)(71200400001)(6486002)(122000001)(76116006)(38100700002)(8676002)(66946007)(66556008)(66446008)(66476007)(91956017)(5660300002)(8936002)(316002)(82960400001)(38070700005)(6916009)(54906003)(36756003)(6506007)(53546011)(26005)(41300700001)(186003)(2616005)(31686004)(478600001)(83380400001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VE4rd2kzTXd3ZFpveFVBaFBEcm51Q1dxV0kzMnpsbTB4ZlhEazFuN1FiYWJE?=
 =?utf-8?B?bUMxTkRWRnd3blg1OHhZdlJzbzNCNGVKM0ttbjVMUkZtLy9BdWZLa0Z4T2o4?=
 =?utf-8?B?MVVPN3FnZFJGNWd4dWxXcnNPWFhSYU9zaGRNOE5ZZi9SdXVDcHo2cXJDSTVZ?=
 =?utf-8?B?bEI3NHprZ0tOZUdHRmJiT0xONWUrbkdWY3V2Vlp6c29QV043c1FsMm9hWEpw?=
 =?utf-8?B?MmJMNkZXOUtJdURNdDg4K3lHM1RxYzV4bEhTdmVYZ0oxMSswVGM2UzZqNCtX?=
 =?utf-8?B?WE85bDBta2VuMHdIUEJoMDR3WGMxemtualZSMy9XMkQvU0w0RDdXMkVyT0NM?=
 =?utf-8?B?Y3B6OW15dzJWcmFwMHluQnM2Rkh5TU0xSWZja2tUSzNLanRFSGp1eUlEUkhW?=
 =?utf-8?B?MzRKQ0F4eXVpVUV2QnlHZUZrVG1PVGtjMFZva0lkcjEwWGI2N3FUejN0WUxJ?=
 =?utf-8?B?QUJRN0hrYmRqTEhKdnVJSllZTkl5RFNGdVkrTnMwWndJdGRBT1dhMW94ckZi?=
 =?utf-8?B?QVF5MDgxN0dMTllhbUdtQThtYWd5eGVpUUoxNy81WFZxME0zYkEwK2FsNmdC?=
 =?utf-8?B?amZDaU9Tckdpc3k1VFNRR21PYWFBSUdkWVB1ZGU4NiszbnVNNWloQlF5Nk1H?=
 =?utf-8?B?bVBYNGZJSGRhb1RCOWYxMUFhSWNEMmxyTE5PQlBha1dKZFJNM0phYVF4L2lO?=
 =?utf-8?B?VEg5bHY3MWIwd3F3ODVLVnlwSjhnbGZYcWo4VUtuNk40R0lqK0NnUEFpMU1X?=
 =?utf-8?B?dEJSVnhkSTA5dlhTTFlzZ1Bqa1dDbGlXK25XSVNUQnp0ZlpZYUlJZUxRSjFJ?=
 =?utf-8?B?MVZuTVlFNXAvOEhYamdZZzV2MDhpR0c3WTFqbWo3Wml3OXVZem1PWXNNL3lB?=
 =?utf-8?B?T2RnZTloaG5ndk1ocDFUbVprV1pQNEhYMit3cDM4eVJ6WUtOTitaU05FbVVS?=
 =?utf-8?B?U3pBS3dJaC8yMTZTeVdaNERWdjR3Q3hqMFI4YWR4NEFsOUFwTzVTbFdScnhZ?=
 =?utf-8?B?Y0RUVUFaL09WUlhJdkpkYXNJcWdIWjZmMjhyekNtZTExZlpHTUxKOVdTT0tI?=
 =?utf-8?B?MEdOdHZhdnV0bVpoN3lENzZGU25RMXYrZW1nVVQxVGhkU0M5MVdCRXV0UXhS?=
 =?utf-8?B?OXJ2NTY0QUxBeU5xRDVYTFBSTTE0b0xJdFJIVEZFeUQ3dnFmTnNSTGUxbTlr?=
 =?utf-8?B?WmtOVGRPNEZqR1pybStub0QzbVA2VTdsc214cXlGeTJIYm44MFNjSGpRSlFu?=
 =?utf-8?B?KzlhT0tIYWkvZEQ2VTFRemhTaUZSclJMMGlyZWlxWkZFeFFLckI4RzdOZHk4?=
 =?utf-8?B?T0ZTRXFaZUpIb2RJVjAzVW5kRFFiQjEyejhlTU5PVktLSHZJbHo3UmFkM29w?=
 =?utf-8?B?a0o4UnNpaHFlblpObHp1SWlrWHFXR0ZhcHNkeENUU3hYZFVzZFI5RVFkWmI3?=
 =?utf-8?B?ejBXWW9HaWRvQlZSU2FoQkFpRVczOFZBSGwzOXJmZnlwYXhRSE5oalVlSHVE?=
 =?utf-8?B?Tlk0M3dWVE1ZTmc2clZ2OThGU2laMkExQURHR3FCaERNbHVNcWFqTXhwcmI1?=
 =?utf-8?B?K2ZYMGVPUS8vU3VUTVVhbW5BWEVvU0hjWDJsR3VjZVNRZHJkaVFsR1RrOEQ3?=
 =?utf-8?B?ZHlhZHRRZjVWaXA4N3FrTmhzb2doK21sZE5BRXBONHNuaVhkck9UeHNrcVpx?=
 =?utf-8?B?eCtkNDRvbDB4SzRBQWpoeEsyQnR6aVFVWUc2a3Z3bXRXbEtsYjVnNDZxWTVm?=
 =?utf-8?B?QUppeUhzMkdaYXhQOExuV3pLY0U3a2RKNGwzSWszVUx2U3dkVGNXYTh2c0c5?=
 =?utf-8?B?VWdrS2hmSG1FS1VmRml6Q01MMTNHR00xeWpJbWd0bEMwQVJtLzJ6WmxRNkxa?=
 =?utf-8?B?bW5HdU5NYzBaVHdTMno0SzBNcVV1N01EVFpGQ3AyMmt5MFdmbjNSR0QydE1i?=
 =?utf-8?B?Wkk4cUw5MGFpMnFQUDlyT1FEQWNKYm90L2hqbjluN0RJN1lLZ2hRaENiSkNq?=
 =?utf-8?B?bW02amlNdnZwU0taVDFuTnlXWXJWdUZwRGdnVVJjUU1aa1pPSFd1VWhxVkw1?=
 =?utf-8?B?dzRCN2hvSTBWdWpTbHRLY25Pb1FxMlV4UFE3c2hTaHcvM3VRb1gyR3FVaXNT?=
 =?utf-8?B?dTc3MGpmd3ZjOUI1MlRFbEZZZWtWSVJhWWhJazYyYy9LQ3NrdFBaam1WK01i?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E08A31356566043AA7B06DF7B1089B4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xMe9lXf4bcVNhLKH7n/qmnQbD/ZoOQp5rcJOK/pGaan9UspWG3/KbUnAth46oRcSfekaKFjY/XX0/AEpkRUU/PuJuXdjjB4JyLRDsEBRJ/tA1Psbiqpsm0Bna1/KhKfV84vH8NbJt433gPqklqULhVNtJhmqN9pAFjWE73gSB/gGu54UHdx/LEcYKN3/dQ6Uw5tP8TwrgUCA45LzFPYGcCvn9Za7UoMV49QMQj7GjXnkEGhYeOKOg5yX3femSXO4ADMJdhmDD1vzV3xQwhCgyGKhRfkgJ4+SjB9ZyhvxK7YtsWn0BB3GXiciKypUKufsyAzH18LRxdeP58ezsjt/NdVNZC67f3GvtDWI1t0zbkacAxm+Ado3ry2WtJ9UkjYkI2f7y5qzReLMjJ3NV51+ySlDUac+Yh1hMywateCyhj//JeAecQvdf1SyXPFhjPp1WRxx7ZyKcFYYY6zeEPrSpEY8+to5nQawptIxvOO7bxbGA7kKoMrL6PXmkCQWGxvaOsBsSTtNFbnhH2bku+PhJbjseRtNT9qFfhu2/2L/ta2rt96afd1sG2N9v1726A1xQllNItvR6TrrTUIUfm4biER14KtwP3Ms6RPu+7rIoync7gWL9dGks5uQGR3kx+k7rdMplLe6Yud2AveIMCMwNweOEm0DX0Zl0KSU8tvPstvubycNpC0+plx7dfcnxNtMsBVKIcXh7J/IjhJUhMXaW+m8CtX9gWppkuUkWyWMh5p/jWORaKxwBiGJBAqHi8WIX58PfibZzWksH3jerLUowgIZj5pcuEL9Z8+3iYjq4kAw0M2+b50pW7pGEQPwGRnA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15751337-d876-40ad-c60f-08da7bc4440b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 18:06:51.1462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRm3AspFQeti0vsZd4cVBrABmXhkKH1JMCgbvW+CUHPvekN6lyxZjRsIGqN+Y2rHSgOnCpA4PPcubbWf+v+x0bT7Y2tIeZp2ViHYJmKFMrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6939

T24gMTAvMDgvMjAyMiAwOTowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA4LjIwMjIg
MTk6MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC9lbnRyeS5TDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC9lbnRyeS5TDQo+PiBAQCAt
NDQsNiArNDQsNyBAQCBFTlRSWSh2bXhfYXNtX3ZtZXhpdF9oYW5kbGVyKQ0KPj4gICAgICAgICAg
LmVuZG0NCj4+ICAgICAgICAgIEFMVEVSTkFUSVZFICIiLCByZXN0b3JlX3NwZWNfY3RybCwgWDg2
X0ZFQVRVUkVfU0NfTVNSX0hWTQ0KPj4gICAgICAgICAgLyogV0FSTklORyEgYHJldGAsIGBjYWxs
ICpgLCBgam1wICpgIG5vdCBzYWZlIGJlZm9yZSB0aGlzIHBvaW50LiAqLw0KPj4gKyAgICAgICAg
LyogT24gUEJSU0ItdnVsZW5yYWJsZSBoYXJkd2FyZSwgYHJldGAgbm90IHNhZmUgYmVmb3JlIHRo
ZSBzdGFydCBvZiB2bXhfdm1leGl0X2hhbmRsZXIoKSAqLw0KPiBCZXNpZGVzIHRoZSBzcGVsbGlu
ZyBpc3N1ZSBtZW50aW9uZWQgYnkgSmFzb24gSSB0aGluayB0aGlzIGxpbmUgYWxzbw0KPiB3YW50
cyB3cmFwcGluZy4gTWF5YmUgdGhlIHR3byBjb21tZW50cyBhbHNvIHdhbnQgY29tYmluaW5nIHRv
IGp1c3QNCj4gb25lLCBzdWNoIHRoYXQgIldBUk5JTkchIiBjbGVhcmx5IGFwcGxpZXMgdG8gYm90
aCBwYXJ0cy4NCj4NCj4+IEBAIC01MTUsNyArNTE1LDggQEAgc3RhdGljIHZvaWQgX19pbml0IHBy
aW50X2RldGFpbHMoZW51bSBpbmRfdGh1bmsgdGh1bmssIHVpbnQ2NF90IGNhcHMpDQo+PiAgICAg
ICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0lCUEJfRU5UUllfSFZNKSB8fA0KPj4g
ICAgICAgICAgICAgIG9wdF9lYWdlcl9mcHUgfHwgb3B0X21kX2NsZWFyX2h2bSkgICAgICAgPyAi
IiAgICAgICAgICAgICAgIDogIiBOb25lIiwNCj4+ICAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhY
ODZfRkVBVFVSRV9TQ19NU1JfSFZNKSAgICAgID8gIiBNU1JfU1BFQ19DVFJMIiA6ICIiLA0KPj4g
LSAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NDX1JTQl9IVk0pICAgICAgPyAi
IFJTQiIgICAgICAgICAgIDogIiIsDQo+PiArICAgICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZF
QVRVUkVfU0NfUlNCX0hWTSkgICAgICA/ICIgUlNCIiAgICAgICAgICAgOg0KPj4gKyAgICAgICAg
ICAgYm9vdF9jcHVfaGFzKFg4Nl9CVUdfUEJSU0IpICAgICAgICAgICAgICAgPyAiIFBCUlNCIiAg
ICAgICAgIDogIiIsDQo+PiAgICAgICAgICAgICBvcHRfZWFnZXJfZnB1ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA/ICIgRUFHRVJfRlBVIiAgICAgOiAiIiwNCj4+ICAgICAgICAgICAgIG9w
dF9tZF9jbGVhcl9odm0gICAgICAgICAgICAgICAgICAgICAgICAgID8gIiBNRF9DTEVBUiIgICAg
ICA6ICIiLA0KPj4gICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0lCUEJfRU5U
UllfSFZNKSAgPyAiIElCUEItZW50cnkiICAgIDogIiIpOw0KPiBBbG9uZyB0aGUgbGluZXMgb2Yg
aGFsZiBvZiB3aGF0IGZkYmY4YmRmZWJjMiAoIng4Ni9zcGVjLWN0cmw6DQo+IGNvcnJlY3QgcGVy
LWd1ZXN0LXR5cGUgcmVwb3J0aW5nIG9mIE1EX0NMRUFSIikgZGlkLCBJIHRoaW5rIHlvdSBhbHNv
IHdhbnQNCj4gdG8gZXh0ZW5kIHRoZSBvdGhlciAoZWFybGllcikgY29uZGl0aW9uYWwgaW4gdGhp
cyBmdW5jdGlvbiBpbnZvY2F0aW9uLg0KDQpPaCB5ZXMsIGdvb2QgcG9pbnQuDQoNCj4gSSBhbHNv
IHdvbmRlciB3aGV0aGVyIGl0IHdvdWxkbid0IGJlIGhlbHBmdWwgdG8gcGFyZW50aGVzaXplIHRo
ZSBuZXcNCj4gY29uc3RydWN0LCBzdWNoIHRoYXQgaXQnbGwgYmUgbW9yZSBvYnZpb3VzIHRoYXQg
dGhpcyBpcyBhIGRvdWJsZQ0KPiBjb25kaXRpb25hbCBvcGVyYXRvciBkZXRlcm1pbmluZyBhIHNp
bmdsZSBmdW5jdGlvbiBhcmd1bWVudC4NCg0KSSBoYXZlbid0IGRvbmUgdGhhdCBlbHNld2hlcmUu
wqAgUGVyc29uYWxseSwgSSBmaW5kIGl0IGVhc2llciB0byBmb2xsb3cNCnRoZSBjb21tYXMgb24g
dGhlIFJIUy4NCg0KPg0KPj4gQEAgLTcxOCw2ICs3MTksNzcgQEAgc3RhdGljIGJvb2wgX19pbml0
IHJzYl9pc19mdWxsX3dpZHRoKHZvaWQpDQo+PiAgICAgIHJldHVybiB0cnVlOw0KPj4gIH0NCj4+
ICANCj4+ICsvKg0KPj4gKyAqIEhWTSBndWVzdHMgY2FuIGNyZWF0ZSBhcmJpdHJhcnkgUlNCIGVu
dHJpZXMsIGluY2x1ZGluZyBvbmVzIHdoaWNoIHBvaW50IGF0DQo+PiArICogWGVuIHN1cGVydmlz
b3IgbWFwcGluZ3MuDQo+PiArICoNCj4+ICsgKiBUcmFkaXRpb25hbGx5LCB0aGUgUlNCIGlzIG5v
dCBpc29sYXRlZCBvbiB2bWV4aXQsIHNvIFhlbiBuZWVkcyB0byB0YWtlDQo+PiArICogc2FmZXR5
IHByZWNhdXRpb25zIHRvIHByZXZlbnQgUlNCIHNwZWN1bGF0aW9uIGZyb20gY29uc3VtaW5nIGd1
ZXN0IHZhbHVlcy4NCj4+ICsgKg0KPj4gKyAqIEludGVsIGVJQlJTIHNwZWNpZmllcyB0aGF0IHRo
ZSBSU0IgaXMgZmx1c2hlZDoNCj4+ICsgKiAgIDEpIG9uIFZNRXhpdCB3aGVuIElCUlM9MSwgb3IN
Cj4+ICsgKiAgIDIpIHNob3J0bHkgdGhlcmVhZnRlciB3aGVuIFhlbiByZXN0b3JlcyB0aGUgaG9z
dCBJQlJTPTEgc2V0dGluZy4NCj4+ICsgKiBIb3dldmVyLCBhIHN1YnNldCBvZiBlSUJSUy1jYXBh
YmxlIHBhcnRzIGFsc28gc3VmZmVyIFBCUlNCIGFuZCBuZWVkDQo+PiArICogc29mdHdhcmUgYXNz
aXN0YW5jZSB0byBtYWludGFpbiBSU0Igc2FmZXR5Lg0KPj4gKyAqLw0KPj4gK3N0YXRpYyBfX2lu
aXQgZW51bSBodm1fcnNiIHsNCj4+ICsgICAgaHZtX3JzYl9ub25lLA0KPj4gKyAgICBodm1fcnNi
X3BicnNiLA0KPj4gKyAgICBodm1fcnNiX3N0dWZmMzIsDQo+PiArfSBodm1fcnNiX2NhbGN1bGF0
aW9ucyh1aW50NjRfdCBjYXBzKQ0KPj4gK3sNCj4+ICsgICAgaWYgKCBib290X2NwdV9kYXRhLng4
Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9JTlRFTCB8fA0KPj4gKyAgICAgICAgIGJvb3RfY3B1X2Rh
dGEueDg2ICE9IDYgKQ0KPj4gKyAgICAgICAgcmV0dXJuIGh2bV9yc2Jfc3R1ZmYzMjsNCj4+ICsN
Cj4+ICsgICAgaWYgKCAhKGNhcHMgJiBBUkNIX0NBUFNfSUJSU19BTEwpICkNCj4+ICsgICAgICAg
IHJldHVybiBodm1fcnNiX3N0dWZmMzI7DQo+PiArDQo+PiArICAgIGlmICggY2FwcyAmIEFSQ0hf
Q0FQU19QQlJTQl9OTyApDQo+PiArICAgICAgICByZXR1cm4gaHZtX3JzYl9ub25lOw0KPj4gKw0K
Pj4gKyAgICAvKg0KPj4gKyAgICAgKiBXZSdyZSBjaG9vc2luZyBiZXR3ZWVuIHRoZSBlSUJSUy1j
YXBhYmxlIG1vZGVscyB3aGljaCBkb24ndCBlbnVtZXJhdGUNCj4+ICsgICAgICogUEJSU0JfTk8u
ICBFYXJsaWVyIHN0ZXBwaW5ncyBvZiBzb21lIG1vZGVscyBkb24ndCBlbnVtZXJhdGUgZUlCUlMg
YW5kDQo+PiArICAgICAqIGFyZSBleGNsdWRlZCBhYm92ZS4NCj4+ICsgICAgICovDQo+PiArICAg
IHN3aXRjaCAoIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsICkNCj4+ICsgICAgew0KPj4gKyAgICAg
ICAgLyoNCj4+ICsgICAgICAgICAqIENvcmUgKGluYyBIeWJyaWQpIENQVXMgdG8gZGF0ZSAoQXVn
dXN0IDIwMjIpIGFyZSB2dWxlbnJhYmxlLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgIGNhc2Ug
MHg1NTogLyogU2t5bGFrZSBYICovDQo+PiArICAgIGNhc2UgMHg2YTogLyogSWNlIExha2UgU1Ag
Ki8NCj4+ICsgICAgY2FzZSAweDZjOiAvKiBJY2UgTGFrZSBEICovDQo+PiArICAgIGNhc2UgMHg3
ZTogLyogSWNlIExha2UgY2xpZW50ICovDQo+PiArICAgIGNhc2UgMHg4YTogLyogTGFrZWZpZWxk
IChTTkMvVE1UKSAqLw0KPj4gKyAgICBjYXNlIDB4OGM6IC8qIFRpZ2VyIExha2UgVSAqLw0KPj4g
KyAgICBjYXNlIDB4OGQ6IC8qIFRpZ2VyIExha2UgSCAqLw0KPj4gKyAgICBjYXNlIDB4OGU6IC8q
IFNreWxha2UtTCAqLw0KPiBIbW0sIGlzIFNETSBWb2wgNCdzIGluaXRpYWwgdGFibGUgd3Jvbmcg
dGhlbiBpbiBzdGF0aW5nIEthYnkgTGFrZSAvDQo+IENvZmZlZSBMYWtlIGZvciB0aGlzIGFuZCAu
Li4NCj4NCj4+ICsgICAgY2FzZSAweDk3OiAvKiBBbGRlciBMYWtlIFMgKi8NCj4+ICsgICAgY2Fz
ZSAweDlhOiAvKiBBbGRlciBMYWtlIEgvUC9VICovDQo+PiArICAgIGNhc2UgMHg5ZTogLyogU2t5
bGFrZSAqLw0KPiAuLi4gdGhpcz8gT3RvaCBJIG5vdGljZSB0aGF0IGludGVsLWZhbWlseS5oIGFs
c28gc2F5cyBTa3lsYWtlIGluDQo+IHJlc3BlY3RpdmUgY29tbWVudHMsIGRlc3BpdGUgdGhlIGNv
bnN0YW50cyB0aGVtc2VsdmVzIGJlaW5nIG5hbWVkDQo+IGRpZmZlcmVudGx5LiBZZXQgYWdhaW4g
Li4uDQo+DQo+PiArICAgIGNhc2UgMHhhNTogLyogQ29tZXQgTGFrZSAqLw0KPj4gKyAgICBjYXNl
IDB4YTY6IC8qIENvbWV0IExha2UgVTYyICovDQo+IC4uLiB5b3UgY2FsbCB0aGVzZSBDb21ldCBM
YWtlIHdoZW4gaW50ZWwtZmFtaWx5Lmggc2F5cyBTa3lsYWtlIGFsc28gZm9yDQo+IHRoZXNlIChh
bmQgbmFtZXMgdGhlIGxhdHRlcidzIHZhcmlhYmxlIENPTUVUTEFLRV9MKS4NCj4NCj4gV2hhdCBp
cyBpbiB0aGUgY29tbWVudHMgaGVyZSBpcyBvZiBjb3Vyc2Ugbm90IG9mIHByaW1hcnkgY29uY2Vy
biBmb3INCj4gZ2V0dGluZyB0aGlzIHBhdGNoIGluLCBidXQgdGhlIG5hbWVkIGFub21hbGllcyB3
aWxsIHN0YW5kIG91dCB3aGVuIGFsbA0KPiBvZiB0aGlzIGlzIHN3aXRjaGVkIG92ZXIgdG8gdXNl
IGludGVsLWZhbWlseS5oJ3MgY29uc3RhbnRzLg0KDQpOYW1pbmcgaW4gU2t5bGFrZS11YXJjaCBp
cyBhIHRvdGFsIG1lc3MuwqAgSGFsZiBpcyBjb3JlIGNvZGVuYW1lcywgYW5kDQpoYWxmIGlzIG1h
cmtldGluZyBhdHRlbXB0aW5nIHRvIGNvdmVyIHRoZSBmYWN0IHRoYXQgbm90aGluZyBtdWNoIGNo
YW5nZWQNCmluIHRoZSAxMCdzIG9mIHN0ZXBwaW5ncyBmb3IgMHg4ZS8weDllLg0KDQpCdXQgeWVz
LCBJIGRvIG5lZWQgdG8gY2xlYW4gdXAgYSBmZXcgZGV0YWlscyBoZXJlLsKgIEknbSBzdGlsbCB3
YWl0aW5nDQpmb3Igc29tZSBjb3JyZWN0aW9ucyB0byBiZSBtYWRlIGluIG9mZmljaWFsIGRvY3Mu
DQoNCj4NCj4+IEBAIC0xMzI3LDkgKzE0MDAsMzMgQEAgdm9pZCBfX2luaXQgaW5pdF9zcGVjdWxh
dGlvbl9taXRpZ2F0aW9ucyh2b2lkKQ0KPj4gICAgICAgKiBIVk0gZ3Vlc3RzIGNhbiBhbHdheXMg
cG9pc29uIHRoZSBSU0IgdG8gcG9pbnQgYXQgWGVuIHN1cGVydmlzb3INCj4+ICAgICAgICogbWFw
cGluZ3MuDQo+PiAgICAgICAqLw0KPj4gKyAgICBodm1fcnNiID0gaHZtX3JzYl9jYWxjdWxhdGlv
bnMoY2Fwcyk7DQo+PiArICAgIGlmICggb3B0X3JzYl9odm0gPT0gLTEgKQ0KPj4gKyAgICAgICAg
b3B0X3JzYl9odm0gPSBodm1fcnNiICE9IGh2bV9yc2Jfbm9uZTsNCj4+ICsNCj4+ICAgICAgaWYg
KCBvcHRfcnNiX2h2bSApDQo+PiAgICAgIHsNCj4+IC0gICAgICAgIHNldHVwX2ZvcmNlX2NwdV9j
YXAoWDg2X0ZFQVRVUkVfU0NfUlNCX0hWTSk7DQo+PiArICAgICAgICBzd2l0Y2ggKCBodm1fcnNi
ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgIGNhc2UgaHZtX3JzYl9wYnJzYjoNCj4+ICsg
ICAgICAgICAgICBzZXR1cF9mb3JjZV9jcHVfY2FwKFg4Nl9CVUdfUEJSU0IpOw0KPj4gKyAgICAg
ICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICAgICAgY2FzZSBodm1fcnNiX25vbmU6DQo+PiAr
ICAgICAgICAgICAgLyoNCj4+ICsgICAgICAgICAgICAgKiBTb21ld2hhdCBhcmJpdHJhcnkuICBJ
ZiBzb21ldGhpbmcgaXMgd3JvbmcgYW5kIHRoZSB1c2VyIGhhcw0KPj4gKyAgICAgICAgICAgICAq
IGZvcmNlZCBIVk0gUlNCIHByb3RlY3Rpb25zIG9uIGEgc3lzdGVtIHdoZXJlIHdlIHRoaW5rIG5v
dGhpbmcNCj4+ICsgICAgICAgICAgICAgKiBpcyBuZWNlc3NhcnksIHRoZXkgdGhleSBwb3NzaWJs
eSBrbm93IHNvbWV0aGluZyB3ZSBkb250Lg0KPj4gKyAgICAgICAgICAgICAqDQo+PiArICAgICAg
ICAgICAgICogVXNlIHN0dWZmMzIgaW4gdGhpcyBjYXNlLCB3aGljaCBpcyB0aGUgbW9zdCBwcm90
ZWN0aW9uIHdlIGNhbg0KPj4gKyAgICAgICAgICAgICAqIG11c3Rlci4NCj4+ICsgICAgICAgICAg
ICAgKi8NCj4+ICsgICAgICAgICAgICBmYWxsdGhyb3VnaDsNCj4+ICsNCj4+ICsgICAgICAgIGNh
c2UgaHZtX3JzYl9zdHVmZjMyOg0KPj4gKyAgICAgICAgICAgIHNldHVwX2ZvcmNlX2NwdV9jYXAo
WDg2X0ZFQVRVUkVfU0NfUlNCX0hWTSk7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAg
ICAgICB9DQo+PiAgDQo+PiAgICAgICAgICAvKg0KPj4gICAgICAgICAgICogRm9yIFNWTSwgWGVu
J3MgUlNCIHNhZmV0eSBhY3Rpb25zIGFyZSBwZXJmb3JtZWQgYmVmb3JlIFNUR0ksIHNvDQo+IEZv
ciBwZW9wbGUgdXNpbmcgZS5nLiAic3BlYy1jdHJsPW5vLWlicnMiIGJ1dCBsZWF2aW5nIFJTQiBz
dHVmZmluZyBlbmFibGVkDQo+IChvciBmb3JjZS1lbmFibGluZyBpdCkgd2UnZCBuZWVkIHRvIGhh
dmUgYW4gTEZFTkNFIHNvbWV3aGVyZSBhcyB3ZWxsLg0KDQpXZSBkb24ndCwgYnV0IGl0J3Mgc3Vi
dGxlLg0KDQpBdHRlbXB0aW5nIHRvIGV4cGxvaXQgUEJSU0IgaXMgYSBzdWItY2FzZSBvZiB0cnlp
bmcgdG8gZXhwbG9pdCBnZW5lcmFsDQpSU0Igc3BlY3VsYXRpb24gb24gb3RoZXIgcHJvY2Vzc29y
cyB3aGljaCBkb2Vzbid0IGZsdXNoIHRoZSBSU0Igb24gdm1leGl0Lg0KDQpYZW4gZG9lc24ndCBh
cmNoaXRlY3R1cmFsbHkgZXhlY3V0ZSBtb3JlIFJFVHMgdGhhbiBDQUxMcyAodW5saWtlIG90aGVy
DQpvcGVuIHNvdXJjZSBoeXBlcnZpc29ycyB3aGljaCBkbyBoYXZlIGEgcHJvYmxlbSBoZXJlKSwg
c28gYW4gYXR0YWNrZXINCmZpcnN0IG5lZWRzIHRvIGNvbnRyb2wgc3BlY3VsYXRpb24gdG8gZmlu
ZCBhIG5vbi1hcmNoaXRlY3R1cmFsIHBhdGggd2l0aA0KZXhjZXNzIFJFVHMuDQoNClRoaXMgaXMg
YWxyZWFkeSBtYWtlcyBpdCBhIGxhY2stb2YtZGVmZW5jZS1pbi1kZXB0aCB0eXBlIHByb2JsZW0s
DQpiZWNhdXNlIGlmIHRoZSBhdHRhY2tlciBjb3VsZCBjb250cm9sIHNwZWN1bGF0aW9uIGxpa2Ug
dGhhdCwgdGhleSdkIG5vdA0KY2FyZSBhYm91dCBjaGFpbmluZyBpdCBsaWtlIHRoaXMgdG8gYSBt
b3JlIGNvbXBsaWNhdGVkIGV4cGxvaXQuDQoNCkFuIGF0dGFja2VyIGhhcyB0byBmaW5kIGVub3Vn
aCByZXRzIHRvIHVud2luZCBhbGwgdGhlIENBTExzIFhlbiBoYXMgZG9uZQ0KdGh1cyBmYXIgKDMg
aW4gdGhpcyBleGFtcGxlLsKgIDIgZnJvbSB0aGUgZmlyc3QgUlNCIGxvb3AsIGFuZCB0aGUgY2Fs
bCB1cA0KaW50byB0aGUgdm1leGl0IGhhbmRsZXIpLCBhbmQgdGhlbiBvbmUgZXh0cmEgdG8gY29u
c3VtZSB0aGUgYmFkIFJTQg0KZW50cnkuwqAgaS5lLiB0aGV5IG5lZWQgdG8gZmluZCBhbiB1bmV4
cGVjdGVkIGNvZGUgc2VxdWVuY2UgaW4gWGVuIHdpdGggNA0KZXhjZXNzIFJFVHMsIGFzc3VtaW5n
IHRoZXkgY2FuIGZpbmQgYSBnYWRnZXQgaW4gdm14X3ZtZXhpdF9oYW5kbGVyKCkNCm9ubHkgd2hp
Y2ggdGhleSBjYW4gY29udHJvbCBzcGVjdWxhdGlvbiB3aXRoLg0KDQpBbGwgdGhlIEhWTSBmdW5j
cyBhcmUgYWx0Y2FsbHMgbm93LCB3aGljaCB3b3VsZCBoYXZlIGJlZW4gYmUgdGhlIG9idmlvdXMN
CnBsYWNlIHRvIHRyeSBhbmQgYXR0YWNrLCBidXQgY2FuJ3QgYmUgYXR0YWNrZWQgYW55IG1vcmUu
wqAgV2UgZG8gaGF2ZQ0Kc29tZSBpbmRpcmVjdCBicmFuY2hlcywgYW5kIG90aGVyIG1lY2hhbmlz
bXMgaW4gcGxhY2UgdG8gdHJ5IGFuZCBwcm90ZWN0DQp0aGVtLg0KDQpCdXQuLi4gYW4gYXR0YWNr
ZXIgaGFzIHRvIGRvIGFsbCBvZiB0aGlzLCBpbiB0aGUgc3BlY3VsYXRpdmUgc2hhZG93IG9mDQp0
aGUgbWlzcHJlZGljdGVkIGxvb3AgZXhpdCwgdGFraW5nIGl0IGZpcm1seSBmcm9tICJ0aGVvcmV0
aWNhbGx5IiBpbnRvDQoiaW1wb3NzaWJsZSIgdGVycml0b3J5Lg0KDQp+QW5kcmV3DQo=

