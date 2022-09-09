Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A25B356F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404192.646559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbWa-00089Q-Fi; Fri, 09 Sep 2022 10:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404192.646559; Fri, 09 Sep 2022 10:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbWa-00086H-CR; Fri, 09 Sep 2022 10:46:16 +0000
Received: by outflank-mailman (input) for mailman id 404192;
 Fri, 09 Sep 2022 10:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u2oc=ZM=citrix.com=prvs=2449aa9c6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oWbWY-000869-Fp
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:46:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9adde0c6-302c-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 12:46:07 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Sep 2022 06:46:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5600.namprd03.prod.outlook.com (2603:10b6:a03:286::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Fri, 9 Sep
 2022 10:46:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.018; Fri, 9 Sep 2022
 10:46:07 +0000
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
X-Inumbo-ID: 9adde0c6-302c-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662720372;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DYrE1nb6fk5jHVLSg2xhtonnA9yBZYcqfJ8yFKNw9Ek=;
  b=aVyXOBXg8BM/LPQE9kFGGNLicyMGO4bjIdNGJ1w+q0G7XyUEWuHwjcTB
   iwbq3BUBuuFyMDLWE/quEBOWxXLWdLhkv0Q7BBjjW0cXfW8uxtAjAX1fR
   SizW+2IaRaAtOD7dOz4lQDsDzDd22lf0zdMRVt611Cdw9/cPtmaicBLlR
   g=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 80144265
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AtdSCgq2NPASeR9hTW/bDix16xQzdPnBdZeh5C?=
 =?us-ascii?q?dk8DyJ0RKdqp4UqVsiFrcC7hKRYaaMhCUtREvUMlFY3nif4BQ2kcNDFGsSon?=
 =?us-ascii?q?BV56PUIyOpaiRZF/w5qMoi8mrW/OcrKMANG6T6voiBBVaVMI/Jdi8sqsVoZd?=
 =?us-ascii?q?RYXi3TWQ/lyPxTTL0Zgwis53Ai24S/iucgzRmCBzS++g/F8PPYJ8o+6YR/qM?=
 =?us-ascii?q?HBbKleSOxlNATleXwvvFW5yzF6bJNi05YKGj0ZRS+9Uxxzy3Z7oQgX90s6u0?=
 =?us-ascii?q?yn4Na7uDn8kJSnu1bbiTKAWbagoSLSgFL7yyUMFgIj6wSuBDmJ9kplUJ50aF?=
 =?us-ascii?q?TUABfKuma6u5MqEP+4eslrZ7yMYpOx7znNEvAHZ44ZAGcXpasdulD0/MUS4N?=
 =?us-ascii?q?OufdKX0raxiRrgLrpHfZIfORoIqiz1T/WfpapQn+57mnWA1xhxZayG52JqaY?=
 =?us-ascii?q?crymTQfcSzIwnF5O+MymSWxjUm/77XLaKREX4hiwxPPxyBGnJT1Z+IBbskA6?=
 =?us-ascii?q?2kEr6q72cBb4wZkqoUnL1c72eGBCOdAk076b9xzJcsvIjbZpNPn18WOdjltu?=
 =?us-ascii?q?8SsEtCeyigLdkLNrzLJ4azRIb71b6N2AEiQbOQgGdjpHXroRRCg4OiWRSgZs?=
 =?us-ascii?q?FKvA425sYWrYAqXOlX7P0xNpa/yydBTNAmIUCd3HLBFMS5gV/vJPwdDA+SUj?=
 =?us-ascii?q?niFa+gLTDdQdOFUfnz4XWSuW7GsR98T82r6WuyG834It15Q9353I263EJHw1?=
 =?us-ascii?q?pCfUJIQ/bacYAAruGrsVwq8yVHpKEvA8GPN5kp6fyjCNzrHjqNRG7TwAbL4o?=
 =?us-ascii?q?ZsdHe53CFFC76o2DkdUeuXSDpyFpSlbechuVk09Yg7NRengMBG4QdSbqyYM8?=
 =?us-ascii?q?rpgbj0SU7dA6rFEsSRE1XmJM1KOKvZV3dZLjoHnW+CUXt30+UnArmZcMRoRj?=
 =?us-ascii?q?k13JckZjsdZIekfNyw/gDwJXc9I2jA0iz5R1PCnz2kXYdt5BHCrGKBFvlywH?=
 =?us-ascii?q?mKOeLaAe6QdzDiuZIS1dnUzAvNmwwbPCnMb0Zlpl8tuhkDy5Fh97/0HUtATf?=
 =?us-ascii?q?bMB6B0iIhVZhA7orux6gS5ydxcHPsSB8bx6fN8PSP7rx71G/eacuurvCV25X?=
 =?us-ascii?q?7GiwJB2VejmdXvjRcwPscq53JFSxyabzFBosT3SwoUc4t4slEnOHxZxnZmhW?=
 =?us-ascii?q?hepbBMv67U09H+Pia+/6N/Yxf00hpImuB4gwQYguVrEtIRYIjlSgP77YLj8X?=
 =?us-ascii?q?HYf8zMOXsmQxd8WXbmCLTZqDfwUcByy7lWP0lrh93jSSCnYv7S1OxO5S/leE?=
 =?us-ascii?q?n2aWV5nALW2m9AFyQQ+LDeWuOaLZjQyAdXm7fkDd0Nck0FzjOw/Nog+9hFFO?=
 =?us-ascii?q?7Ro6BhIJpL+KacEDP29L4DuGlq/jHI5eFLmY4vSH/HfUdFWcbzNx1DDOlCM4?=
 =?us-ascii?q?HhNsutU29kqH/QfKm5vhNQ3Zd8/eTtfodutc+bsbZHpihPbMmOm7FQSsyhTg?=
 =?us-ascii?q?QrwpV/OWECMi41f/8M2K035jQohM2oiL5DgYj2R35IV5MKaAl6qqvNg7zJZL?=
 =?us-ascii?q?bg1F7Q2/RqitYT+GetOrKIxq1oTGcDGENkINTz6Qw2uWTHpW+mhTO8HpugRc?=
 =?us-ascii?q?Uxw6CnxKGgM8H4gvcD1aqso4zhRRbyIcstcHx+zD5YzuF3kYI1bwY6lmW+vf?=
 =?us-ascii?q?P5WqN1WUFgXFyidhiL5cZeEeU9sHxyjQCE2wJFS0kiQDZI+RO5M4pfDKIwix?=
 =?us-ascii?q?7Egb2LqCV+LKPy0ji3J4wgBc85+jK/O23mq+5b5BTp0WwhaAQl2aymNsbRG6?=
 =?us-ascii?q?j+8Ggbhz75ZsbF4Y0lgAFV1EoHDdXyEwRtEItS1cAfKAALSqwjjVktn/zb6y?=
 =?us-ascii?q?pXT+kMzv+DeI1ZS6ddZU6nspLqqIWOMzOpdrAmpX9vEB6+jhAtWRYg2krQK0?=
 =?us-ascii?q?l6JxpoQdP/ooycuf/eY924SEXTrb5x5OFBWPacD0/4bIiOu4TcyAKDCBTE4V?=
 =?us-ascii?q?giQojX4fOPdIl4oqpMGKrF9b1VJz6B8XESpT/2oe5fa4vYlkmmqY+beTVC0L?=
 =?us-ascii?q?oIX4euubv6Q8SioQyX2z3KIAUQTYFYaZ9XTVR8XzeDottXObbp/E7Yku0JwV?=
 =?us-ascii?q?h1xal98LgtrHL4D8C4nMQyV3VtDtpl2JwRjW9wWI7PCRWahF65O4IIQb6O65?=
 =?us-ascii?q?n+ociMwL6ngzD8Xri8NJakGQREI4HkuuG4P2Xdat1FhN/xPhrigBHmFlg2NJ?=
 =?us-ascii?q?siLsNjzgzQL9U8SVx318aon6jmyhPh3vhl8ltstQw26jdl5FcMDG4yuj09aT?=
 =?us-ascii?q?++IuGkFW1VlQ559nwLOjgFnIkKq4VPghwAc4ff9yohybASWAQfsuTMTNdl8V?=
 =?us-ascii?q?L0xZYjmQx4fuURq5d4RF31+1kyu3RylBufTiuMZDlI4WaGt3FK+RL0cYcG/a?=
 =?us-ascii?q?gdnAUCpun5ffWJL+A9qIQgMEXgn6VDY8r+tweGwU8DwChD5RKFZtmJodlWlD?=
 =?us-ascii?q?xXy6XVTiMED+mwBYdDVj7UZTWOFOtdBeQ8Us/m5yT/wUwbEwDm9X3xWPWphL?=
 =?us-ascii?q?173mnNsPWpJoC09JWrGuLfpFI1MARl3z2/FjZf7JBk27w7vOOnmB6l3x3GD/?=
 =?us-ascii?q?R2oZI3kpyUtBenBwyqjN+wMj9gHLM+hTVqrcUi/ES8HlqpZhdO8EocFE0NR3?=
 =?us-ascii?q?+3z?=
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="80144265"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJCM/kIYBQkQDbgyUalGDwANuElqaQvPOq00RXUeS0VlkDcgLuCfL1Y9y0ll1uBQJb9B83aWL6csXP4ACx3aEp61hwAXwhFNXYAQxe5AIevBgqzTxpudo11c5fv8iT2td/yaXCD/1Y2WgcIAbYSIinHf5+ZSPJe0NOz/Rgl/GRCmQQBdxOkrldzMRhHzeb1c/UysjNo3zCx//3X/pr6XnacRfxxBekbMWIc+Da2veEYZYZaYIKRZEQJvRMgDHPjZZe6lwBXb6tchMMzutVFwUAk40nsdvQntX54VAneS6c6rIuf2TDPH+N7IU/qliQWK0/psjIpT9mLLjETseTopwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYrE1nb6fk5jHVLSg2xhtonnA9yBZYcqfJ8yFKNw9Ek=;
 b=Vxp7+Wsp2PsnkbTSt4YFcVQ93zqcoZKRSCtDQbJEx/XEn2KPx4mVF0kgV/wWLxnyZXT6RqfJCCnBU4cwKa6FsRZldcdGBe5B3Yl5Xt/cGEoaiIVvNVbrzWnVuyyOw+5lKUGiX6YiRNXGVbES9zQoqsVvGG2ai2vMef97yUFtWGfgcfKyy7/4DocQGTrwXFVN972zpSyqov0PqUgZE3RZzrjEWw5ad+1/eBL+o0cp+EmVBwtY9B2OQKJdIhcpI8ijIP0HiETs/ODOCD3SZsemZgP0wtnttHP3PG9mkPJ+HsoJI42yFOETshut2e5F0jUEQvoL0F9Z8uinVJyrlWXQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYrE1nb6fk5jHVLSg2xhtonnA9yBZYcqfJ8yFKNw9Ek=;
 b=LC1zXC/vH8ehTR0n4wieJ1VEv4JShGCXX/DllCmgnDvywufC2mW3RkSG1uoBamuOr4vkoAPf4xiifdt8nO4JIMJXCdkKuivosn5RMy7FHgxv+cTM0Rl1FujbmJ0T9cjHFewwQ2Uo7KExY9wgdM7L7BJK+ZR23bkLzSonL7IGcoo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2] xen/gnttab: fix gnttab_acquire_resource()
Thread-Topic: [PATCH v2] xen/gnttab: fix gnttab_acquire_resource()
Thread-Index: AQHYxDZS8Zh+WxIH60KiKJYdabVOnK3W6k6A
Date: Fri, 9 Sep 2022 10:46:07 +0000
Message-ID: <18808fb3-a3dd-59d1-0fd0-66215c039e68@citrix.com>
References: <20220909102413.2899-1-jgross@suse.com>
In-Reply-To: <20220909102413.2899-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bc0d9ac-a79f-444d-766d-08da92508055
x-ms-traffictypediagnostic: SJ0PR03MB5600:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 l3ushNNWfB3kPDspM0h7YC/JqI/79+nvwToycjxMZLmQunjV2IRuT0ELZcA2vlt7qePWZWkon8w7tGaoiSX1C/BFpMqR6icmNUV/fZlHtAGtiWOqtndvHN/yG0UMJZNBM0tOEtajY0C+EUGSzM8byXPGuuzoIpViUl/9yd7ZDHihciYcGYVowqu7MobIEGK0Uj9SC/BteHYZhdiW+3100kzrpgbOj0+ZLZpow/CLRvbHwa81A1VHMx/HQPSd5wSG6VZiXrKUBzYxjHHt30ngb9yAlSqFvplsCGxsArS5AMS10Lu++2L1qQKYhTAAlF1dr0KznNFUiu4o5Mo95EgBmuEq6sMGe1KQX+sWymlyeFtDRa7d4oT8ic84FUbQEYHrB6aZPFXmDhxiQEl/HvCX0qCVRciIkXXrX6uzg9eI9J+kUlQZf9i8xD5aS90JSYHs8krNszp/blJlmZM6sfEwKieEDFDs6xJGZAK6YAoLhlXqDIUI0jKzMF4xS32f4EpIxgZIpFeottdqV3ibGDBikx5yuQivfcMK69czeiX9Yjxl/2EuW8I268nnupkRoRF+iv+7TbWJaPRsxgvWufEnrcz60wa5oRC3wzMCvqlkJvz6tJKLGEwd5B2BOdZv2MYe/ru3m77XUtSTPqexg7jkgcIIDe/BTSp2rmC3Qoj3FWfyrqSjUh314z0S761q6mG0/PYxcXvCXQ1KOUXaZW9teCSHofo02RHAISg8abNdvPmKofXnUjEn+vR8C+26k/56YlgnPS3wEaYp9FNN2ZADANGMZ/OzcIX7I1KXmiRLjsuBLhCwGOO0OpiuxIIBW0pM56eHwhQM5euGZ/ddEfetHw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(38100700002)(36756003)(5660300002)(122000001)(2616005)(83380400001)(186003)(110136005)(316002)(8936002)(54906003)(2906002)(8676002)(31686004)(76116006)(66946007)(4326008)(91956017)(66446008)(64756008)(66556008)(66476007)(31696002)(86362001)(38070700005)(6506007)(53546011)(6512007)(26005)(71200400001)(82960400001)(41300700001)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmV2QTZkaU96SUp4Sm4vTEZ0MzhjRG16M0J6bzdBUGdQcE5oUGFjQmU2NHJ3?=
 =?utf-8?B?ekFMeFZQRVN3TUhhWVRKb2tVMzRCZUJGRXRxNElaaEZaV0J3b3dhS09Yc2VG?=
 =?utf-8?B?R2J4bXlBQ2ZXZ1VZdzlKdnp3WDU3akZVNHhPYitMd25hRTlnVDRERW9ORkNF?=
 =?utf-8?B?c3p6N25Iei90YVdITkk2R1R3bm5KNzZjS0RtbmkvN0hxZ0EvbDllUTFGN1B5?=
 =?utf-8?B?WUhvRDRWdWRLMHFOQllGRGV3OTM3S0wyckJzRmxRMnMvTDMzWGlMaXVkYXBM?=
 =?utf-8?B?MVdndVhUbTlFVktQMUErdHA1bXF1UDIrcm44V3FpTWFGOFhDdHZKSDYxa2xR?=
 =?utf-8?B?ZE00ZzRUZHRSWkVTbHNQbitWODdVRytUbE1zNVRoUHhjalIyOUhaaUZXVms1?=
 =?utf-8?B?RSsvRmdOdjcybFBzRWg0S2tsdEIrVmdlZEVqdndhYUZERDk3ZUtOczJTTCtZ?=
 =?utf-8?B?ZmlPdlZwb0grd3c3ZElhYjkzLzBiR2VJZUZydW1zc2xWejVDYllIMGx2ZnZV?=
 =?utf-8?B?cGxlazBmd3h1eS9SdEljbmhYZnViUjFXTEFUR0hxT2dTT3RjVUFqYTJweklS?=
 =?utf-8?B?NWhXMDVWOVNvekpiNS9lalF1TGl0cnR1ZGhYUEI4MnNMcWxnZnFXMkFtRWtR?=
 =?utf-8?B?TkdoQVlNcXYwQTluMW1oVUJ0emsvbTFDL0lqazE1UWxEeTR3N0lNQ3JINXJz?=
 =?utf-8?B?YjlxODdvUzN5cWd2Z0MwQk02bFMwVUpsQW1nZXV5ZytucTdPaUFiNTByVHF0?=
 =?utf-8?B?MHdub3FqVjdtbWIzM2pEVTVRT3dPT0VkbVJIQ2JpZ3NWOVRRQWxWcFk4dVJV?=
 =?utf-8?B?UGZkZkhNT3g5VWptdFpieUR3VmdNd3VsYjFCbXF1VWtVZFNKSGRhMUpEVGFW?=
 =?utf-8?B?djZMNnZWSE9ZYWN6cEhoUFR4aFlzc0c1MVZCMkN0NFV4K2l6elJNZjkweFZz?=
 =?utf-8?B?VjJnTXFSZEhsWUJULzM5Tkc4U1NteFdxTGo0TXZsSTkyOEpxaTZlZnNYa1VK?=
 =?utf-8?B?MTZOaG9MZUUzQzVDL2ExWE83SDZOaUE3RXRBa1RFUmZHdzlzMURlK1Vac2VU?=
 =?utf-8?B?cEFSWEErSWdGQ2lURmpmQjJKamFEeWd1NjZDUW1FMitWS2VlcFZWWVVIN0lr?=
 =?utf-8?B?cFBaemJOUnpHTk5QMDFJaTZHVDc2dTF2N29pSkhYMlNNbmZ3NldIRGZ0TUdO?=
 =?utf-8?B?ZUdEbHB5Vm5vU0pSeGQ2cXVEQXFnUjNUb21GZEJQRVFYTjJkaXVrdVd6TVVv?=
 =?utf-8?B?dzB0VGVwYmF3azBzZk5oV21YLzRZaEZrVEdjcE42bnRPaWdnLzdEVVJrdnlK?=
 =?utf-8?B?c2hQeFI5YmtJaktzdmtxZjNpMks1MElIZlE1QzlCckY2SjBOZGdWZlNHS3o5?=
 =?utf-8?B?cUNlcXlqeVZqa0FKNUE0UGI0RnlTbWh4SmtzTXFaOFZmNGd4WGxCc3JoT2hn?=
 =?utf-8?B?WkcyTGZyM3phSTE3Uzh6TElQdTJmQXZkSVBkQ2p6MU9uZ0EzUEtrSW5BWExG?=
 =?utf-8?B?OHR2ZHVpbWlhb2lYWEtHS21MWmd1bG9tMTFZSDVUT3hhZDNxcTJmNnZ3ZlJF?=
 =?utf-8?B?NVY3T2VSWDFITGNFVm1GWDZrL1NBcUZtUFhDdzhJS1FxUFhRWWJzRlpEMHhG?=
 =?utf-8?B?WVhCYXY2NTZCK2dUVmZxUy9hQU1tbHpTZVViUmRUNThLZTBmeDdLTGVZVnZ3?=
 =?utf-8?B?dHBsdFhEV3lMMW1pbmlERlU3aFZKQ1gwZzU2eFpyVksvaXVQeWY2QUI0MUlM?=
 =?utf-8?B?cGZwdHNob3dUWDdTdFlWWUd2UlhRK3dheGhCNUlyajRRYW5OODdtTHJ4Qi9Y?=
 =?utf-8?B?dU91ZUJVaGdVQUFzZVdhSjRyZHNQamU4UDJiZnk2OEhQWWF3RnF5alQxeStl?=
 =?utf-8?B?SXlZeDRPWGtzNnVUTjA1OFN4TE1yTjBVMi9LU0ZYdVc2MERlY253N2ljUlp6?=
 =?utf-8?B?MlZUeEQ4QUxmcGMxMVllNjBBQk8wYlpnQWpCbHVWQkkzM2cvYjhUcUtyd0tC?=
 =?utf-8?B?Tnp4RjR0bEFaemY4S3hwSmhjeXV3UWg4OHVzT1RqTThMdEhXQlhuRUI3a0FM?=
 =?utf-8?B?OWk1S1UvWEVtZitVL1daS2hlZzg3akEwUVV2bGZHYmtzbHY3N01aTlVuellv?=
 =?utf-8?Q?MWe1xekt3Hk1u2MM0iOfppoUu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87D94DD7C766064697EF973E0F175A8A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc0d9ac-a79f-444d-766d-08da92508055
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 10:46:07.4001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OeREiDa9ClUhcnsTaaTfYtsCvtbvgWnQP2HYGlad15bdSeyT5+Z5+LjTvXRPkMZAT1JUlziBaV6GfjwzNdLFkCgM/DNKcyJE/WPU/5ufRqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5600

T24gMDkvMDkvMjAyMiAxMToyNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQ29tbWl0IDlkYzQ2
Mzg2ZDg5ZCAoImdudHRhYjogd29yayBhcm91bmQgIm1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQi
DQo+IHdhcm5pbmciKSB3YXMgd3JvbmcsIGFzIHZhZGRycyBjYW4gbGVnaXRpbWF0ZWx5IGJlIE5V
TEwgaW4gY2FzZQ0KPiBYRU5NRU1fcmVzb3VyY2VfZ3JhbnRfdGFibGVfaWRfc3RhdHVzIHdhcyBz
cGVjaWZpZWQgZm9yIGEgZ3JhbnQgdGFibGUNCj4gdjEuIFRoaXMgd291bGQgcmVzdWx0IGluIGNy
YXNoZXMgaW4gZGVidWcgYnVpbGRzIGR1ZSB0bw0KPiBBU1NFUlRfVU5SRUFDSEFCTEUoKSB0cmln
Z2VyaW5nLg0KPg0KPiBDaGVjayB2YWRkcnMgb25seSB0byBiZSBOVUxMIGluIHRoZSByYyA9PSAw
IGNhc2UuDQo+DQo+IEZpeGVzOiA5ZGM0NjM4NmQ4OWQgKCJnbnR0YWI6IHdvcmsgYXJvdW5kICJt
YXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIiB3YXJuaW5nIikNCj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiBSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBX
YW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IC0tLQ0KPiBNaWdodCBiZSBjb25zaWRlcmVkIGZv
ciBiYWNrcG9ydGluZw0KDQpEZWZpbml0ZWx5IGZvciBiYWNrcG9ydC4NCg0KR2l2ZW4gdGhhdCB3
ZSBkbyBhY3R1YWxseSBoYXZlIGEgdW5pdChpc2gpIHRlc3QgY2FwYWJsZSBvZiB0cmlnZ2VyaW5n
DQp0aGlzLCBJIHdvdWxkIHJlcXVlc3QgdGhhdCB0b29scy90ZXN0cy9yZXNvdXJjZS90ZXN0LXJl
c291cmNlLmMgZ2V0cw0KZXh0ZW5kZWQgaW4gdGhlIHNhbWUgY29tbWl0LCBzbyB3ZSBrZWVwIG91
ciB0ZXN0aW5nIGluIHN5bmMgd2l0aCBvdXINCmJ1Z2ZpeGVzLg0KDQpJJ3ZlIGp1c3QgZ290IGFs
bCB0aGUgdGVzdHMgd29ya2luZyBpbiBYZW5SVCwgYW5kIG15IGNvbW1lbnQgYWJvdXQNCk9TU1Rl
c3QgZml4ZXMgZm9yIDQuMTcgb24gdGhlIGNvbW11bml0eSBjYWxsIHdhcyBmaXJzdCBhbmQgZm9y
ZW1vc3QNCmFib3V0IHdpcmluZyB1cCB0aGVzZSB0ZXN0cyB0b28uwqAgVGhleSdyZSB0cml2aWFs
IHJ1biAoZXZlbiBiZWZvcmUgdGhlDQp3b3JrIHRvIGdpdmUgdGhlbSBhIGNvbnNpc3RlbnQgaW50
ZXJmYWNlIC0gcHJvYmFibHkgNC4xOCBub3cpLCBzbw0KdGhlcmUncyBubyBleGN1c2UgZm9yIHRo
ZW0gbm90IHRvIHJ1bi4NCg0KSW4gdGhpcyBjYXNlLCB3ZSBjcmVhdGUgdGhlIFZNcyBzdHJpY3Rs
eSB3aXRoIGdudHRhYiB2MSwgc28gdGhlIHNpemUoKQ0KYW5kIG1hcCgpIGNhbGxzIHNob3VsZCBm
YWlsIHdpdGggLUVOT0RFViAob3IgcG9zc2libHkgMCBmb3Igc2l6ZSkuIGFuZA0Kbm90IHRyaWdn
ZXIgYW55IGFzc2VydGlvbnMgaW4gWGVuLg0KDQp+QW5kcmV3DQo=

