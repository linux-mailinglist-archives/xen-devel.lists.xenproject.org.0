Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351F58FAFB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384447.619828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5qN-0000AP-0l; Thu, 11 Aug 2022 10:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384447.619828; Thu, 11 Aug 2022 10:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5qM-00006Z-Tz; Thu, 11 Aug 2022 10:55:14 +0000
Received: by outflank-mailman (input) for mailman id 384447;
 Thu, 11 Aug 2022 10:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM5qL-00006T-0b
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:55:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11b2aee7-1964-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 12:55:11 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 06:55:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6053.namprd03.prod.outlook.com (2603:10b6:208:309::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 10:55:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 10:55:01 +0000
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
X-Inumbo-ID: 11b2aee7-1964-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660215311;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=qA1OM5V671uQG0WrwrXbO8oXyKnb501BwtHUunFlfbY=;
  b=JbW/25a0xgMF2702tkrz06voiu/ifSNJ3F8fJBR0NSqqcu5CeN7Yqaxw
   sZqhrnoipzzeVGV+RYAMjkJKwAFK5XET14X91sj5pepV1MYjbMIwXPK9b
   U0h3MMMr+iDnSujSCUGQez3kReRgqBR9xuynV+k/QxxXdQ6TbrRpzraMp
   U=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 77865050
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AwjBiCKASDd0tpxVWkefolJuSMR/EJr4LvTfN4?=
 =?us-ascii?q?r1ilRnhr7xRC69jY3YSWJQqes3zifLS3MVveC3q2iWO9FvJZzauSAdpsupFM?=
 =?us-ascii?q?kH4G/g6QPcjybTCHwmYmND3SIclPHveuen8oQ+C7qzsJPKv4fABuAtdU97SC?=
 =?us-ascii?q?kF805YGWqbckHAlckvWX+JzoqZsE3/6w0LagaxfN9ZULuQABUQD6JfX5t9rJ?=
 =?us-ascii?q?kP8HPyU79lT5Z6ChVoD1mqubhHm0Ivt9NDoiac3cL0sRa2noSxryuWxjsPfz?=
 =?us-ascii?q?06UWIB8LYeCe0RO6tnCsIDtsD2qYCMjSJGmkaNDyQ95nUa4+gDJ6d1wjejYu?=
 =?us-ascii?q?NrMUix18KJvk6YUn84HVKp7TSrloOPTjYO5eoGXwdOmPTcLkU7WwPbekaeSH?=
 =?us-ascii?q?t7aLaFhveB0B3qXyPbfPR2ZbSS8QmQq6TPbcmlxQkGQHihN1WCVZLLMs1wEr?=
 =?us-ascii?q?cUgQlsanmoANbSeZjK7K0wYc2NqW3fPrqFJXyldllOGsdBZeq+x6ANBDC+pT?=
 =?us-ascii?q?8qAhtzvz9rRVwZeGuLiFpLXbLbqsnALzu9I5IiHqlFNUBvMwbBC4F37aQKCk?=
 =?us-ascii?q?uRvc9iSmW5m1xMRcWx+90LP78rQqLV1m52FhvOKsWbknkqilLystout/JluG?=
 =?us-ascii?q?70baUrzmPfqYFdRY2Lzyf1yXutTZNuiupcTT5nbYAHG64S97kmelWyNFgR0q?=
 =?us-ascii?q?4WdUAwlz6IkHvIt/aeDZuNTSU36dAw2X6uK2pCP/niSUAFy/kDaHVqcYX1PC?=
 =?us-ascii?q?AvHDe/37bbMqKmru18Tktl85z6CBo3CHBpfG5LtZjubnwUEOsVuNYaxWMbUu?=
 =?us-ascii?q?i0UhjVOUSWpmzcgdEP1fK5+44sku/tq4I0honcK9ecjc+Fhqm6C3hvQfmH94?=
 =?us-ascii?q?j5AIKP1FFrsARArfFTkYfLh/io135/WzgOVytXpvSnFm9GjfQ3DpGPVUgoZh?=
 =?us-ascii?q?k2e4B83DrrR8AoHdYS7Ba1xqYet7Q8WYnVMmqK8g0ZoM775xnTkhA2vhbFLy?=
 =?us-ascii?q?vHzljZye+2gUFNZawAlP+an1tdHsTada+ZZxIZtiXHDNwEQw6m/XBwiNuUL8?=
 =?us-ascii?q?www/aHaOcK9SV++sHnIZx+QFiHEi3dH5uJ/XqFU8XmObM/ylxjMHqKLJKvku?=
 =?us-ascii?q?01l3GirjFWh8hRuqt1L/sF27mFcf93MGTYyJ/qSXSBurCf6fLqIXzxuy6KQn?=
 =?us-ascii?q?P3NdTWe0mnjeh97h7SGYCFuMWMg/s8JpYBtVTMXVBrzmFZJM8U9g7T10E8jp?=
 =?us-ascii?q?MhsGBFCL4ct10wPkfrE4eVUYkQ0RnOK6bv8kjtT1B5vZqgBL2ohobFb29qNg?=
 =?us-ascii?q?jxSO/WSY6qHkbwvy5n/P3JkvLOI7Oc8CuSeFidFuGnbfMXSnzbXIKA289l3V?=
 =?us-ascii?q?CXwmkFznu7CaE3y0ZdSc9sys1jScmfM3F0B/W598j8j4LYH45RxGKOOkEwN0?=
 =?us-ascii?q?CLf9QwG7MlD/u4XnGZEddPoa9eA+yrAog6lhJqDpPPg8GfKjIRXKzz6IYdLK?=
 =?us-ascii?q?Gqg4KvaoKYccNyCl+LoEy6v1Eh0eMyoN/5osFi9xbAf56QhcuYpjGSjmlKbw?=
 =?us-ascii?q?gmQRxLgRzP7iNO7AEMO9VcAmJJiYhh0NomWrJSIWAyAoFsrF93y0OThuLq+m?=
 =?us-ascii?q?3rT0AcKphjCHRCldCqNXnVJaa1qZDm4eeLaOv96NX8M9fPfFB/rwsr92KOlt?=
 =?us-ascii?q?++OQ98LLIOyl0V0aiuUgckqDXMSUw+R6IoDp8KMjZyiqg/zwmBe5Bz3u3b7r?=
 =?us-ascii?q?xsTyM7gkOzMuefBiLzZfo92LdB5Rn7uGRWKqFGeQRKyVrV5uV7ifO2SfWeOI?=
 =?us-ascii?q?9UV72+SBvZqapXVZ+YF9afedkeufOW1mYt06gM9kBrjECsP9M1HH8ghLqGHr?=
 =?us-ascii?q?gEaLo9skkJvOvppkzyliUlvhmqloNw+Fh79/h2KJKeT9apQMTiQ1iLLC3Kee?=
 =?us-ascii?q?p1yqF1tX472n1WvVRO6v8zKkJlXT032D41afj8lXzc9d42P3wjAskaY82/Ni?=
 =?us-ascii?q?nlOHCohs7jG7eOUzTDm5xeatCxCX4gtdNkpHluwKZZLrcljQxBDtq8JGGvMQ?=
 =?us-ascii?q?K9NSEK2+qtzrj+pMzNf4p50uXfDKbXHxFwIX5t2VC+CQL55emLNOuK24U6Pm?=
 =?us-ascii?q?UjJ6q+RD/VjDxqvC9XbB03TTXTorV0ewFBZWItJvCy9/LzIeTIqJWM37ARPj?=
 =?us-ascii?q?BZ+ja+caQ0uxXAZbAushHNkWBqKvvy4PQU1Mn+DQuWUkVkfT1Wf5BiFerRwd?=
 =?us-ascii?q?3zaQfQ=3D?=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77865050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZzmtIjEunYmhclQWwxlkCgZf/z31fp91fQYsA6kCqasKGZAivSBTbJUA8buS9NDO+hZQ4fmyK/cDhkvwolsnJ6EbdwhTRbJ1R8sbbyRIgm2Hu5yvvpLqQSFDyCnRuV3TZhVMT/uHOk9fsYWu8NEJ4n4KD1hGLkQ5px0vPI3bRUnragQ2/UyyvEQa55z0wg6xOxVfzZ61Qu3BrGy7iKQmnD3jwOJaVgBXdylo1V7Ln2c3v1kL3Nua3fTtcsEM2IQXqujc0kjLTC7BTOBBTaYdCMewfP91ro56vADY6bwoqwSJ5pTPmliEXlE7vxwHKMWhNL/xZUmfMHSZwiivjsI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA1OM5V671uQG0WrwrXbO8oXyKnb501BwtHUunFlfbY=;
 b=PlITsKu7xitkPpCLYk+a4boHLU/SYFfAv6zhWaICZTbP3sw9tJMlrT1H/uVs//fx8xBYximDfsBfYxag/axiHBzx/FogEwDPzhyDSrJqhMwLvYH32sbuR6c02sw0fK6ffaWhC2mkV5w+kYyVntHUJC/S7MXmsxjc1bHcX0W2zRnoV1Q3OpMEi0y9XNbTBzlULKTZH9WURadEBp9y3xuhsn7CVSZQXLgwv0DoQRvHXJ+6HeIi7ASa+23BLMP/pRTIrXrfrMFQWP8FYZlc/Quqj84SPSRhDEOP4A7HGdptwBLwZSJzTiIeQMMlz4667YV6HE8EJTV+Nez9gaZKNA0pTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA1OM5V671uQG0WrwrXbO8oXyKnb501BwtHUunFlfbY=;
 b=lCNLgwu9lKtU5WyYPeUGqZ9mi8zy11tBUt40hBFr2bJTM5MXbOOxmLtKzBAv73mbNFd/qorNgDRoA6ZQSbhL3aG/0JZGMNI6nACqB4l0F4YKLW0x7/DdzylfF+VtxZCrTeKwxVY0/gZPAYK2NzcWTE1YhJLMZpyybolsrMzxG0w=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/2] x86/spec-ctrl: Reduce HVM RSB overhead
Thread-Topic: [PATCH 0/2] x86/spec-ctrl: Reduce HVM RSB overhead
Thread-Index: AQHYrBGYD8msKpsBAEGG8Ts5UdCmda2piXiA
Date: Thu, 11 Aug 2022 10:55:01 +0000
Message-ID: <65cb8f97-9049-abb8-0fbb-80069da998f8@citrix.com>
References: <20220809170016.25148-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220809170016.25148-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60a558fb-b15d-4ce0-50b7-08da7b87f0ad
x-ms-traffictypediagnostic: BL1PR03MB6053:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6IWBLvGh5Cf+qg5f9uQACLOafn/ll/rStRSSjf3Cb95aBzyvZSl09OuZ8Pc1mavys0HXpXaqATn5Smc26iwG1MJiKn2j5a4kb+qHIymenget63noPx4aLAFujTdVHknS0c5AeYrdoSEM+QOc0pYDCzCaaGwfCbLeZUqDoqMfy5IGrH5pnbQCxn28kePpPio1SkNiOugQIyxhrZb3IPzO0dBPhn/83f/CdHQKjGzmY/nfgyL70A7f9IwoBWSqwg7qkBYLagy9JRrirq20Tf2w+RrXLXyDmkoTyMsU64PaKfjRrH5lqiPQePY1xiO5FD+8EDL1qU54eO73dLpmh29apTHMjnh7ATpL23WCU8GGjsr3MpnR9sd5Oh6yGVq4X7mkqrNDm3sFhZQhKJ/uK8h6rqBQ/oknUHD/hm1vPO1wdNEDajLZaQVzVbUh2Cz8WA0xCzU5JQQqrPzmj6/pFU2qXFUIDR3WWC/vm200XeLQYvLIjwoXVptQA+3J7sFf3gxQDkxV+qPNWERVIsipTd56XubZ9d2LTbDJJXbsXU/XR+pydOXRTCkaPPALb+7XtyO/CK82NlGZrpumFlFKbhVjvN2fDKsHgb60uqdo3fbZnCvgABi6m8RK3Mxf/j3ttNUHK53d08m1KA2KbcAOPlOERcO1N8POLVVY1QIBXCbkjSfh/yLgI4+zKSkfmVR4gRfIpuFnRiD+dQn/HAe/i0CpKM8XOUGPgpODkk4G+Yuw653EjUj8Y715tJdk2zLmAdocbRTPfw3lK9Z9qrruecEqbtjGmzWsTfr5i+6N/IX7IWwDJU8sezfrqV03+lIf0qgUieFaW3iqyAt/OF1qqQkQgiVFZyL5DpeMNxoxT1M5mMLMCrXt9e00afFKl/Ht+odH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(8936002)(5660300002)(4744005)(31696002)(26005)(86362001)(2906002)(2616005)(38070700005)(82960400001)(66476007)(122000001)(186003)(53546011)(41300700001)(6506007)(6512007)(71200400001)(478600001)(316002)(38100700002)(6916009)(8676002)(64756008)(91956017)(76116006)(66446008)(66556008)(6486002)(66946007)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OE9MVGZ2MUthRTZybVdwaWx2WUgyRHRKVTBNVTRIS29lYjBJYXVMS1ZNY09X?=
 =?utf-8?B?MDBDWC9CaTFtOUtFU1VHMGpFc2hBOGYraWViTlJDeHZ3THNZVkplV01VSWxp?=
 =?utf-8?B?ZzdGcFVQekVhNU1XNXZCM3dpN2R4Q3lEMHpSR3RHckhUcm00TGM4VjlDeTRB?=
 =?utf-8?B?VVJrR21PZElOYmw5aEtmcll5ZUM0UzBIbXdVYUlnVG00M2FwbjJLYXNhWWk3?=
 =?utf-8?B?VEhTYStGMEp0VjI2cHlNNXpiNFNBTlJkKzlrSFpxVDk3aUFzeWx4NXdEKzF4?=
 =?utf-8?B?bCtxRk5lcEJCSXlLZ0p0T3hWcTZUWUlmV201cW94NlBYZmRweFBEcThMZWU1?=
 =?utf-8?B?eE5MWWNCbXlmUjlYQUNKdWRpb3UwZEZiLzRYbDF5OW9jU1FTbGNXMlErMDhz?=
 =?utf-8?B?dGphQmdBSU1YYnhBcm1JcXB1dUVNeUJnS0ZESFp6ZnU0bzdCYVVOdTIyS2xH?=
 =?utf-8?B?NmJrbUFQTmFldE5rVUk0SnVjZEIyOHZ5NHlFRHc2QS9MUkpoL1FGQmxpZUE2?=
 =?utf-8?B?Mzh1dUQybXZmS0hrYWVPQmF4NGxEK0trYzNjN1RpTkNKTmtUVWNpSm5tRkQr?=
 =?utf-8?B?YlpJa1daRlJrREE5WFA1bjU0dzF5a0JLOHhXZExaMWFwZXBsbVN6T3BJV1FR?=
 =?utf-8?B?bmFVSk8vUnNLQVJxRFZBT1IxOGR1bnZYZ1d1QVdtUGs0cU8yM1NtaUtrK2pI?=
 =?utf-8?B?MjdlR1F4c2pSVnFTb2JQVjhtWGxlcDU2UmhOeHprWFJsdm9jMXR1cFU5MEM0?=
 =?utf-8?B?YVRXOGtaaUxEbEVHbnRaL3h6Q2NoaWczSlpGa0d6Q282Ti91bG9kVVdyVHd6?=
 =?utf-8?B?aXRCeXJMWnhtVWllNzBaMmxYcnU5bU03R0M3WG5SMlNsNEVOWUM0TmhWWUVk?=
 =?utf-8?B?dVAvQW9VWld5RnQ1QkhJbnZRa2p1aWt2aWRicDI5VnkxcldOU2E3UFoyRDZz?=
 =?utf-8?B?M2FuNzBQWUs5bmpOcDZxWFBRc0pmai9FVDZ0WlFvb0lPeTd3Y1dvbFNuOHp1?=
 =?utf-8?B?R1FxeVdvWUN5L3J2ayt5L1JtYmxBNTV0ZzRHQXMzbFQxeTQrb2FSanU5ODhj?=
 =?utf-8?B?eG9KZ1VCNnVYRko3dkJNYXk0Q2xlWFF0UHV6S3VMZUszbGMxSlNDanBURUNK?=
 =?utf-8?B?REp4a3BKNzBwVXU5UU8zZlNhY2lSSnp6OXI1TE5EK2dPckRBejVJSnRIcGEz?=
 =?utf-8?B?djU5NUxFL3hncjdjckl0VEN1MnFZUEF0WHk3OEFSbEhwaHcwM0VjbEdSSkZM?=
 =?utf-8?B?VTduUHdpTHBTM1pwVnlsMCs1TXc4OGJUcElBR1h5QkRLeW5BQlNFY0hWbDl0?=
 =?utf-8?B?Q05oMGhDdytEdGllRkZIVFM1WW40UDJyTFFNNUZIcVFqU0ZzOGtpQ0MyU3o0?=
 =?utf-8?B?OE1xL24xRXc5ZVVhWGtxT3RHN0Rkdk5GRW05OTgwUGFBMlNwdUU4WWlhSWRr?=
 =?utf-8?B?WEFZU1l5R2hnb2NIUlFkYTk4Uzd2K3FDK3RPK2lQVHd1VmNiQkJhVTZxZTB1?=
 =?utf-8?B?eXo4Z1Bzclh6NFdDeTJrVlpqdE1iQUtENlRadEdaZlJwQWtwQzgvVm5DWWQ4?=
 =?utf-8?B?cnVVWXRVNUZZL1FnUVJDSkQ5UEVYTE1EU1FhaXphWWZoN0ppRVhCZGsvZUVV?=
 =?utf-8?B?KzI1ZjhjaVdJbE10L1ZYRGIyQUUzbURJL25BQWVsY1hFUkdGS3dYNUI2NGhX?=
 =?utf-8?B?V05CZmxCeUJYai9XS1R3REYxcWNwWWNMNWFGM1p1Z3pmN2tjMXYwaWVMMnN2?=
 =?utf-8?B?QkZVcUF4NUpZYkdJK1dJVlJxZkVhSk5YQ1lkdjZFd1Jhb2tuOFA0V3hhN1k3?=
 =?utf-8?B?YXVMRFpKdWZXMWMyek9lYmRqV0U5TEkrQXo1ZWhoOGZHSUZBMWFFbkQ5Skwv?=
 =?utf-8?B?UEh0eXdkNlJvZXNteXp5L2tMMlNqb2h1cjhBVFB4Q3JEZzJLenVMcnBKWVFO?=
 =?utf-8?B?RmVTZ1ZBRjBTaXY1UU0vZTFRZHV3TzBLZTVwdFM4b2JpeDZCejg2ZllOZnRY?=
 =?utf-8?B?SVNweGNSKzFtOWc4cUp2ZnZnOE9NbE93MXlZVEhzenF2VU9ua1pzSERQSjlz?=
 =?utf-8?B?MnRlVVBkN2V0ZnZPZ3QvUVZaODlNelZIUjE0SHdHUHZ1czQ3ZUl2TkhYK21N?=
 =?utf-8?B?UWgyTi9aMXUxUHFYbG9maTdPR0duSzk2U3cydGZxeVVIeU12ZG1QWTZnTkZL?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EF937B404691343B077BFD07A93FCA5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gwOnghlG5o7MAlN7AycS8u0i1vyALhB4fFUrfqzHUF0lUrZlpearypmca+48BPHy1+uFY6w/8pJpcebb9U1iwMWFFCnuaSzZLe9EcfTOlxVO7wKrDfWyLdcrh90Y/OxUt1STR9Fo8qsgX9P3LE9KBoI/KcX8RbUxMztO//MQ/H5VoD27lpibbAE2AW6bR7eKc/6RGMM1V7tGhgBk5I+JPoXiwWU5CHUVuqIDEE+0WWxfVcwtczWsoxjKYxyFkeOee3O3Z+CN6I9nh0HCzBaeFnOTzpzDjUv41ZUopCkfvpJWeKbENwOtWxQsQ7fnXKo9BgIYhMw20aW/A7mqPQhVfZfolMHrClbtX5MYJE1esfv8wCY18+hdYdgd5o8aYybZ4co1fhEz8pF2q8avxjARuWWoQgAFz4sHG+Xz+DVQsuqC7sqDdVF3JAUnrI2kJuapLuEpwrGieeZGgx2+mnv3IJSgaXxH+fsp1Ufp5t/bpxiwv+GfLPMz9wUmgVLXC5xG1g5/9mQqk6fbOQwX4Y3Fft2v8cPyNo1EVSLsirRYJcaxbIM/rzCHYarmDs8eUIrTVbuAlGnjnGZ7kGQBA3exmxrBTDTpe2i7DnXMOaH8TEWEnn96ZTWEZNyWwEvD9cr5Uo7i6yBI8hoMqOrSOVTBkyB79ija1rThKe+4GSCH5hLFIMZspWuTR9CWQZk7djEfG/7E8pUttuiNaZ5VLp75ZMhEluSgfK9dRvWbmGxeZ+M=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a558fb-b15d-4ce0-50b7-08da7b87f0ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 10:55:01.4725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1GtWYf0QOMaMI+NG8oPnZeVGkiD8eHA5EW4Jfu+0KM/52C0pLl8bxE/0Iv6nzlQjh82Y/6ecIecC3SplxGiBbBz6E4JsE+lox8GeRS80/hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6053

T24gMDkvMDgvMjAyMiAxODowMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gWGVuIGhhcHBlbnMg
dG8gYmUgbm90IHZ1bG5lcmFibGUgdG8gUEJSU0IsIGJ1dCBpdCB0dXJucyBvdXQgd2UgY2FuIGlt
cHJvdmUgdGhlDQo+IHBlcmZvcm1hbmNlIG9uIGFsbCBlSUJSUyBzeXN0ZW1zLg0KPg0KPiBBbmRy
ZXcgQ29vcGVyICgyKToNCj4gICB4ODYvc3BlYy1jdHJsOiBFbnVtZXJhdGlvbiBmb3IgUEJSU0Jf
Tk8NCj4gICB4ODYvc3BlYy1jdHJsOiBSZWR1Y2UgSFZNIFJTQiBvdmVyaGVhZCB3aGVyZSBwb3Nz
aWJsZQ0KDQpOZXR3b3JrIHBlcmYgdGVzdGluZyBvbiBJY2VMYWtlIFNlcnZlciBzYXlzIHRoaXMg
dHVybnMgaW50byBhIDIlIGd1ZXN0DQpiYW5kd2lkdGggaW1wcm92ZW1lbnQuDQoNCn5BbmRyZXcN
Cg==

