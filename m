Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A34953A161
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340408.565439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwL6h-0001ua-GC; Wed, 01 Jun 2022 09:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340408.565439; Wed, 01 Jun 2022 09:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwL6h-0001s5-CD; Wed, 01 Jun 2022 09:57:39 +0000
Received: by outflank-mailman (input) for mailman id 340408;
 Wed, 01 Jun 2022 09:57:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=esiv=WI=citrix.com=prvs=1449ffc77=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nwL6g-0001rv-1c
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:57:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 428dfe09-e191-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 11:57:36 +0200 (CEST)
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 05:57:25 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BYAPR03MB3541.namprd03.prod.outlook.com (2603:10b6:a02:b0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 09:57:22 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308%4]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 09:57:21 +0000
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
X-Inumbo-ID: 428dfe09-e191-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654077456;
  h=from:to:subject:date:message-id:mime-version;
  bh=hYHYJDCc+jJ6qvBbW1U2L2EhfHpZp0F7uLQxr5TrF7Q=;
  b=a+hD9xtSAXXMqvsdYlwnSn1UamLUK1Lf1jvofljvNeNKUbK8EOMaGFS9
   ymYDWrWop5b8Uar2YKgxpDGekO50s9Qa0kEWWgiz5Uqr4qrlyHkuo6Q+u
   HXRgMDbFGCUe9SVN7G8dvQ4h+mHRuYoaksTgfqLkD+TYKxfrghU+Etk1K
   4=;
X-IronPort-RemoteIP: 104.47.58.174
X-IronPort-MID: 72454736
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
 YlhevautK8ZlN7ai1zkpqQ=
IronPort-HdrOrdr: A9a23:/amkI6hrXVzzTktKsCtGU5Vb2XBQXtgji2hC6mlwRA09TyX4ra
 6TdZEgvyMc5wx/ZJhNo6HkBECrewK6yXcN2/h0AV7AZmjbUQmTQL2KhLGKqwEIfReOldK1vp
 0QEZSWZuecMbErt63HCO7UKbYd/OU=
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="asc'?scan'208";a="72454736"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDj7gzlZQbt3pO+RMMMZZTqVybDHrcz4TVy0MRj3ViRaUj2wFnt1vVkRCv8L82GmFmz1Ob6KGTTTnsr7UbiBcsPACX6ia1xc3P9ZjDsVTjnhQb/F/IqyhPf+GfsFcwiwUDaTEQvKRGmNn1M8nAY5gWqqgnQcL20yeaCoC4PaNV282R8/a/TKs6rjrTH4VRNGpO/k7N2n5NOznDNm5FaWeTMSVcuCpDLFO4GVUREY75GglmWTUn7CXYL/P1voUBdtBCK83XFaba8xt7qoxsl9Ts6M8BfvOHPjTBSwVcPCc2D8fuucm7NGUWjDZ11WpNn9hrWHVGW/M67FZHq8uvFOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt+DLtKevXEzdmsa4iy8zf8tb0Q8cFwnfFjezxU2epY=;
 b=hVd/9zleg/Ozug8X4HVCcezl5sDnBGhFfimufZEyqBdMNVi/i1Ji8w8dTn3I3610Xmbv6eTxZEaiXbWtbH94CoBs4FUzkkIsYn9LwFsQYPieea1bLQoYz4xEuStwUjPdVkBJXTGNJz34UiNTIDkVD6IjzALu+dtRI+A//cH+etCmpFHJ5CMt3OPE81VfRcLPrQ5+Eb3onh4RNNkh5dwwy7m2ojbNmvh3EU7lpLYVi6FBcJ8FuLb2ybcRmeN7kLdYHKDceMQL7hRrxRrRUsuPXQkg8wDZgUPqY/XOHgHio/mgOKXZTUN+XEZaUEKgaS1EBYT8V3FjQ90X5fQggHkR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt+DLtKevXEzdmsa4iy8zf8tb0Q8cFwnfFjezxU2epY=;
 b=dibdPEIfwcovccMAcc8EUt17AR0CA7dWwml+vEd1oeSGg3146gdpqqj/dxqU7dkQMDBlQlr7+NH9x0rXPL33mDDbtUdGIlQbqRyKfuoFRKgJ1iy5a1BGGuT2LiyYnCCLnyysfmgIDwa1F4g5XA8g6bDCd4IbcccqUjxTBcuyLSY=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@arm.com>
Subject: MOVING COMMUNITY CALL Call for agenda items for 9 June Community Call
 @ 1500 UTC
Thread-Topic: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
Thread-Index: AQHYdZ38qt6Ww/ZR/UOW6AbWsKoU5w==
Date: Wed, 1 Jun 2022 09:57:21 +0000
Message-ID: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 919bf152-7f26-4990-ebba-08da43b51f12
x-ms-traffictypediagnostic: BYAPR03MB3541:EE_
x-microsoft-antispam-prvs:
 <BYAPR03MB35412F78E1387062B688BDA799DF9@BYAPR03MB3541.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QbFARXJvhhkLbP20/m+PF1Pfs/4QfpF6WvHP4qz8p4HJqMoO9V5N/USi3GWUZz8PRLYwy7xIUGBv5xIL9dbcfHNhI6FZ7iMfhFl/K8n8tHz/OrkwQnm+3t2o0IJB8BsMs52vnC+OPEqbM7f2SOB+EQvS/+bQw43ZRBR2wg1v+q/eQdB1JWmEgtCIpFeaZs8ts6nseBtRjye+ghOfbzebus7n7OMJkfskyozKKtlHAwGebgAmHcAmaDf9V9rZG2Nvt0GVkpk/eju1m/T1jR7lB6P8wFyBwo+17gc+52Tu0NqWi7IKY9YtrwjSS89XpwxPR/yj01Dh+doIUZxwb7rCP5Fd3Pygum6b7sav4Uy5H2a08eTCKHxoR+damzHuXODtN4PcL1s4WS8lH2CD9o4L6hOW5/Se/i5YxQp0PlVaH50W7GYwaJfBCqHJH1x2tJpHEt7D2tZyEOsSMWw0M2hhTn2EKQzqgFT7sFvSujPzQ+pvOmxtAtMLytD9sckBZaZN1SogFWDLkhrGaIF86WDZSSkeTWZ66Nj8PVg8ql3gglVGpjvX7boD/LTr8537Q0hYf+qb1aQqOaFe6UnhSJWGnpaKtHQrOcS0brGmwboMBzM4BeA5KWfg4v+QNzZIU5H5QMKzucvZy3mUakVNr/E8cOaVI0DxdjPhg4pBkIeabc+jlsyFDQT51FhAlO0mIb41Rq00lajFof9nsLVgopMOVFDBAi4gaYKYQh4FT+lWWHZ2H8pJ0iwajdZcsVIqMprGNXBda7XaaVB/2bTrB1MsW0vvREcK3LvO9MWhSxLiRhzu7gBtpr8uXArY1AYgrMVLqG5KQ+LafkR36ZRQw9srb7xeFn6cnquR8nRQm1SfGhiFnduRt7vNTiJ1xO0kKbUBQocjQyutojmPYCqrUabQkjBcroWoBnZAKuZUr5HfURE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(508600001)(7406005)(6486002)(7416002)(186003)(966005)(71200400001)(8936002)(6506007)(5660300002)(26005)(2616005)(2906002)(8676002)(33656002)(64756008)(66446008)(38070700005)(38100700002)(91956017)(66556008)(66946007)(66476007)(76116006)(921005)(83380400001)(122000001)(86362001)(316002)(82960400001)(99936003)(36756003)(110136005)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0kvR2RhZ2pwY1BGYTZzNjZ3c01QUWQxR0RhcFNlQ05zNG1IR2JGUTBiNTJy?=
 =?utf-8?B?bWNhUFBjbU92TTdReXkrbnNSOUJ6Kzg3VDlQY0YvT204eGtrU0NnK1l0OEZQ?=
 =?utf-8?B?K1EzUVJSOFQ0cnlzUVg1blUwcDB1eUE3THhBUThzKzZvVVI5L1VGcGc2Qy9n?=
 =?utf-8?B?ZUlKdjlQQU1hc2VjWWZFdHBlWlFaemZpVW5KV0ZPcWpQUVIzN215bnVFTW1Y?=
 =?utf-8?B?bVo3OGkyRk9xblFFU09nandZY1lGZUxFUmFWVmpTU05KK2Ftb01DNlRoMHV5?=
 =?utf-8?B?K3d3RE1NR3Y5NStiaURnRHphK1hGZWd6d3VRMmZ4bDBBMi9FV3h0NG1tcDlC?=
 =?utf-8?B?STU2WkYyTkxaeEp6a1FmM1NKaFVyWnUzMFdjNTlUejkybUMzQTJEVWljVWhU?=
 =?utf-8?B?ZDhMazF4WGxCbnlCZE5nMjduMjdSZERDRXpyWVVRekl2SVJwb1pqajdsSTdl?=
 =?utf-8?B?SFJLUmZyaTY1VGlob2ZlNHh2Z25ISmFuTEo0Y0JhMHJlME1UNVFtdHlEVzh1?=
 =?utf-8?B?M3gvSnFZa3kvbnE5QWFMRjMyQWpHcE1rY3ZoRHUvampDeGhOL1VNSDk2Kytm?=
 =?utf-8?B?QnlBZk9hS01aYWxTT09rK2ZBNUJRY0RHbnJNY0N4U0NJTStKYVRRK3VVeU9t?=
 =?utf-8?B?RGQxOTBJR2E5MzQ0TzU5Mm4zbE9LNzVoSlBTblFPM3hqOTVoODNlR29YRkNw?=
 =?utf-8?B?cVl5RDd1bnUzT3pkQnNQbVhycG5oTXRqSm5DK3RjQVl6VkZPNXUxWXovaGVC?=
 =?utf-8?B?WEZKdlE4UlNOSzY3VzdZSHBXSG9KWUd5WnB6cnh1b0xuS1M0WG44OEpHb1M3?=
 =?utf-8?B?Mnp3QVBJYlFyOWVjRDByck5kZFFheCtKYWlxZUNudms1bEtsTDVoS2c0RSt2?=
 =?utf-8?B?VzliRmRNUE9nWFhBdnpiZjZ3SVA0ZGFKSkE1RnlLaFFOditJeWhmZlZ2bzM2?=
 =?utf-8?B?djV5TU5adnpzVDlmdDdFT3l0ODNNN3ByeTNoVG5VU2EzelR4L0l1Z0ROV0Ew?=
 =?utf-8?B?K2ZISVdWeGNzS1hSajZ3S0lxK2Y2K0w0c1BybzhvbDdtQThRK28wT25janAw?=
 =?utf-8?B?T25hVS9ib2t5S2xXRy9aUUlVTnp6L2ZrSlVyb3RPazdjRDB4UEZtbURSYkRo?=
 =?utf-8?B?bTZ6ejhPbEtlU2lBUFpvNFNabjZvcDRKQ0NnRUtMcFc5cTdWb1lxdmNCSVhj?=
 =?utf-8?B?enRJdHJvT0lYNnBLRjlqUWVuZVczOVQ0S0I2K2oxaVB0SFJSNTd1VzBaN1g4?=
 =?utf-8?B?T2NjK2VweHJUNWZvNS8rWUF4YldLNEdqS1l4TU93N2VpOURkbDdJelJUNnps?=
 =?utf-8?B?UGJ0TDVydHVGekZpUWV6aWZtaElZbG9sYnBielU1enVIeWpCK3ZKWXZXaEIy?=
 =?utf-8?B?T1VwYzNKcUNmbENEYS9iN1oycTJ2ODdNZjVVczdhdXMxenFXd3lMRW04YTRh?=
 =?utf-8?B?cVh6akowbnJUMDN0aTFkVFhHWDl4dWt1ZEN1MHFSR2luaWJHR0R4L3NaMlB1?=
 =?utf-8?B?MDFEa09sSGh4NStUT1k0d2x6MlZEbTlreTRPYWJqOXBSRzFLTE9GR3lDRDEr?=
 =?utf-8?B?Z29MaXZGMmxOTVVDcmxSZGdwcUV2Z2Q3U0VuVHo1R29oZXEwNjFSSE1lcXFU?=
 =?utf-8?B?NU91QlFDSnI5S1VnUFZRTW5LcE91Tm00ZE4vSUMvbjRSMHphdmpOdWJ5Zmla?=
 =?utf-8?B?TkJTL3I3TS9DaFlUWXIxaUc0VzBqK0U2MnAwdGt3M3B2Qi9nTldKUVhTRzFj?=
 =?utf-8?B?SE9oNDFJcVBzUzJBL0hxcnduUTFnR0lVNXJjdVV6eHdNTmNXeFpVeWltWHRQ?=
 =?utf-8?B?K1F0UHZiSjRTYW1wNFBmdzJiY04ybldEbjlIUTg0SHlIVGtXMC9TaG9DQXpo?=
 =?utf-8?B?WnR3VnEzUW45VVlXeURWRDJITEhocm5vL3BaSnRhMGh6aWxEN2tMR1Rna1Qw?=
 =?utf-8?B?c3R0dUZ6amNVRU5pUnpVNVk3YlN0WnBJUTcrMW5PdUhwckZaTnNSUktkelFE?=
 =?utf-8?B?T1FzM3Z3eEVLMHlRbmd0eUxuUGpxT3piYmtybXJDNVU0RHJ3OTIyTkRCbit0?=
 =?utf-8?B?RmxDVkxNUmdITUQvQitieG5oc1A1bHd4UmczSEJIYmR1c25NVWlxaGF1NkRx?=
 =?utf-8?B?bUUwUUhnWTdDTm5ZVmY1Tng4a05xaUl4TWZyQ0FFR0JGN0dyTjlmMG9pY0tl?=
 =?utf-8?B?c3ZrK0MySEVSdzJyUTlNL2R2SmRRblhZL3dtR3NWM0ptOC9TQVZJUHNCODdo?=
 =?utf-8?B?REN1dm9mT3J0eko3a2tSQU5BcWRhUGpseGZjSHZZNjhUdkgwZStDb2taQjg4?=
 =?utf-8?B?Z296OVdzS29yWkM3QWExZTJtNHZ4NUY5bTFWYlJkalNGRnlmYzBOWUdTRlNV?=
 =?utf-8?Q?Swvz4xJnRhkB4K50=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C3089C04-88FB-4DAB-A9D6-74807E8441F7";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919bf152-7f26-4990-ebba-08da43b51f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:57:21.5040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRePYN27cRE6VU1+9lakfmnGNBqbu4efONb9Oe9LX7XEPs+UJASRj8O574+EaCt10GDiQIbmMk4S/FJ9nZL4jqfoWRTMPvRADjESFuk+wG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3541

--Apple-Mail=_C3089C04-88FB-4DAB-A9D6-74807E8441F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

Sorry for sending this out so late; my calendar was screwed up.  Due to =
it being a public holiday in the UK, I propose moving the monthly =
community call to NEXT THURSDAY, 9 June, same time.

The proposed agenda is in =
https://cryptpad.fr/pad/#/2/pad/edit/URCDNNBOVKsEK2grXf2l954a/ and you =
can edit to add items.  Alternatively, you can reply to this mail =
directly.

Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the pervious meeting otherwise, the call is on the =
1st Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a =
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the =
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate =
time to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the =
sign-up-sheet at =
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George



=3D=3D Dial-in Information =3D=3D
## Meeting time
15:00 - 16:00 UTC
Further International meeting times: =
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2022&mon=
th=3D06&day=3D9&hour=3D15&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall

--Apple-Mail=_C3089C04-88FB-4DAB-A9D6-74807E8441F7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKXOAAACgkQshXHp8eE
G+1h4QgAv6//RWfhmVRGJzCWeJA8deQ+FPGXjkmKVh8dnUZYPrCPTJE9oNDnnzd/
FT1FWShaDhp2TtdkJZKjxHZWnZJFuQ8JzCj83JUqXPwRVULDo6atrx3GlpBvsN6C
CWTVvvhYT2khmBgM5z4pVqrE2S+IBFy5TRL2nvXvTH75cjmDmlw5ysp2SIXLyLli
ANixAhM2qJT9Gj6kZS+12AgSbd6fC4bB2ZQvFPVVVqUXeF8QkM9Fi8jjWvZ3ESiY
H8/kZR4wYVKJsMQR8TtXe5JyIsIeDpXF825uOYZ3sD3TpUvay79aKj1IcI8loeHc
Bgr/aroyeHrddH6yhBSoE+pGleVYSQ==
=VO+B
-----END PGP SIGNATURE-----

--Apple-Mail=_C3089C04-88FB-4DAB-A9D6-74807E8441F7--

