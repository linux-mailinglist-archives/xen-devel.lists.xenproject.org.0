Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1280D5544A4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 10:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353544.580481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3vld-0002zg-1b; Wed, 22 Jun 2022 08:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353544.580481; Wed, 22 Jun 2022 08:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3vlc-0002wE-U3; Wed, 22 Jun 2022 08:31:16 +0000
Received: by outflank-mailman (input) for mailman id 353544;
 Wed, 22 Jun 2022 08:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Os2d=W5=citrix.com=prvs=1655f9567=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o3vlb-0002w8-UN
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 08:31:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abf18351-f205-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 10:31:13 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 04:31:01 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BN8PR03MB4914.namprd03.prod.outlook.com (2603:10b6:408:7b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 08:31:00 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:31:00 +0000
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
X-Inumbo-ID: abf18351-f205-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655886673;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=cTB+REf+EfWeu3MSb06QA/Lz0pdfHWUEBAN+bMFudIM=;
  b=Y8FqS3/CHcCqZhUw8Gmmwjjot5Sky20u9MFtmcbalgcMwupfD58YkdfC
   bZ6Ll8FizXLte8DBO/R+sxP9Qgml37pzhxQGqW05p1Nk5dSzIFEduupZB
   vJwfX20lb0dkFntbG/z4MrcuymwxN0+cSAxYAh1+sAW+wb59wNsCsVY3+
   8=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 76709548
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jyUxZavo5VSFf9q2f1nY98r3SOfnVLJfMUV32f8akzHdYApBs4E2e
 1ou7Vv2eabdPDOxPpsjdtz1pnqyiuaGyINhTwVopS5kFSga9MaYCIiTJRv6NXrJI8SbHBw7v
 s8TOoWfIpA4QHWC+0r1O7O59HIh362CT+TxVeOUYnp8LeMIpF/NrDo68wJuqtI40bBVej+wh
 O4eg/EzGXeshmMpPGtP5f/dpRlhtvr+tTgWsgM3OvlA5wePzSRKB8NDKfm9IUWjT9gPFIZWZ
 QpiIJJVXI/9101wYj9wuu+jKiXmepaLYU7WzCA+t5GK2nCunARrukoAHKdaOB0/ZwmhxYgrk
 o0T78boE2/FA4WX8Agje0gAe81BFfUuFI/veRBTZuTKkiUq21O1qxlfJBle0b8wo46bMkkXn
 RAsExgfbwjrug6D6OnTpt+AJCgUBJKD0Is34hmMxNxCZBosacirr67ivbe00Nqs7yzn8Dm3i
 8cxMFJSgBr8jxJnP0gtU7c9k+aThyP/LzFKuHOMlKhp2j2GpOBx+OCF3Nv9XPWvHJ0QtGDH4
 2XM8iL+Hw0QM8GZxXyd6HWwi+TTnCT9HoUPCLm/8f0si1qWroARIEROCR3n/r/m0gjnA4o3x
 088o0LCqYAd+UuxQdS7cwC+pHeclhUdR8BRA6sx7wTlJq/8vFjGXjlZEm4phNoOnZcJRhMh/
 1ywgN7JGwxeiOWcVEy0z+LBxd+1EW1PRYMYXgcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWr74UiMsKy7m250vvkz+qvoLOTAM++kPQRG3N0+9iTIusZojt416E6/9Fdd6dVgPY5
 CBCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWaBj
 JP70e+J2KJuAQ==
IronPort-HdrOrdr: A9a23:R8D0g659iH+R6vK46APXwWSBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTPqftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkzNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9o1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUWpDKh8KoCOCW/sLlWFtzesHfsWG2nYczHgNkBmpDt1L/tqq
 iKn/5vBbU015qbRBDJnfKk4Xid7N9p0Q6s9bbQuwqcneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KJoMxsj+K4KC2Cu3DE10bKq9RjxkC3kLFuGoN5vMga5gdYAZ0AFCX15MQuF/
 RvFtjV4LJTfUmBZ37Us2FzyJj0N05DVCuuUwwHoIiYwjJWlHd2ww8Rw9EehG4J8NY4R4Nf7+
 rJP6x0nPVFT9MQb6h6GOAdKPHHQVDlUFbJKiafMF7nHKYINzbErIP2+qw84KWwdJkB3PIJ6e
 P8uZNjxBoPkm7VeL2zNcdwg2HwqU2GLEfQ49Ab4YRlsbvhQ7euOTGfSTkV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.92,212,1650945600"; 
   d="asc'?scan'208,217";a="76709548"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEfB5AvCQnUEUkwXPzPOB0M5oOEYFTnleu6kp2z/vPitKOD7yEx6fzP8Esp0sD9i3VsrMB3CnS237M+GkWOgntvHgmGtisQvP16FxjgcEBASARoH5c+Z32N1yNnSipORBpeKm1s1YvS9EPUZi2I8MMzKvvqg2Wp0ygHt3lYHf0oP+woyphwdwwbjuzA+nm85C0hhuJ9sCJ/+aekYQajQLdU5t41UaZDe22lX0iyv4PIt3YNP86ENeoZLuUhYdgH+mslm6fbqTFCHLH/5jEDDZ1AbIxngCZbYygjMAYKDKg1WYudTKBkd90qwmfLLRhdJtC9ANjA4h9kRKcJGgAJRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7N/xLNmQov+fUYvspN+f/o+l50VE6w16Sgm6l9cJlw=;
 b=e6l6nZwl9/2mCHFXD0/UBy+ywIRLjylk6InFXRjF5dqsKyR2/pITanscQjMdUepX/VbBB4pXKMYBK1P1Nd0C5OsnlyuY7oqrckOt1+3vTVzNQ+4fDFXSh1qwVcjchuc1x94MuI8/CkIq1sCedgiL32f9ocdGCOu1kE42EhIOO6ZGvDblC/RSTew0zdqMVSJSkIOyqazkLgSX5andC45GLsAHSB7217wdS7lw3LrErPa8v3c3KWfKdjykYuxdWvnV+DgMsDwK1Oj+myY6+VRUJnIxEb1pzS3rmD44nAE2a+z8YgrB1zyHE5JX9CQVTqns4t91Zw56U2jZqibCGS6j/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7N/xLNmQov+fUYvspN+f/o+l50VE6w16Sgm6l9cJlw=;
 b=v1UqLfk4af9NmVLlKbLwHVm6I1JbKVA6ZtT2TIGqoIExcLIDqyARsW7lPErohZ+IEwrHE+KJvHdYSbjiGoGItA1B1ADOjEBYhbVgPryfcEyZ/avViNtGE7gBK7g9du9oHJTV0RwM4nFY1dH//HSCdqGLV/OOIKmUR83su53u3FQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "committers@xenproject.org"
	<committers@xenproject.org>
Subject: Re: disabling mercurial repositories
Thread-Topic: disabling mercurial repositories
Thread-Index: AQHYhXXQ19SGHBtNG0y4Kw3bcwMbNq1Z490AgAE2A4A=
Date: Wed, 22 Jun 2022 08:30:59 +0000
Message-ID: <BEBA205F-9621-46E0-AC5F-8D6054EC727A@citrix.com>
References: <YrHMSJg6Rx9ULvr6@Air-de-Roger>
 <925e715d-df9f-4bb8-616c-389c5c58f479@citrix.com>
In-Reply-To: <925e715d-df9f-4bb8-616c-389c5c58f479@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd9239bf-bd14-4dd3-b6fe-08da5429893d
x-ms-traffictypediagnostic: BN8PR03MB4914:EE_
x-microsoft-antispam-prvs:
 <BN8PR03MB4914D3B6AA0AD483C6D6A31199B29@BN8PR03MB4914.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1qxOHoXZmGSupVwarr/oVRG7q+QF2gTHVgX713/6Ax4XpX0LuQk2Pe9IpbBCwGfutaqKQvGezarRReVHOQ4IVAG7mkNxcidrW8zcXA7BTL/aUnZD2r1OiezE70LyVosdqxz6nLwvDzQO4PGDInNtZ/dRtBfqtHIRaBCWb1XBCnD+y925SYQPMYbu6xOMfp2fbQu/wBCOAcOV//yiBdv2l1Ulpw3d089mRpUWaAPisa2aoyeJfs12zQAz9KtUQZTLa2YRr+FDv7D89crVkeRSo4Pd30pAf3/6BxTznwszPw1ceAH7XLDyBPQbMFlzYmFycSWlQRY69WM2+ehWfQv54v0UDwO+m+qbpe5UucZ6uF7nJdtLRnve9bU3yO8XrQZA/2BsThsVEj5NsiWKaJ0yiIwatLAevLyHNSOhUKk5/zMuUs0pY4Fsmw4P3ad4dJN2wsjKuXDyraRffRnFu+iMw4uCYGb1djyryQNugh/4A2HLmTr6GMyvwUmmNvTwXsBKSIGLlwHXOtR+VW3m0Y2FPtawGe5IE62a1D4T+ksExFh/c10Y+79eQIMKwCy1TJ11t+lOjzB/9lmo74PwhfQBaK+KNkAGYjzUPK+Cy6nLE+qQGwFfgCVaH5VvmASubJ7fTGzU7CRyIeNp/6vsQK0vQZakexcmbmCQUyVY5zITxEZI9EwPLYhGI33zANPyhc7v9cvaHGJrUECS5ETB36fQa+tjVVrVcoeUz0aCtWNCx9fR2zqO31ELTs3DZ8i5yLStDZhfoFDlLLzf2WtufWb5XDl6FjW9+E26dKTT1FasaQY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(7116003)(71200400001)(99936003)(6862004)(82960400001)(8936002)(122000001)(5660300002)(3480700007)(6486002)(2616005)(83380400001)(186003)(41300700001)(478600001)(33656002)(26005)(53546011)(6506007)(66946007)(316002)(86362001)(38070700005)(2906002)(6512007)(4326008)(91956017)(37006003)(6636002)(66556008)(66446008)(8676002)(76116006)(64756008)(36756003)(54906003)(66476007)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmhkVG90S2dFN1ZMSWdhc1NVa3AwcEJYWjlCcXRMMEhIaG1nRU5kVWJVSjJ3?=
 =?utf-8?B?UVd0TFpLMnp6WFZhRVZqQm9ncVZlMnVhRHFvSklZVkpEYVNUTVdDWmhyUFlT?=
 =?utf-8?B?cDRlbUhkaUR3bGptYkJ2aVcxZmt5WnVRSkkzMThEa2ZtbGt1RkoveFgzVGdV?=
 =?utf-8?B?Z05NSW1rN0ZNd1JOc1l4clFoVlVOQ2NIWENvbGNPdTV6M3k3bklpZ1BrVG1R?=
 =?utf-8?B?NVhpM0M2NkFzNGlqejgzdmw0N2JDOW1PTjBHaVJwdGtXclM3UHFIR0I3VUNp?=
 =?utf-8?B?MUhDaWZ5NFFOSk8wTVdIald5RHlvSG8rb3RTVVRhRVVBZmtCUGQ1TW0rbnB6?=
 =?utf-8?B?WkxrbnpKdTQwaDA0TGZ5czJ5azVJOERuVTRHYk9acWxCd1JBYTBHSlh6OGlX?=
 =?utf-8?B?R3BUQXhqSThPWkFkVGJNaDBUV2FJdVRveVJ3UTVWaGQ3dkI3SFh5bWZ0ZlZa?=
 =?utf-8?B?NWlxM0ZGTTdMU0pDZVZ4dlhrZW5pRTNmMWxxdHdPVm1FSnJ0cXVmcUV0dWdL?=
 =?utf-8?B?SXl0MFU4YWVSRDAyaXVoa1ZoQi9OM3pvRHhqNGd4KytWRlhzbDNkK3hlSzNv?=
 =?utf-8?B?YUdlL2Mvc0dZNUxQS2QxanBNeTBKVG1LY3RZLzhCV2V6ZjhOaGQ2em1PVTly?=
 =?utf-8?B?QVZ4cElSU01ITlVBSnJSYU05b2JDQlhjaVhhT3BEN21JS09lVlZ0cVZHS1F5?=
 =?utf-8?B?TC90dURpL0hxWjN1QTFoRlMxcnI2M3VodUhNN2pVb09YK2djNXI5ZGZzelpr?=
 =?utf-8?B?ay9CQUswbXgrUEdaOWx1NGtvbWFrckF6YWJJaUdoS0VNNWROdWJHVnJOa25n?=
 =?utf-8?B?eFhMNUJ1dHZYbFVRRkk5M2FKTzdtT2oyMDU2Wkh2TXlZc0R4dE1HYVpWZHhK?=
 =?utf-8?B?RGlDU0dUVkxGZTF1eVBQUUplaFpodDM4NFY3eHV4bzl1N2JwVnIrRUZId3BN?=
 =?utf-8?B?NnBTMXNPZ1l5Q1VNM3dSanNnWWRUb0hlRFg2ZytzNnpqdWdrK3V4U0tCdjR0?=
 =?utf-8?B?TVlkbHNaTjNEMlA1TjlmSldrRGluNUhjR09kUXpyODByam1OOGlSMUFqVnp6?=
 =?utf-8?B?YXkvMHh5cVFyYXFiR3M5ajBDR1hXUFVjVHM3WEpvT1RBY0U3T3ZjNmRQbWVC?=
 =?utf-8?B?MU96WVUyK0ZpUWZ4YlpxcjNtLzNwZ3RtSFJ5YWw3VlJZVE14bk1jN3I5TmpK?=
 =?utf-8?B?Zll3NU9rTisyN09URnZsVlg0ZjVIQkV2RzhjOGVRUVZKK3Nab1QrOVNZSEFR?=
 =?utf-8?B?U2xoUGcyR0ZlQlZJWTZoY2x4UEUzdW9LMTVWbGZsQVk2NWFSaGgzTE9NRjZj?=
 =?utf-8?B?RERJLzJWZElmRkIzbUxhWUh4NGJkTmpJWkFJeEFmeGhvSnB4dVUyaXRTQ1lZ?=
 =?utf-8?B?blBRVXluTnNlT0FqK3JWSXo4ZTAxay9IY0Z0bW8wTTk1eGg5KzNPd3A1Sm0w?=
 =?utf-8?B?ZFdnbE96cXN3WVVnUUNHeWRuWW1lbXJ5aVdtWWxrNys4cTkzc2JBQk5EaStI?=
 =?utf-8?B?RGN0ekhVRExYWGdWamU4bEd5SmJlc0ZRMDJLVXFMNnJGU2ZqTDVhRFNXSDJI?=
 =?utf-8?B?TXdxNzkwcGR0Y0RqYVZjUzdzR3A3ZzM5eEFvekVueHpzWGpkcGpjUXVUajlu?=
 =?utf-8?B?ajBlODlJMlFlNFRkdnA5U3lqOVBpdS94MmtSVVJxS2dxaEZVcEx3c0EzYlZI?=
 =?utf-8?B?bUNManFGdTYxcUNldFVaM09PZjdSVFdqNW4xa3lWaVI5Sm5lZ29nOXBvTE04?=
 =?utf-8?B?bCtYbTFOWmVkOTZCWUZ4RmhITzMwUUhNcmE1QzJRZ0lZNjJrdExnMHFBakJZ?=
 =?utf-8?B?YmxWMFlocmE5RklwN1Nrc1VFOVk5WVJhUjRXakFkZUFZaEZMQU9uamJ2WGVQ?=
 =?utf-8?B?RHE5TTJ4QzUyYmo4RysrcTE3c2VFK2Y3QnBvOGNURkN2VlNNWURFQmN6ZDlj?=
 =?utf-8?B?TXEydTBuTUFMUWRIdTVrVUtWdXJuVEV6YWo4djBCYWRTb3NWVCt0eXFoSmd0?=
 =?utf-8?B?SnNYQmhYclEvT1pmU2djNTdVRzhKV0hhOEZUSllSUTJaMDJVcFVYK0VCNWY5?=
 =?utf-8?B?bHZBejRYU1UzVlI2K1lkenBSdG1RS1R2bDVIVmN0RXpHNlZNbHorc0hScXlO?=
 =?utf-8?B?b3FYT0xnM2NjanZOV3F1c2xtNUdhY2h6aWR6TG5McWd0NmlTazV5RFIrS3Yy?=
 =?utf-8?B?UVBxdTBuaDVKMUZSRm5ha0J2a2xwc2tCaTdTTkhuTFo1NVRwUXcydGk4allw?=
 =?utf-8?B?cy9kblZ6TFpjbVFoREp0ZGQwc0dSM0FuSkpRVGkxVForbW5TRGlNbXNlWHpv?=
 =?utf-8?B?aC9ISzF5bjZGNnB2U3M0eUg5VDlZNXZYckg4MEczT1NyTmFKTlhXNS9UVFN4?=
 =?utf-8?Q?u0mwgX4LdIL0gzcM=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_96CBDE59-F6D9-4B04-952A-2204E57A8D34";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9239bf-bd14-4dd3-b6fe-08da5429893d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 08:30:59.8793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtLGuNCA5HGJBmbYtPk2M2AHTcUQEMnzciCekywae9GO8DVRVJREKlnArgRBHXbzBjigCNnpp9ACj7DiJstAzCOpZy64DjE1GrvM+BvibZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4914

--Apple-Mail=_96CBDE59-F6D9-4B04-952A-2204E57A8D34
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_75EF4269-EB0C-4811-AB8A-7C420775BBAD"


--Apple-Mail=_75EF4269-EB0C-4811-AB8A-7C420775BBAD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 21 Jun 2022, at 15:01, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 21/06/2022 14:48, Roger Pau Monn=C3=A9 wrote:
>> Hello,
>>=20
>> Last week we had a bit of an emergency when a web crawler started
>> indexing all our mercurial repositories on xenbits, as caused the =
load
>> on xenbits to go beyond what it can handle.
>>=20
>> As a temporary solution we decided to remove access to mercurial
>> repositories, but the contents there are AFAIK only for historical
>> repositories, so we might consider completely removing access to
>> mercurial repositories. This would however require migrating any
>> repository we care about to git.
>>=20
>> I would like an opinion from committers as well as the broad =
community
>> whether shutting down mercurial repositories and migrating whatever =
we
>> care about is appropriate. Otherwise we will need to implement some
>> throttling to mercurial accesses in order to avoid overloading
>> xenbits.
>=20
> IIRC, we'd mostly moved off hg onto git before moving to the Linux
> Foundation, where git became mandatory.  Hg hasn't been the primary =
dev
> tool for ages, and git has only got more ubiquitous in the meantime.
>=20
> I'd suggest keeping hgweb disabled for now and see if anyone =
complains.

+ 1

 -George

--Apple-Mail=_75EF4269-EB0C-4811-AB8A-7C420775BBAD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 21 Jun 2022, at 15:01, Andrew Cooper &lt;<a =
href=3D"mailto:Andrew.Cooper3@citrix.com" =
class=3D"">Andrew.Cooper3@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 21/06/2022 14:48, Roger Pau Monn=C3=A9 wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">Hello,<br class=3D""><br class=3D"">Last week we had a bit of =
an emergency when a web crawler started<br class=3D"">indexing all our =
mercurial repositories on xenbits, as caused the load<br class=3D"">on =
xenbits to go beyond what it can handle.<br class=3D""><br class=3D"">As =
a temporary solution we decided to remove access to mercurial<br =
class=3D"">repositories, but the contents there are AFAIK only for =
historical<br class=3D"">repositories, so we might consider completely =
removing access to<br class=3D"">mercurial repositories. This would =
however require migrating any<br class=3D"">repository we care about to =
git.<br class=3D""><br class=3D"">I would like an opinion from =
committers as well as the broad community<br class=3D"">whether shutting =
down mercurial repositories and migrating whatever we<br class=3D"">care =
about is appropriate. Otherwise we will need to implement some<br =
class=3D"">throttling to mercurial accesses in order to avoid =
overloading<br class=3D"">xenbits.<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">IIRC, we'd mostly moved off hg onto git before moving to the =
Linux</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Foundation, where git became mandatory.&nbsp; Hg hasn't been =
the primary dev</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">tool for ages, and git has only got more ubiquitous in the =
meantime.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I'd suggest keeping hgweb disabled for now and see if anyone =
complains.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>+ 1</div><div><br =
class=3D""></div><div>&nbsp;-George</div></body></html>=

--Apple-Mail=_75EF4269-EB0C-4811-AB8A-7C420775BBAD--

--Apple-Mail=_96CBDE59-F6D9-4B04-952A-2204E57A8D34
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKy00MACgkQshXHp8eE
G+3Gvgf9FZgxoKQMWPPxROv+xWT8XEoSUNz0LKowajjGSCTycBnud4vC7voc+hQg
iBaeB/RIgFsCJrvBd9ctzs8ugys34AGehc8Q8pwFCMcdOSb15OtPX44j83ayY6oX
q/6WILb5Lkbl2Ftcavchq6ZIz8w41nM55DH1QeGuS/7X2EJewHA+XxjjJsON2TLC
yt3a+lgeHIfjUvkPyZkBEOMwX5xGSaXGU7Myx3kXPd4uI1xrna3o6A/oDrbaSLD/
T2uyXPjqy96nLclMwpZw/YQdWw56PzKkFADsc+CShhvQFH6rizYKbOhrb9SrFozF
SJKyMpM3eND0IJGuf/IkdtKsx8yprw==
=xUyX
-----END PGP SIGNATURE-----

--Apple-Mail=_96CBDE59-F6D9-4B04-952A-2204E57A8D34--

