Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5B644163
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 11:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454598.712110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VP7-0005Uv-Dc; Tue, 06 Dec 2022 10:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454598.712110; Tue, 06 Dec 2022 10:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VP7-0005S0-A1; Tue, 06 Dec 2022 10:42:25 +0000
Received: by outflank-mailman (input) for mailman id 454598;
 Tue, 06 Dec 2022 10:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2VP6-0005Ru-1m
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 10:42:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8ffcef9-7552-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 11:42:22 +0100 (CET)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 05:42:19 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6982.namprd03.prod.outlook.com (2603:10b6:303:1a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 10:42:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 10:42:17 +0000
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
X-Inumbo-ID: a8ffcef9-7552-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670323341;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7Ie5RyXg0MEsKkind6zQitmYXBZLnudyyal6kmb51/I=;
  b=CmkdqZ/QszqyeQNV9ckYnjIT2y7Pbbz7MUcq61YnGwWbQZzSDuRo1F4D
   W76Ji9GPWhNpzJ7q/z+vFRW78xU0FFrwVKowPR/pLXEZf3ZSVlLqPunxO
   iGY7x+xz/PHoiaaHun+2r8RssCiaIa/FaNi80kA8EyB1lTUP40Cdkc+bb
   M=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 86806574
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2qYwg6NsRtB0GkDvrR1SlsFynXyQoLVcMsEvi/4bfWQNrUog1jZWz
 WNKUWrQaayPZzP9fd1+O461oxsCvMPRndNlHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5gJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uZWJGES7
 9EYFBBXY0qfwNyVxLi/SeY506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCOpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efw3OjBt9NSNVU8NY1jm2X3VJQNiErbl+3i8eEu3WbRY1Af
 hl8Fi0G6PJaGFaQZtXwWhyQoXiavwUdUd5dD+077g6WzqPepQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRu3MDIQJHUPZgcFSxUE+NjppIwvjhPJQc1nGaTzhdrwcRnyy
 T2XqCk1h50IkNUGka68+DjvnDaEtpXPCAkv6W3/QmOgxhN0YsiifYPA1LTAxfNJLYLcS0bbu
 nEBwpCa9LpXVczLkzGRSuIQGr3v/+yCLDDXnV9oGd8m6iip/HmgO4tX5VmSOXtUDyrNQhexC
 Ge7hO+bzMY70KeCBUOvX7+MNg==
IronPort-HdrOrdr: A9a23:5dmShaFcHjHubBmZpLqEP8eALOsnbusQ8zAXPiFKOGNom6mj/P
 xG88576faKskd1ZJhNo7+90dC7MBHhHMdOkPEs1NSZLXXbUQmTTL2KtrGSugEIcheWntK16Z
 0QEJSWY+edMbEVt6jHCNfSKbwdKOnrys2VbDblvhBQpZoBUdAH0+7TMHf+LqVLKTM2f6bQK/
 enl7F6TwTMQwVrUviG
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="86806574"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llxLmS4fjzOwP4Vc8ApXGKZtiyVcN4+zxeuve+Xo/GLl1+wupaTiZ8DKoBGWGIaElmKhJjNaSkkerxl2z2By8CFpYu79rg1qIrk6lYwRYKNc83DNwNWkyAhBIjjCdZNlfkAgffatjo23xLh83PxXR60pQIDN7l/QrRamyobPi6UKmzELT+c+MNovTn2C4riqNuoCxRbvNbwKYelJo4BWFrl6R8zgoJHaByixQG/8r2N8j8KmCCIPF49rZpMox8NYA+5YRVWrTWaiWQquCI4Qos1zX5dommtChcZLXJvVlbSCWK9W/BOAKkVf9PIA+UamGrRGTyQVO1r+3vMPL1tIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ie5RyXg0MEsKkind6zQitmYXBZLnudyyal6kmb51/I=;
 b=mzMeSGqLxfmi5KDxojMnSPqHW5sbF+IMI2NeI1Ix3iglVKnUzNds5UFUaiChJ3bn1QYQu8fIKytFElRScEwXtHu+Y9brQXGI+TiVL3ndekqCdLWlKQ6vk4+4alH1TvG3m6MdqejjcO+QQSKUWm9FrtxAb/zAu+Run0mbNbmVUKnTcyHWXvcbq43K3Fv7gtirfk0+TJ0AJ3UdOd9zgq5SowWF2q9LBAL1WlPDfVR4aJ5d5SLOvJBGiiLFDxUQArVrjvO7zf2P9THdFI5jwhNj3nFcWDZixEYhu/eA6zd2edE01uRHqn73Bvi0zmCdN3hirENS1wqLqw50mn8b7iyZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ie5RyXg0MEsKkind6zQitmYXBZLnudyyal6kmb51/I=;
 b=pKkLYmnfn9E5Ft8N4wvquRwZaLbBlKCWP5YvXTRUTtmyAiRUArNJTvggLO7ElJ4BptAK05Sm194Rd0qCcgWfeNEkhJbCAaA/dWMj/CdhOKe0dgWmMJCpRnFg/SmRd/7T4YzIUippjsyU7Xo3JaBSpEC2dYp+SP0wOOam8wv3FcY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 1/8] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Thread-Topic: [PATCH 1/8] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Thread-Index: AQHZCSwEQSYJzNne4E+4skvqTeJ6SK5grHgA
Date: Tue, 6 Dec 2022 10:42:16 +0000
Message-ID: <e66f8611-2df5-31b6-186a-d35ec555c605@citrix.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <c70f4c4584cf28ff1da8f56e08d61ad0c406a4fd.1670300446.git.demi@invisiblethingslab.com>
In-Reply-To:
 <c70f4c4584cf28ff1da8f56e08d61ad0c406a4fd.1670300446.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW5PR03MB6982:EE_
x-ms-office365-filtering-correlation-id: 2af0445d-fb0c-4962-6a6e-08dad7768b46
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GLqSfVJ0QL1bHWT0ZHiEHBHvARZuZbudBswNAhejdOcNxDhG3Ug/GX67mOI5heZ5ZSk24j57TAbwhpwUeNesFGYcZJfwmBc+9RqLXwvv51YPvleNwQDAfnjJ+eA84l939NpSGUUGmwP4ErZ2VkV9QoKPi1i0jhAb5qlPLGiuT0w41G6aJZAcDrUgMHfgSc50SJWbIvafE989tAMnR4sY/uDJHMcCZMjcFXTePRiVnd+GvO8oIiH6v7BPTsH1w8iqLkbJZ+NQYdgnAPJGN5cQMJGByzQQ+N/kKSFUyXo0zOdPvtsIZp+n7fPC5a7FySOFwa25Z1N57Iun7e7OtpQtbn6KmP+8ASQ2bp0c/+Jyouedrwdm2lm212lm68BNoSxLYIH5uUV7CYjF/tBURqCfX6EL9jCZJ0WcR781KH1f6WzwESml5r/vMHPM25jHAHbNK9/hQsar+x44j1CNyJaLb2MORwYlkMuxNO6ZnQuI9mKrD15MxaiNydxCUjcFYdGNExS+cvzXXedm8T0ruMfuro7PnGxgxC/N3RTPsYD1yqptcmG6zF7Yt/IMwwrq9B7eamyUH9Hi5n99dP3iEm1EkvA8kQLYLdWByP+hgKcDAuPGzqo8tPJeiQd9uM7VakSljxPeLg4sBg0N6EabBCV/v/uwoXjyYPc88MIbi0CLs+tmPWMXV63kpDLDo/ixZB77Dg6/MXstvJYkOSrOL78aDQP1Mz2yReJQLZ6Otny8aze+Xm8AAP1jTkToFOG0np/yt7ukAJdsZDiJBW8aLiEchQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(38070700005)(36756003)(26005)(31696002)(86362001)(6506007)(71200400001)(478600001)(6486002)(53546011)(66446008)(5660300002)(41300700001)(8676002)(6512007)(4326008)(8936002)(110136005)(2906002)(54906003)(64756008)(316002)(66946007)(66476007)(66556008)(76116006)(91956017)(83380400001)(38100700002)(186003)(122000001)(82960400001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFVYT3VkeC9UN3l6Wmdwc3B3cWkzM1UwM3RGTTgvSEluRExJTkUzRG03S3JN?=
 =?utf-8?B?Wm16eUdRazRnanNKOEVucit3eS9nTG9PRWlMTzhydkhRbmVmT1hkVjRDbkxG?=
 =?utf-8?B?THY0RmNCeHVmMHVoR2VFSDFrdnBiK0hLaUZJSzlyTWR6TjE0TEl6T01BbFMr?=
 =?utf-8?B?bUI1cjQ3djBVNlZacHlqSUVtM2g0WkVwdnRQeEt5VW5PL3pFYUxWZCt1ZFJE?=
 =?utf-8?B?dFFRT1QwenY5Y0piYStZVHlNV0w1TFRiR2xHanY3SEttOFdxdXdvQlFJTlBq?=
 =?utf-8?B?ZENzQ0N6S0JmVGYrYXNEa2JrZ0pDVUFuUGZFMVgzaC93MTg1TGp0SnpEdDlW?=
 =?utf-8?B?cmVQcFJzeWxQNHpBS3EzRVJzWk10VmlHUDhoRStYS2VZQnpBeEFKNnVaZ3pj?=
 =?utf-8?B?NzRETzhFSTBTTWFZdmMyKzRocVkyUFQwcGJHOEE5VmlEcm14ZXhBWThaeDJk?=
 =?utf-8?B?UjRwemdUVlZBSGRHN2pxaFhNWnB6VCtrVG1EdFdYWjFsbzFCQlpVTHNnYXh4?=
 =?utf-8?B?ellpZVc2QUZOYVpMVWpKbEs5VVVEcXRrcEtiNTNtZmhvRGpKM1NwT0xUWHdE?=
 =?utf-8?B?SHRUYVdqRzdpOEd4bUNqNElXMSt5ZTdkS0F5OUpYbTNGVVpIQXBBenVHbUVj?=
 =?utf-8?B?NFI1OFJiUXo0VzcyaG5meWhxR2RkYWZOWUpPTnhrWktRY291SkFYcER2ZzBm?=
 =?utf-8?B?V1F4aEwxK08xRytOdW81bEpVZDIvQXRFS3VsM0l2VWpPSXdacTR4dWRlYkNX?=
 =?utf-8?B?UFYwVHR1dEtMUXRNNnU1MzY5cGZINmd4cFJxNkFOR082aVV3aXpVbXcrMkU5?=
 =?utf-8?B?cmpCZkxHQ0FJOGFEZXU5NmJKRGVoZ041UjNUS2hSanhuQnROc2VNSFhXQWJz?=
 =?utf-8?B?eGRneVpBaDJXQktyWVUxamtjVzZlNVBVRzB3cGRGbmV1czF6ZGVTWjBxaS9x?=
 =?utf-8?B?WnFMemdDZ2VBWXIwKy9ScHFnQU5kNUxSclFtTVFibXlaT3hVNlp4RDNGWkh6?=
 =?utf-8?B?VlJWVGMyVHk2MUlFMFE5Wm9EZUVGQm1lWm1iVjRGamt2cSs1Y05teEZ4RERm?=
 =?utf-8?B?R21Famw0dTNqOU9lVDB5WjF0dHc3T01Vd1dLMEF4V09UcVZtVEhPU3VnNlRw?=
 =?utf-8?B?VnJNWSt0QTZ3R1VDMDJUWnJheVg2TEl3Vm1GVDU5eEl6Zis0bWwycklNT0Iv?=
 =?utf-8?B?bXZwdEhUVlhaREZaMms3UTROTXkxaTVkYW5va3JPV0tYRG5XV2FjVDVIcmdJ?=
 =?utf-8?B?UUtoc1Y3QS9DMnFmQ1pSdW5LakJPT1h3QWpyb2lvc3UySW5tTWM0MFRoYmc2?=
 =?utf-8?B?dTBoaE5uU0x6SmhGVmlzTXJiQVZtUks0dEUyc2ZUQlJWWU9jRUtIVHNoRElp?=
 =?utf-8?B?cTQ3K2o2d1QxVXRPU1FqZW0xQ2V4UDVRZjV1UXF4SXZqVG14cTRhM3NxTkdn?=
 =?utf-8?B?QWd1eVFkUDErMVZQUGZpVjJ1dlprdUp5YmpEdTdURytQRWlQa3JKb3RNOTEy?=
 =?utf-8?B?UzN3TjVBaUduRE8rNjExRXdwN0FUMjdad0NFZGRQaHlVd0h6cVlaRHZJVXBq?=
 =?utf-8?B?UjFOaU9SWkt4KzlseXNVV1d5UzlpM1pnME5kZEpnWU1aUVhtK2Zmb2l5TnZH?=
 =?utf-8?B?K29YSUFVamNVejhLTFNYQUxmV2VwejAxQ3N3K2VVbjRnMStkNVpUaDJGS1RF?=
 =?utf-8?B?bExRbUxEdHZDK0EycGgvaDlRRlUvWlU4Zm9rSnNidGM2Y2FJazdQZWxtQlFS?=
 =?utf-8?B?MnJPa3FiRURNNUNTV2U3dy9uQnNvMzV4RHc3WkkrTHlDeFhuSnd6N3pJdzBT?=
 =?utf-8?B?cTE0b001Q3N6d1BUNjVxZnpQaFh1YXBrUlkyZDNqcXlBTlo5dmtwYi9PbFhG?=
 =?utf-8?B?MnRyQkVuV3NBN05uV2pZK0k5UzZIQmZGaEhjbkpUZ3VqWmN1UnYyekk0UDVG?=
 =?utf-8?B?QzB0UUMrcnhWMnFtdU1jK3MwV3c3dXJ2empYTnB4TzllNXlJa21NMkNPcXlo?=
 =?utf-8?B?TUFCZ2g2VlltemNLZ3JhSkFTeElvQUY5enBUMHJ3TkpmY1NSV3RWU09IVk5C?=
 =?utf-8?B?Zkd5UERZYWh5T2JXVG14UFhmSkxMNnhsYnBkOXFHa1c3M2dWNXFiOVEzdnd3?=
 =?utf-8?Q?stkRaa7DoVNtyjlzzvoq5Hjyq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AF71790E9157C4DB81CB2ED5418DB1D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?dGlHYXdha1lSRWVyZGNKQmUzZkJsaDZuVXJuV1M4VldNdHFXWTlzVm1naVBp?=
 =?utf-8?B?a1oxaVptdnp4MG1JWVpVUUhoUjNXNDhLQUhGZlp5MCtJVFMzZnFiR1h4enNp?=
 =?utf-8?B?NmlvTWcwUjhEM3U4UHNEUnNQdHBTbSs4WWJXY3hxdnJrcHdhclA3ZnBLT3U5?=
 =?utf-8?B?RUdLaFI2bEdNajZicnR3Y2ZVV3BUODBSNjdoMTVIU09PWFZ0SlJZQXlpL2po?=
 =?utf-8?B?MGZMaW5ndkJ2TTFYMkpXYWZFeGxhclljdzBxZDNneTJMQi9KdFp0TENGTDRi?=
 =?utf-8?B?RWphS1JkZVdpWitHbHNjSHM5Q1hsbkxwajdrM2hGU3Rrc0w5UXNlcDU2OG5R?=
 =?utf-8?B?V0RMMUQ0ai9NVTZXbjMzbmhFa3dWbW5SVUN1czgyOWlGRVI0emd3RGxWU2xr?=
 =?utf-8?B?Y2Y0ZUhmOVYxam5mNjRIVXdXUndiczNCRXUyNGJFOEVRT2NkYjBSM3F1NHF3?=
 =?utf-8?B?WUY0NFVOa0k5UUtWcmZCRVVqZGppL1pCRkU1NmNGdjZSeWhUU1BQTGNydi9Z?=
 =?utf-8?B?cUR6MWxTbTBRT0d0WU5BVGdLRDkySTU0a3hiYlM4a24xRWdscHlGVzdkb1kv?=
 =?utf-8?B?VGM1ckdUdVpZY2pJZ2VsR1BoTXJrakxEbWdwM3RVZGFCeTVJdnpqSWFiTTZk?=
 =?utf-8?B?RmtqaC9VejNYbnBBQ2FMa1NZZnVOUERWN3Jmazc5dmd6cVVqT21JR0daNkY2?=
 =?utf-8?B?Qjd1eThVcjNqcy9scjV2Tm12YTRPMmNCTHVuU1V0ZHZtNGtyOEVsVHdzbEc3?=
 =?utf-8?B?TlVaU0Y4V2liaHZQaS8xYmNHYXU1c0xOejVaMkt4ZUkwY3cxWWhKRnowL1pW?=
 =?utf-8?B?dEM3MDYzOU9meFJoQklpcVRTUHR4V3Q1Ny9lNksrbmt0eVVQb2dNcjNTZWg2?=
 =?utf-8?B?NGhCekU2UDJSKzFZanpsaHBBNUhKbnpVOStyZFNzSW1keUZtd3Y2RlEyZTU4?=
 =?utf-8?B?eU1NaHNoK0NSaDJzTExRbzFWZHZuZkNCSEdUMkNNREdxWmhrYXdGcVBQR2RO?=
 =?utf-8?B?UWdXVXNYZ2ZIVjQrNlBmR2c4cVNmNUtEUUl0WXcvb215VnIzdTY0VThHeGNB?=
 =?utf-8?B?QkhESmlxMmp6T05kVW94TFB3Z1pGTVZuNUEyWDVhTWJhWlpYZ2JtUFpDMXcy?=
 =?utf-8?B?QzBHSWZCbUl4OENpa3RWSlBuL2UzYkVhdHlnOStyeXM5aDQ1MXNJaWtVSFBJ?=
 =?utf-8?B?NVNwZ1ZIQVphajJrOGwvMHB1MGk0T1Z5NFVjbHpINGlkYTErWXZqQU9aKy93?=
 =?utf-8?B?eXlwajkvUzJWT0NtUUhLR25CUENEcnY3dEpHSDZ2WXdBQzd0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af0445d-fb0c-4962-6a6e-08dad7768b46
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 10:42:16.8638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mV+boGADU8a+jlohJQ/+nMG59gTWNl6/CEEgDiAbauGpu8Fj6ob9EUZMF37Qx+nhcT21tRQUkVfqWkC1gK93kNZ6LYu8Tde1oNFsxkAFkQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6982

T24gMDYvMTIvMjAyMiAwNDozMywgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBUaGlzIHN0
aWxsIGhhcmQtY29kZXMgdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgdHdvIHNwYXJlIHZhbHVlcyBh
cmUNCj4gbWFwcGVkIHRvIFVDLiAgUmVtb3ZpbmcgdGhpcyBhc3N1bXB0aW9uIHdvdWxkIHJlcXVp
cmUgYSBtb3JlIGNvbXBsZXgNCj4gcGF0Y2guDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERlbWkgTWFy
aWUgT2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KDQpSZXZpZXdlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KPiAtLS0NCj4gIHhl
bi9hcmNoL3g4Ni9tbS5jIHwgMTEgKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQo+IGluZGV4IDc4YjE5NzJlNDE3MGNhY2NjYzlj
MzdjNmU2NGU3NmU2NmE3ZGE4N2YuLjVkMDUzOTljM2E4NDFiZjAzOTkxYTNiZWQ2M2RmOWE4MTVj
MWU4OTEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jDQo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS5jDQo+IEBAIC05NjEsMTMgKzk2MSwxMCBAQCBnZXRfcGFnZV9mcm9tX2wxZSgNCj4g
IA0KDQpBcyB5b3Ugbm90ZWQgdGhhdCB0aGlzIGRlc3BlcmF0ZWx5IG5lZWRzIGEgY29tbWVudCwg
aG93IGFib3V0DQoNCi8qIEZvcmNlIGNhY2hlYWJsZSBtZW10eXBlcyB0byBVQywgKi8NCg0KaGVy
ZT/CoCBDYW4gZml4IHVwIG9uIGNvbW1pdC4NCg0KfkFuZHJldw0KDQo+ICAgICAgICAgIHN3aXRj
aCAoIGwxZiAmIFBBR0VfQ0FDSEVfQVRUUlMgKQ0KPiAgICAgICAgICB7DQo+IC0gICAgICAgIGNh
c2UgMDogLyogV0IgKi8NCj4gLSAgICAgICAgICAgIGZsaXAgfD0gX1BBR0VfUFdUIHwgX1BBR0Vf
UENEOw0KPiAtICAgICAgICAgICAgYnJlYWs7DQo+IC0gICAgICAgIGNhc2UgX1BBR0VfUFdUOiAv
KiBXVCAqLw0KPiAtICAgICAgICBjYXNlIF9QQUdFX1BXVCB8IF9QQUdFX1BBVDogLyogV1AgKi8N
Cj4gLSAgICAgICAgICAgIGZsaXAgfD0gX1BBR0VfUENEIHwgKGwxZiAmIF9QQUdFX1BBVCk7DQo+
IC0gICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgY2FzZSBfUEFHRV9XQjoNCj4gKyAgICAg
ICAgY2FzZSBfUEFHRV9XVDoNCj4gKyAgICAgICAgY2FzZSBfUEFHRV9XUDoNCj4gKyAgICAgICAg
ICAgIGZsaXAgfD0gKGwxZiAmIFBBR0VfQ0FDSEVfQVRUUlMpIF4gX1BBR0VfVUM7DQo+ICAgICAg
ICAgIH0NCj4gIA0KPiAgICAgICAgICByZXR1cm4gZmxpcDsNCg0K

