Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EF36C20E6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 20:08:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512090.791740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKrN-0002PW-Sg; Mon, 20 Mar 2023 19:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512090.791740; Mon, 20 Mar 2023 19:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKrN-0002Mj-PD; Mon, 20 Mar 2023 19:07:57 +0000
Received: by outflank-mailman (input) for mailman id 512090;
 Mon, 20 Mar 2023 19:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqGy=7M=citrix.com=prvs=436e66757=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peKrM-0002Md-At
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 19:07:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82d81390-c752-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 20:07:54 +0100 (CET)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Mar 2023 15:07:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5422.namprd03.prod.outlook.com (2603:10b6:a03:27b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 19:07:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 19:07:35 +0000
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
X-Inumbo-ID: 82d81390-c752-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679339274;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NWkE4U5R8b9rVxOOkuBEXz2iY0fCUUxNYMZ0IKqmnLk=;
  b=C6DF6pGCZHccpJZ+2lfrFsePSQX2SsXvz7J4KOfB6CH76SxRoOiWXUo4
   7LBTei7OTSjx3ND/giwSxC1miU9lCjOHNSs82HmsSwaLwXEa88thra9Zt
   7u8lAB1rzSoRTwKqcRdK1K2JWGrjJ69/NbUviWbATFQDbnY2lHeopPfbn
   w=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 104012571
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KhBzVqv5IFG6euQTeLeKx9ZjOOfnVN1fMUV32f8akzHdYApBsoF/q
 tZmKW/UbP2PYjShctxxbIXn9BsD6MXQz99gGwJt+Ck0EC8U+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJCpTbynYgfiM77eSac5jluEtFtbnBdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4C9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqqYz2gDMnwT/DjUGcVuUm8u+03W1Wu5hE
 GUM/DUotIstoRnDot7VGkfQTGS/lgAVX91KO+k78x3L0Le8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty8bniJE+iFTIVNkLOKyoitz4Hxngz
 jbMqzIx750IltIC3ai/+VHBghqvq4LPQwpz4R/YNkq55wZwf6a5ZIil71fK4PIGJ4GcJnGAp
 3EFmMmYqewLDI2XhQScSeMBEaHv/evtDdHHqVtmHp1k/DP0/XemJNlU+Gsnex0vNdsYczj0Z
 kOVoRlW+JJYIHqta+lwfp61DMMpi6PnELwJS8zpUzaHWbApHCfvwc2kTRT4M7zF+KT0rZwCB
 A==
IronPort-HdrOrdr: A9a23:OZJXI6jGBvAEh3lnn+vZS8YlTHBQX6l23DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwQJVpQRvnlaKdkrNhRotKPTOW8FdASbsJ0WKM+UyFJ8STzIBgPO
 JbAtFD4b7LfBNHZKTBkW6FOu8a5v+p2oGFr8W29QYqcegCUcgJhDuRSDzrdHGeLzM2ZqbRYa
 Dsg/av0ADQG0j/AP7bOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPof2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFchcsvy5zX8ISdOUmRcXee
 r30lcd1gNImjDsl1SO0FXQMs/boXQTAjHZuBqlaDDY0LbErXoBerd8bMRiA1Hkwntlhcp71q
 1T2WKfqt54MTPs9R6No+TgZlVSjUyzrmMlkekPy1plcaVbRoNwgOUkjQRo+LFpJlOi1Kk3VO
 NiEoXG6PNfYTqhHgDkl3gqz9q2UnspGBCaBkAEp8yOyjBT2Gt01k0C2aUk7wA9HT0GOuh5Ds
 n/Q9FVfYt1P7srRLM4AP1ETdq8C2TLTx6JOGWOIU7/HKVCP37WsZb47Lg8+envIfUzvdIPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5Trv2Ni+ITkwojqKb0oMiK9yeX+
 z2NINdAvflI2erEYFV3xfmU50XMnUaWN19gKdIZ7tPmLO5FmTHjJ2kTB+IHsuQLd8NYBKBPk
 c+
X-IronPort-AV: E=Sophos;i="5.98,276,1673931600"; 
   d="scan'208";a="104012571"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxeThuUmAGBV8swnvpIPJddL5PyrOpMYvpu84J5q0ii73Eiq6vK+KWQjMb7C5MzomG/SD4s4GvH4yxMF7AnQkkvEzPzqaK0ivQ9NLrI79u2aeCmHROYZ794yO5c3Ss5579GlgZqzNE9+FvPZyIDp77JpKY6cdP8ArixeOLNEZgOjT3JxcGKpekCRahcUjnp+06sSnbyE4y1DuS5AqPqis3nIniUYKfBw3Fr/te98N7UuASsebVmgssq3ZBDY3q0uKwzYZ7rxFwqpVqIEtcmUhfE2puDkikydVFZOicAqehAkQ72LSGhxQBGCCdUbgu6eTGDG2Ld0yXoOG3XTsf4wmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWkE4U5R8b9rVxOOkuBEXz2iY0fCUUxNYMZ0IKqmnLk=;
 b=ajF82OX6oDAA2koYZK9G0v0Oz8KYXmNNBXzWXo9scEe4N4Ymm/9KhtC7nAqAXR/bF5AgimLIIPKKNSVeyisFbZzCIvz+Coput3IagdKUHuqG9rPSIJduG67zMOkQ4kyaqzkvPY2/47fvY0wh71v+PD3G8ejFrWDsaX+W7Ffs2nU0Wp0e4lqB/KJGGatsUEzQit4zZralwrvqLda0lOifZVDWLuIUam0YteKfxqKorns6OMdQhDUrmv4ZPXrx7oTLmCkSbuf1tfhz0xh7JP1JNOehv6x/uUU8mX6Gd4F87q6n6pc7+FBftFOF82/QVhMZ2spSCLgMzvqHJ4g9lqAauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWkE4U5R8b9rVxOOkuBEXz2iY0fCUUxNYMZ0IKqmnLk=;
 b=Zf7beOgf0XXbTD37sr9Y1cZf+do+MFFUNwgdx+I4oi1Mk2d+UvWU5PgZOjrFjKOvd11Wryudm1+8qwLAsVmJpvlz7/Sp8dA3NMx/CQucn1Qx8r7Gi2LEfDP65Jyd3H+LEIcunIIW1VdObFboWj46ziTKv9ou3m1wYy/0qH4YVyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f2231607-b29c-b54b-874f-4e30ee84ae80@citrix.com>
Date: Mon, 20 Mar 2023 19:07:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: en-GB
To: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
In-Reply-To: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5422:EE_
X-MS-Office365-Filtering-Correlation-Id: 04139fca-af81-4f7d-9135-08db29765d1d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WZxrw9LedUWO58m3o/1G9c26oAWoIfOs6KPMvPx2zVkooitEQWtccSVbQ3cxhpZzkYgraZXKQ7YqJqHo2VGHNVJ1H5496+2QqzVenCENURusxWnTKArjE2bX8XIlVAScUg1ooufMTp5XS1ONSEtZk100HiGlcSiIKe7Te+8NWF/YfWXcrgZSS8+M/zUafv4eJLRX50dTC5BnUXnrskUUM/H5+VVxofgkATBr6S6au6xaNatGaOx5tZ/djNFw9cVgyrV80bVTRsrxe+YeK2MDzNsa53Tq8TnvXgBe6MpkjJE3KcVPAY+9u0Bi6PTMn0v2c4iEqFVV+03sfLyXN7dBq1NxVtjVNBs+pzk6aTZJInPgadp1XzEZUmrIsIjCk0TAILh4dCOE4e9zdLXwYq5av8fAOktfuQ2Occ1Pi5NSyEKKm2asCAP9iSWGS06layXAjOXWcbbKdQWGqvtSuJL994LUOJLIPZUI4lgwB+Z+8bdgZA23xerDZDErOE5pBR2Awpta0CUElnnMMx/WQ9vcdOfPQRqVNi6AvjnvMMDSElsepeA9x9SngvSmA1jpzkcLSDRIniK7cjASqfdOLhhV4tMnppJaCL6pO+gdmuKFMeThq3oUBm03jtLE76fJ/AQQoPVu8aDgB5luhSqHOg+TbgPnViTWH3QcgEeD9/U5v/mhqYjYzxCOT167lLaSqGTq8CmFA3TgLhYoxPHzfUdx3nGU6SESt/s7H6brobL2BnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199018)(86362001)(31696002)(38100700002)(82960400001)(6506007)(4326008)(36756003)(7416002)(5660300002)(2906002)(66476007)(66556008)(8936002)(66946007)(41300700001)(2616005)(186003)(83380400001)(316002)(6486002)(54906003)(478600001)(6512007)(6666004)(26005)(53546011)(31686004)(8676002)(66899018)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmlwOHVORzBaQ0VEQ0g2WDJia2p6TWpKaEN6WUtqTzFJM0FwVDlRRTFZeUhp?=
 =?utf-8?B?d09EZThrNEFhTlFSeUJqbnFQUGlBcEhKcGgwcVk5eFVLQkt2Vkh1bnpjbmVR?=
 =?utf-8?B?MGlBNXRhV1I3dnYvc0JZcGtJZjdEcTdxVkNrOEdSanRKSTNaSjVXYTJrdDBv?=
 =?utf-8?B?bW50eXk5bVYvYjlkUTVMaWhCaXZDVytPdGRuSi81c1kwcXJoVERvQURZV2lO?=
 =?utf-8?B?Q3BtVHlOL1JZTmZvZ295Y1hXZnZKWE4zYjNmVkRxS0g0clhqTENrQlJuSDhk?=
 =?utf-8?B?bWk1ZGRpWW50NDgwamEwckZuTTQwRFNnLzNpR1laQklBOWhWRGRyZkNobDlr?=
 =?utf-8?B?eEhub0hnMzFHRThwL2lNd3JIVUJTOEtLRHZ1bUgvdzVtaWxWV1lOVUl0UHlK?=
 =?utf-8?B?YnB3MUxnSTRYK0Q4dUNReGdkYjE1cTV0bEg2RlZvT3lvdTZtN0wzcUM3WHFi?=
 =?utf-8?B?dU0yU2lNSCt1N0FsbWlPTUhIYlZSTmhZTjArUm1iN2cyNy9oaW1zaE44dmRu?=
 =?utf-8?B?TWFxa1hJcENnYXo5cnZGY21vSHRWelF6QldzcERZVGFuUVA1TFhCSkJMZUsx?=
 =?utf-8?B?cTRJczVkRkIwUkV5Um5zdTArbHQvYWkrWW0zQUZ2V3ZuSDljVG9ZcjNUOS9R?=
 =?utf-8?B?VVF4WWcyY1RvWXBsa3pxcll6dzRrWVR3OFdLS1ZKYis5S0FnbFhGZDJZeXE0?=
 =?utf-8?B?Q1RhemFkbkhmdzI3Rm9NbEM5UGQzQkNMbWFZSlllbERNQ1FIcUF4SFBEMXdx?=
 =?utf-8?B?LzlGYlhDK1MzZ3EyRkRHQ3lCUFpxT05ibUo5eURMQlZkUzc2b09Vd0p6Zmha?=
 =?utf-8?B?OHIwS3ZkT1loaHdwdWxNMlhXNW5ycVpYMXZ4UXZaZXIxSE1IbUFzTVl1RGdE?=
 =?utf-8?B?endqb1pFbFNsamxiVENSblFZOHVWK3hXRWV4SEx5cUJrbnpDSzhLdVBuTWsr?=
 =?utf-8?B?eGd6NElRZGNMbzl6dzRMcCtUYVc5NUxvWWx3a0hWYkhBK2Z6RE9VWEJSdUFp?=
 =?utf-8?B?REgwUk04REY5Unhjbkx0OHpmUlViMlBsaWNFTXp2TlZUdVJNWWJvaUZOa2d4?=
 =?utf-8?B?RkNveVdFRHpZbTM3R2cyMVZ0U1UrUVlMMm9FT21sNVoza0VOWkhadUJwb3lJ?=
 =?utf-8?B?YStpSHlQL0NkODZWZnU2T0lOVWh2WmcyUGlxMmhrS1ZpSkRhSFdrdk94YjBm?=
 =?utf-8?B?K1ZnVHRxQmRlYlhZWFc0MFBDSXBKQ2JtYzN6cGNWckkzUjcvT1M4U1pXcUE1?=
 =?utf-8?B?TVFUdnQ3UEFqb0krSlVjU1l0dGdrZ1VUYjgvWW9kUnJLSXg1ZTFzNDZlUTd0?=
 =?utf-8?B?YjdVdXh5alBNL01iRm5rMExFajJKRThWZkM0c0FHWHNZdUpVb1lzaGVxQWVq?=
 =?utf-8?B?ZXk2UWhvc3kxMi8rTGdlaGdldFJmUFhwNEh3K1ppMnUrUldyellQQWo2NVV2?=
 =?utf-8?B?ejYrL0dvOTZ4dW0veFNXN1pOZGpheGM0SGt6VjJUMWJEVnA3aXZrWitWUldV?=
 =?utf-8?B?MVlRM1VkaUtxdVVUeVVZTWdHOTg0RE96dmROVjRDSmR3U05MSXhLTHI3eHV3?=
 =?utf-8?B?cmc1YTFZK05SK0ZTbnIyRE1wNHo2YmV5bmRGSWJ4Q3FheFN4MW5CcTZaRVh5?=
 =?utf-8?B?NGZqa3pWcnZlMFk1dU5SbHlLczZGWFE2bkVDeFkvY2xrRGs0djdOVGlHU2VT?=
 =?utf-8?B?cjlwVjRub3RlcW5UQTVHTVMxcDlxT3lobHJGOWhadXFqSFl0eW5yZ1pXQnk0?=
 =?utf-8?B?RTVTbzM1VFhGNzcrMUJmb05KclRrWTRybVVuSXhIYVkzT0dVZlRGbG1DQkQy?=
 =?utf-8?B?UzRpYWwzRkVjcUQzQnIvMUtaS1lwU3JXbnFiQk5xaVIyaXNULzBjU2l2ZTdk?=
 =?utf-8?B?SGhCYUZuZWN1UTQwV25wU1JqQU5GT2FVaFJ3K2QwMko4djFNdDU5cnhFNFc1?=
 =?utf-8?B?QklLQUJRZ2REb1MrUi9Tb3pmbHRYSExweUtzQ25ya3JvMDVia3QxVmdSZXNk?=
 =?utf-8?B?V3ZkVnlXWFpxdDZMOU4vTTZ5OGpsQTQwaE1oK2d1VitOa0RVZjM2cU5nMG16?=
 =?utf-8?B?M0lUbHNaTFdQaGhyNU1OSE5OSVRVSyt2aFRxYmpqSmFPSHh4b285T2M1Yjdy?=
 =?utf-8?B?RzVoQjRheFM4U2YxdWtCVWJwc2l0Uk5iZFJ4cWVWR1hHM3lSWmdta0lqdi94?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?M1ZxamZGUzVMdjNSWkdwZ0haaDllSzZVaDNyNkVrVGpOVkcyMWpjNlRuUzY4?=
 =?utf-8?B?eUxNaUFzWUdteitZb0QxYzIxT0xHMjZVeFVtak83eEJBYkh5emh6MTlCbEt6?=
 =?utf-8?B?aFNQaVZoN1FXa0FLQlY5K1ZJSnhYdnpvdGVyQW5qSGNVK1NtS3c0UzNpbjVE?=
 =?utf-8?B?YWZ4MDJGSURTODh2Mk9HeHp4eUxJWDVPdVdNMUpIblJxWng2bTRodWwvUVZp?=
 =?utf-8?B?V2Q5Zlhzb1hVdTEyWlFCSk9vVkdmZlBkRENlcmlLT0ZIbTFJeXpCSjZUTEZY?=
 =?utf-8?B?dXR2N0RXcGkyVGgrRVNyVG9VcSs0U2ppNXpEblJrUy9YbDhDd1dZUWFiUVVu?=
 =?utf-8?B?N0dwVDBYazJ4blZhSWcrWEx1Q3VSek8zWXhyVVBCWVhtRW9KYytRWVN2V1p6?=
 =?utf-8?B?NjZpSFM3RW5pSUx3WEUxZ3QwQXFWMzFLVEp1WFhSajFoaGttdHNybmlkeWVm?=
 =?utf-8?B?b3RyZUR6aCttaS9oL0dEVWpHUnFlK3VNUVVGNi8rU0xNc05CeUhXZU5tSkIy?=
 =?utf-8?B?NmlXNm9KUEVObjk4R3p2VEJkdGZpeHc4cDZ5WjU1ZURqc1JiRWhSRHFsbmRx?=
 =?utf-8?B?Q0wrOFVSMFdFZmRZMDRONXlvVkFTQXl2Y2hDZnA1R3BJbG9POGZ2UG8xdUt1?=
 =?utf-8?B?RG81dmhUbWZEc3hZR1VMNlhDeS94TzFybWV0a2o4ejBEMGZwL2FoTU5qN0Fm?=
 =?utf-8?B?YncrN1pIODd5NU5ON0c0aU11dE5YU0hVSUU0eGlFV2xsbjdiMXc1N1V4cy9v?=
 =?utf-8?B?Tk15WTAreXRhOTdpaHBxaTFNNFBtcVZieXlGN3hldm9YUjdNZmJnTTdnUlJ4?=
 =?utf-8?B?MEY1RjhzYzhxdWVaeHk0MXlVa29TZi9lZnNaMzV5OGhuclhpR3l0UStCdXk1?=
 =?utf-8?B?dUlwTlMxc3U0SzJyaW9WbzBMcTk0VmpRQjIxYmxvT2FKNG9Da09JL3Fsb0NH?=
 =?utf-8?B?Zm5mQWFRZURwZXltN0YrWnppVE1UWGJHT1c5TWRPc0lJaXlaUGJOLzgxUVdt?=
 =?utf-8?B?L2Q2dFdoUjhUUE5JVkprTmpsRmh1QVZMTDlvNlpQamtBb3YrZ2p6c2YwOHlK?=
 =?utf-8?B?ZTZMNExEbFdLbXBOa0lONFlJZzdldlpjS1Q0L1VkZkd3QkpGQU9CVEZ3Wm9P?=
 =?utf-8?B?dzE4UDFyTGd1RWJhRjJEczF0bmtETlZmUkh3OGNkTXhnemNWZkZDeDRBSDMy?=
 =?utf-8?B?dXhkYVppUlIzZ3lXNkdTYzZ1N2NaZFRCYmRYMTJWOW1lcWd1SVRDcDBhQ25z?=
 =?utf-8?Q?Y5V9UZ/d6PzHBIw?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04139fca-af81-4f7d-9135-08db29765d1d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 19:07:35.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZ0dgyfaOoDAxjYk3cUaZaJD++B01jBHTrnMYJmVVSFA/qEf/Q2z37qLfIxUihL4s0iaSPDBU3y/l7fCRhCdpHv50DfBydiIAJmjTtCgXTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5422

On 20/03/2023 4:32 pm, Ковалёв Сергей wrote:
> gva_to_gfn command used for fast address translation in LibVMI project.
> With such a command it is possible to perform address translation in
> single call instead of series of queries to get every page table.
>
> Thanks to Dmitry Isaykin for involvement.
>
> Signed-off-by: Sergey Kovalev <valor@list.ru>

I fully appreciate why you want this hypercall, and I've said several
times that libvmi wants something better than it has, but...

> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 2118fcad5d..0c9706ea0a 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1364,6 +1364,23 @@ long arch_do_domctl(
>              copyback = true;
>          break;
>
> +    case XEN_DOMCTL_gva_to_gfn:
> +    {
> +        uint64_t ga = domctl->u.gva_to_gfn.addr;
> +        uint64_t cr3 = domctl->u.gva_to_gfn.cr3;
> +        struct vcpu* v = d->vcpu[0];

... this isn't safe if you happen to issue this hypercall too early in a
domain's lifecycle.

If nothing else, you want to do a domain_vcpu() check and return -ENOENT
in the failure case.

More generally, issuing the hypercall under vcpu0 isn't necessarily
correct.  It is common for all vCPUs to have equivalent paging settings,
but e.g. Xen transiently disables CR4.CET and CR0.WP in order to make
self-modifying code changes.

Furthermore, the setting of CR4.{PAE,PSE} determines reserved bits, so
you can't even ignore the access rights and hope that the translation
works out correctly.

Ideally we'd have a pagewalk algorithm which didn't require taking a
vcpu, and instead just took a set of paging configuration, but it is all
chronically entangled right now.

I think, at a minimum, you need to take a vcpu_id as an input, but I
suspect to make this a usable API you want an altp2m view id too.

Also, I'm pretty sure this is only safe for a paused vCPU.  If the vCPU
isn't paused, then there's a TOCTOU race in the pagewalk code when
inspecting control registers.

> +        uint32_t pfec = PFEC_page_present;
> +        unsigned int page_order;
> +
> +        uint64_t gfn = paging_ga_to_gfn_cr3(v, cr3, ga, &pfec,
> &page_order);
> +        domctl->u.gva_to_gfn.addr = gfn;
> +        domctl->u.gva_to_gfn.page_order = page_order;

page_order is only not stack rubble if gfn is different to INVALID_GFN.

> +        if ( __copy_to_guest(u_domctl, domctl, 1) )
> +            ret = -EFAULT;

You want to restrict this to just the gva_to_gfn sub-portion.  No point
copying back more than necessary.

~Andrew

