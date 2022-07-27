Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4EF582727
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 14:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376182.608783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgZp-0001XI-Gy; Wed, 27 Jul 2022 12:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376182.608783; Wed, 27 Jul 2022 12:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgZp-0001U8-DP; Wed, 27 Jul 2022 12:55:49 +0000
Received: by outflank-mailman (input) for mailman id 376182;
 Wed, 27 Jul 2022 12:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGgZo-0001U2-8c
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 12:55:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3c5103-0dab-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 14:55:46 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 08:55:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 12:55:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 12:55:41 +0000
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
X-Inumbo-ID: 6d3c5103-0dab-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658926546;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IUQ5M5smgcllFfc/of3Q+QuHOk2V/Ps1SDY+rc2/hY4=;
  b=HiAB2FRvq8fPjXVmjlca6klDOM38OrQCUq8MM9jb2jrjISri4Xh0gGEn
   3IJcuw/tBWDvOpREQtYyvXUC6jrsW4uQ15dUP6Kz7LjYxPz0MTlsjkhH4
   sQ1S5o5zJws7XEvT7CdN74BW1XKbPaxOCCIzKK90jHB32QKjVcAEPP8lg
   M=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 76734291
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A3JJ66quS2V7sONfEzS7JbT892efnOphVZooaO?=
 =?us-ascii?q?cmfNp3fP2Tx3xfKXtTyy3cAL686JMBLl3fIf8uht7YhyIT8ddAa0UetcPLyd?=
 =?us-ascii?q?5SZthP1oYAdxS6PDh7GM+v6YcRK8mhOI+B+8rF3kifZbbvtOHXwUkoqN3E8p?=
 =?us-ascii?q?HRhna5bEA5rsnbDA6wAx7ibvsCowvUOJmgZdO7bpkPhKSxnm2riIQPK/hNDS?=
 =?us-ascii?q?2xHDxLE5g+sInlUp8gfPYYqQ2vri2c30ZLtIeJ3Sb2DpKjcfAmWWWGcCm16w?=
 =?us-ascii?q?5jnNcG8KYzdlA7o/wBd1SGEJHxnMOYIeM9ohBRDiFWrPSCDVbGpqHllu0/fi?=
 =?us-ascii?q?ezMhVJ9Rkq/e8WybtfpxuzXegXzkB2OeZKs27XOfnWCTaktEfcmQHG7oRunI?=
 =?us-ascii?q?6uF+y/qpBvD/+qcU0xtexx1IRJBoy1yuLb8H8C4RfHeyc1mFSNngsXj/4qE8?=
 =?us-ascii?q?P7jLO/tZpYQj74V/8QUueLEHdkyXqktx0zkQBi6qolzx9rByygAnt62QzUWt?=
 =?us-ascii?q?opeFJi3/pZTn5NT9Npaok73SBKP6mKq2hzhQwtsDNQWlSkHdRL4T+dqjOS8x?=
 =?us-ascii?q?G5Ve59QPpDFkfKtlVgvt3FF5miJV3qF6FSppWkPvWHvjjIA0aYOWt0qUJOBN?=
 =?us-ascii?q?3HMMcymsA7D7NfGke3tA8+1y+rF5gyqtrrBmCSJUdxjcLSkjL7a53vjcpmBN?=
 =?us-ascii?q?TYIfEg5Y9eORNslN4KCinXkfbnkbhezaTwDHu7cnpuZBnKjdi5/OFeBmaBe+?=
 =?us-ascii?q?cimi7pHn2aij1l396q23hY851W3z51gDtLG163R+3digXStOPgbDV+odcJaE?=
 =?us-ascii?q?fbwT5KrdNkBL2kyAlbIphhxCO1PdS9y9UPXnXP2P88M0fSyeeo30Tb0cx2FM?=
 =?us-ascii?q?m2c9eiQUh/BaNkMJYDsjiOzPL1kcDV65LV+gfMa5YqhS5tl4vlkA56ewxza8?=
 =?us-ascii?q?aW+n0VHcEwqz2IvzXwckQRMTjfSXUbdGrKmjcqVRwv4xHh5JsbFRA7UioYV6?=
 =?us-ascii?q?mWIgiII2QlD3HyBQSOA2dZIW9Zo7owo6+Il3GA3Y6yAvBJiDJhguByKIWiyX?=
 =?us-ascii?q?qMZ0moLlm5gz7FV/zEE/uRmtxMY0P9DpB+2mxGs/lpKoLU/rwWwlo/SB9B0Y?=
 =?us-ascii?q?34n8tRQY3U6hTmCokdIm7zc2U7FmSPYIVaev0h3lrOdsvBSqfT9NYuxk3UO5?=
 =?us-ascii?q?wes1cONZObE53cjXAq0d9JYNi5oat5BTbQCx6hSS8tqVtnaDjIpgW2/L5BJV?=
 =?us-ascii?q?KpFVMexDKmYzuxwzdRt9D4f07T7XPth2MxxyifvAlvTWpgbKg5+pOc4Hw2Yi?=
 =?us-ascii?q?5kgPURoGneV4nsMSJ3+423tuwaGZ9OJUNlUTlJYNANX1n/Uqz2egQTHO7Mrz?=
 =?us-ascii?q?F5HhzD1p++IAeNWySfHxb5JWAvbrBxLreQuBHMxZdXfUm5DwUZdLpzm6Ly8K?=
 =?us-ascii?q?VbiE4qNtEFIXcIUDJUO1e3UADoZVFB8dQVvJDaaITUytRguvu8kGaC0105N6?=
 =?us-ascii?q?2RBVyDmrkjkmga4jC1xDWfU+eoyTFFQEU0nmokEFsPFFRSIDDo4ds1wsixuJ?=
 =?us-ascii?q?7tyFY5bnMb+Z7WCnarL+OCuoCdRVR1qHs7/RBQnb4htmmEYnjfVKjaGS2726?=
 =?us-ascii?q?8JuIhDj64h3dbeg5vhd51ZC1YCjftT5lFSxtx6G5Tfr66xf2FV1Ufv2Zm2qZ?=
 =?us-ascii?q?KWY0XeYl8I2/5oryBDl4iLZzdxSYzhkWN73T5OgHzMQWkLVNIjUjurQ/XrjQ?=
 =?us-ascii?q?jfnGOJPwlya+MnTi5KgEGLqXfMPjFaWt/HG7lv+KNSivGeLplUjSPGChtHba?=
 =?us-ascii?q?ubJdI7pu5GWzeUVzFJ1QLU2MFqqaSuEMzseILN2Ht9jsMsU3V2s4b3vNRz1p?=
 =?us-ascii?q?vOcS425Fd0+GZXT0tF90S8/6/alGuiHHdqmug7zRzFvnibDN9snl9qmbU6dz?=
 =?us-ascii?q?FBP6B//ld8zbZNGXJkYGHQDQ58Vd1FZpiVHqMcYG6ERlXGRyT1q1m9SbrOrT?=
 =?us-ascii?q?k/WbuyGo/NzIXA1cTHYPSRk4tNFJTi2VmOzyEQ93bSmJK5wmOND6uftYrnYH?=
 =?us-ascii?q?59T76/VvgSnPjvATGaIenPrlFUga/TxTyzV5RB70OGKT2SpyLkT+zQkQN+/C?=
 =?us-ascii?q?Z/rFLzc9ii2QVItd4mkFI5f8gFYNZrMCVlIpQV6ToJuYgernkwE1G+BkhYjQ?=
 =?us-ascii?q?MDzawkmamp9l3N97Och7MOBJJCuIBtcM9PmW6wgq1t8SpUtB54nHnOCj0Nye?=
 =?us-ascii?q?7YQtIsh5zAVJPhKWE/JRxiEafzP0bQr+LcidQ5CaRi1po03KYW+oHhRSr1fo?=
 =?us-ascii?q?eBo28zOgKQairt0A4DDiP05rv7YeuskZ/QtDkzTsSzRpBP2f8y3czVvf49mu?=
 =?us-ascii?q?tHNJyAMoAqABx6olhSfqPbFHDeoxa+G5jAwmBsCdxbpCZz11ZNFcsFKfidf/?=
 =?us-ascii?q?CaJm6Ej1qhU93B3vfb8pXoV41g=3D?=
X-IronPort-AV: E=Sophos;i="5.93,195,1654574400"; 
   d="scan'208";a="76734291"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy8ZdEOvrzqwhYTSd8wwLWXMvhBbM52W7W1uTTSxsZ6zYBXqv9BfWMB76vwqaD01Xva3Bl0kCXrDMiTtSOgj5/u1M1RAwkjQf2PQYrAm0DP07zouxwLiQtt/nm9kjDfQlmOi9wTy27bDeO4oJAeUS1CA/33/+PLaM+xPNJAhKTCO2LmetVHwaRMPLCwY3Kb2bG2HNcpp1akYbR6vX/4CJPPMaZH2sACxEjgAWhZUXc3ycqO3rJ0s+37IJ0CMNSmmEMzYxRUxQxLNByOKmHfUOGcYfwH8G+0b64yoe3/QknNxS6U1Q/AETq1dEaoCcpe0U8Mrpl2ascTiF3INGQxW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUQ5M5smgcllFfc/of3Q+QuHOk2V/Ps1SDY+rc2/hY4=;
 b=Y0XBvWLStXMxCNUt/FNMC87dzkwbMRZSCxnfp7EPZeiODA5mnrDF0D0kwvasvoBoRc3LZ5NwsvyxQwwmxFO26QjIfDAeP//eRgXkQN8NAToBPMI82ROD15HDpucHdj2y+P/xCJCeNyCiki2MpQgI+BSqZxmzJ1dCfp1qANwl9ZSoE0gFc0yhf30mLu7TZ00zL4hOOsZhxHshYsCqVfPbLO2o0/GkM2Qm/0dwyd2WX0QvZutTi8V03WFVL9h9yyjRh0ukBrX1o4E6bacABGh2aGG1gYGI7utH5IfwHBbfGmRkMEvSHA7soTae+jSglLdXcvgSdbXPC8A/deAdx7bdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUQ5M5smgcllFfc/of3Q+QuHOk2V/Ps1SDY+rc2/hY4=;
 b=ndJu/bG5IVD0XdTCnKrtEDz+HYD9QZXWKaa5hu1ARTiCXLt2zPX+WKfc7RMMWDYes0pC4eKLgoo/mgCKU3c/0Enboiiu5fOqj+Aj302p/9EBjbsFBInITUXQYAdHQHWNpAELw6R6E4ZPHA2+HCVx1LGIElf60SGdodyqSX9iWs0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 4/8] x86/shadow: exclude HVM-only code from
 sh_remove_shadows() when !HVM
Thread-Topic: [PATCH 4/8] x86/shadow: exclude HVM-only code from
 sh_remove_shadows() when !HVM
Thread-Index: AQHYoQmDLSMXSfDjDUKeSEk6muWLxa2SLkUA
Date: Wed, 27 Jul 2022 12:55:41 +0000
Message-ID: <bcd7f7a5-82e3-ad01-c64c-40ae57260f33@citrix.com>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <75dd380e-5dab-8d19-b9da-b59188bc4997@suse.com>
In-Reply-To: <75dd380e-5dab-8d19-b9da-b59188bc4997@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26fa6380-b573-4d1c-2b49-08da6fcf4fa8
x-ms-traffictypediagnostic: SJ0PR03MB6423:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RRUSxCKgOvasyq+uTYU+Q53v+YzbYhAj8CmvgcfqqkQyv+i7PoOK4YSEi9P8Sr1RFixuHf14mfBeezHrdjsfvDXX+RqOIuxg+pNrv67a2qBcz8rz8iAuTXhn1/ITaWzS5n6GwSsUdclXv1Dl6Ec+HJmkOcFvWso+viwHnYsOUpBAIpztfwfcvfSuZ1wMOxCO0ZPmUtvGanfozozrN/qamrksEcSLQ8p1svY7FjJloMcqwHo+0UXW+lfWRbMT/z4ivqP8S/fTCqiFiFGsxITT3WgJGt5LSQamJ0vK/5wii7Tn8qzt0fhwDCi9Ldyx8hFv5tI75Assekxmf8RfjaaDETlGWfEP9Oh0Wt2R602Lp7SMGMdlJHwqNKrVEt8DOES/sg8AP9aXZ3fYXAyvCpHD/+wcosTdrb4YoPEvHSuJWKjSfjPvWjHFi0vdyyXpRU33A1lMfh0DhWDD99rffoVxs6aJy3T3EXvFc2cPij8VfKD8Y6NFoh0vZ2khgT6NlfI97Fhc00hlNaTbg9MLJzmmNp5AZ1Il2t2pQ9vggPDW4K4Qk4tnB1NRJXN52x9z6WdPEdA88Eb9T8nUvf8heeNkSqcWfutJDpYdFK4NlqjCY5PusE61Rclh3glydoBFjYpETHAJN7AH08sz3OaEHE5U9gNRv5nz3MMrkqE4dGWxKSOqa3+oDIJ4Xey5WFOvgJeWQcEKV9YZI6Nw5g1Wj1rQxUDX1xwsop0noldOZUBBuiqB/7Uzk47LZ+NHcbgWW2zGImY3A5YPS2ozkkVglzc2V6CUwoGREUxWf1TRLxErElRGfh8KWB2RdxQ1vcE5tsgtp5BeSUnGTph1ivobWF1oTlSnDA8Wy7p82qQQXEx31pGSuyWTl6lN46XxmEaIkQVf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(41300700001)(316002)(31686004)(38100700002)(66476007)(91956017)(76116006)(66556008)(186003)(66946007)(36756003)(8936002)(110136005)(5660300002)(66446008)(2906002)(2616005)(558084003)(82960400001)(54906003)(53546011)(6512007)(6506007)(478600001)(122000001)(31696002)(6486002)(4326008)(71200400001)(64756008)(38070700005)(86362001)(26005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjRLeGlhaHVKQmNyNW43RURWT2JLVE94cm0xL1RVV2p6N2FyNG5Mcy9FL0FX?=
 =?utf-8?B?czNaODN5MFhLZ1c5alo0d0hjVU1Sd1hwdW14NGNBNHBQWkV3RG92QU5PeTNI?=
 =?utf-8?B?SmhGaXUzYkt3Y3VQTGhwUWQ5UUF0OXNLb3NhY3dPcVpoYkYvRkJIQW4zWFd3?=
 =?utf-8?B?MG1qM1F0R0lBVWY3QWxDMEcwRGxvbGFRZEV6VjdIRkVUbHFhMVlWMStySmtC?=
 =?utf-8?B?czdUb0xuVExaRzl6ZHZvTzNBTE9aU1JKd0phKzlzQy9Ldk1veEZRL3YxRnl0?=
 =?utf-8?B?dHdnMXkzWFN5MDhNOW9INzh2ZWdvZnhxRzBRWVlxVkJIUDVWNkpEbXRaZDYy?=
 =?utf-8?B?S2hsMDh6YXl0NGp0dEJrNXBPQUlGdU84ck5TMEFPbmV2TlFwRzRQbEhqZUl0?=
 =?utf-8?B?YUpLMXpoQ2MyNVh1V0tUOTJQY3ZTekRrWlpGOXN6QXhpWDM1U01BYkQwWitU?=
 =?utf-8?B?KzQ5RjlwdWlQSlROWW4vaGkvV29ZWlZGMzJBSnl1MFJQM0RHSU41M1NRNnhs?=
 =?utf-8?B?Ylo3MjlUcGZZRDRNVnJQaWVSVU01MzlWNXNkMlNialBTTUc1Yjg5VWRBUml3?=
 =?utf-8?B?WC9LbTdJa1A5dXFDTUNsZXhia0lUcWN5UnV3MkpLTnRBMGpOMWxwdTRyOXlU?=
 =?utf-8?B?ejRoSkh3ZlJyenRJclFJQ2RXYXFSTEt0dVZGeTJ4MUlUR25DbUtUMzh3eit6?=
 =?utf-8?B?NnJSUU5wUk8zKzRONkJxWUFGSldoUDZDdU1tSVFSQzNPQ1lXQmEreUVHWTZu?=
 =?utf-8?B?Q3pEajQ0U0pGaC83WHV1UTMxUFkxVWFSbU85T3YyLzRZM2YxRE9xT3ZOSm9Z?=
 =?utf-8?B?WFVEcnhCdFkxOVkxem5KYnV1clhUczV4aDdSYnYrTFA2Vmo3Ri9nT1VvVnFY?=
 =?utf-8?B?cWx3SWZ3OU5jYVNCcldyZElRa0ZwNGlWdFk1L2VNRHh1NnE1QlJheE9MNHRx?=
 =?utf-8?B?bE1sNURSV2F4TCtDYzlXb0lGMzNuVUE2QjZHU2c5b3J4SlhCRTlSV2FhTGdv?=
 =?utf-8?B?bXhnY2FNNzNyUEFpMmhPWXFEZkdVNm1Wd3d3bVorVkIwNnJYYUhROSszVi9M?=
 =?utf-8?B?RURxa3lCU3VoVG5mUjBsbjdOS01JWkxEMFhMaUpyV3JKUnlkU3ZoUWN6UEkz?=
 =?utf-8?B?aC9ibGRtZEFMTFlNVXVkSmpIdmtiUkk4NStzTlJhMjVYampKK2c0SnlGSE9L?=
 =?utf-8?B?SGl1VWxLNDEvZ2V3TWppeTc1ZnFvbXM1NlcwQUVQR2gxTzdZWGJnNjh5OUR6?=
 =?utf-8?B?QmY1UmFCM1Y5SW05bkxURVY0UUZ6ZzIwTVJjQTl2Z0IwS3IzNVN6YVVUQTBo?=
 =?utf-8?B?WU1BVncrYWNPQ1NncU9NVWlQdjdRRi9INzdRbVRJTStWQno5ditxRGwwQnZG?=
 =?utf-8?B?bHZhd1I2RmRYeWV5ZnNjUFgrK3NLNEp1RmxsY2lnSk5ldTVCeGNtRzYyaXRo?=
 =?utf-8?B?Z2IrZTkzMk9OVERYQ3pXVUF3ZDlSeTFNNGs0TFNjQU9XcElnU2NMa2hFaFpI?=
 =?utf-8?B?alZhaVh1Q296cjBsOXo4aHE1R3JxUE12OG11OFBKUkN2cHJ6Ty90Vi96dkF6?=
 =?utf-8?B?a3RlVXdwWU5qc2lzZUQ1K0RFTU1rSlZTVTNqdEFQYm85VHJhZkhvSUlUM1Fu?=
 =?utf-8?B?TnMzbWZpclQrQy9yVk1ZeXZwQXhxclBvcGNkR3FSa2JiUGFJT242Yi9VTGFm?=
 =?utf-8?B?NUZOLzk1bTFwbkdScU9ZZUhnc1UwWUY3Nk5Ba1hCWTU4MDJ2Z3ZnaEhOTjlq?=
 =?utf-8?B?MUlZRUttQ2xzZVBrKzZtZUtFRFhNU1hlRGtmRlRQemxudERQOGUrOHRMZ3Fm?=
 =?utf-8?B?VTViZVZSckRmdHNCZDlmVXd3UkdRNHlvam5CUFlmNW1oZmZVRlBNdWtWS0ZY?=
 =?utf-8?B?MWc0ZVVkRUVUVmxrbVdDT1FmdUpyQW84M0xGODNvQ3JzMXdoUTBiU0w4Wi8r?=
 =?utf-8?B?Z3BEWWw4dzNLWVlQNG1Md1dYdVh2MGYzZTFjcjhJQnBwbFE4NGo5VzMwT1pJ?=
 =?utf-8?B?Vi82VGx0b3RuRldFVnNoKy8yQXhaYnJlOE9ZZ0VTenlPYno2T3dUWG9leng2?=
 =?utf-8?B?ajBRaE9naTFlcjBRZkwwL3FsQzFDYllsdlhLTlJqU3pGQWtBcnFYRE12RlpG?=
 =?utf-8?Q?CB95/IR9JWgKA+qewZMDjaMUZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5985A9DB981F984EAF6F5D3CDF60828B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fa6380-b573-4d1c-2b49-08da6fcf4fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 12:55:41.1524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TNRHnuWoAUwhL+jGBYeJmUd1FxVxkI695t8ac1hQoESEgHzWL6oto/Vw8zs6MnT3OC2Fql9AjICRuyWTDXRwrjKQzIIhkXSRq21YAoP9U+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6423

T24gMjYvMDcvMjAyMiAxNzowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEluIG15IChkZWJ1Zykg
YnVpbGQgdGhpcyBhbW91bnRzIHRvIHdlbGwgb3ZlciA1MDAgYnl0ZXMgb2YgZGVhZCBjb2RlLg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

