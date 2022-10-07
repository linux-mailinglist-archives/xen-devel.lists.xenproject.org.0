Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF55F7E62
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 22:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418262.663030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogtWD-0005KQ-Og; Fri, 07 Oct 2022 20:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418262.663030; Fri, 07 Oct 2022 20:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogtWD-0005IP-Lc; Fri, 07 Oct 2022 20:00:25 +0000
Received: by outflank-mailman (input) for mailman id 418262;
 Fri, 07 Oct 2022 20:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW8X=2I=citrix.com=prvs=2723e59b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ogtWC-0005IH-CV
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 20:00:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acb45b84-467a-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 22:00:23 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Oct 2022 16:00:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6996.namprd03.prod.outlook.com (2603:10b6:510:15c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 20:00:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 20:00:18 +0000
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
X-Inumbo-ID: acb45b84-467a-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665172822;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pwdDaWVuzpSISfnq0sYokkblNP91vPNR32uGTzRmxsY=;
  b=Y/sgjnu7avYxM/o5U7y+lXQkDLhpeicCfzJ4jbwosDjQ2pBy5aLmbiv/
   N07yQvilL2KF58C0MovoJQBhadsQ+MrKSbR6Xs3V7GWqaYXz+MLyeT72O
   uPyvkzEglx9lZ94DK/IXzNSe6crGw8HmzRrJB4qnXGRXq+KdUZN5cUjwx
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 82659683
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F099j6B4CqA76BVW/+fiw5YqxClBgxIJ4kV8jS/XYbTApGwk1jYEx
 jcaDWmDOK6PYDekfowjPY7ioR8BusKGxt5gQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25Kyt4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kfEow4wehlGloTy
 vEGcihTciKet6WflefTpulE3qzPLeHNFaZG4zRK62GcCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAI7gvL9cLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+toijy276RzXiTtIQ6BuP/ptFJqXav2UMYMDELaEeYnsnooxvrMz5YA
 wlOksY0loAw/UqnVMjgXDW3pXeFulgXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBDjx1saaJTmqd+63SsnW5PSEPLkcNYCYFSU0O5NyLiKE+iAjeCOlqFqGdh8fwXzr3x
 li3QDMWgrwSiYsB0fW99FWe2ja0/MGXHkgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:vH6BS6wBDUhabx8aK9IfKrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGLf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.95,167,1661832000"; 
   d="scan'208";a="82659683"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDgYrzF03HZJhnt6feLmSxodWZOMgBuW9The1VsaIXIVJ8tAvzOWfHVe3QNSqrZHFvqeuc0y+BzQ7vcQ2oNI/Qaw2cbxyXlaZzDrvcYg7XlxnaU7GSmW+Sg79PLHufSo4i8RVBz1Wm/qhnUeBYTEzlrCiYQSDw5QpHJN1XqiwnIs550FJGuI/uTSKsstsykf4BG25K3Y1gM5khM1TXgguvlirHaKI27z+lS30+H9X8jhxnpLHRq2+S8IfyF8ScxT0sKtPQnj0tG2R13BYPk7U4K7QCZ5w22Rd5opuKDYq6LaYyI3bWRyqCNtK/HTF+2A3NXFt/OG/4ibiMXujHUX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwdDaWVuzpSISfnq0sYokkblNP91vPNR32uGTzRmxsY=;
 b=MwQgMIYcBH8FxgnSq21irwWP0dzxzAnKgQBlbs0t5iYqD6xj1BKE+F0nH9wx3FborKthS+ShGbsF7qG0YRHg6jNfgtkzmiQUX7nFq9MYkqfgvcoyOtY7j3cKgvkiSvMVABp/Vh859f/ARmlfhwNf8cVVUpHcgy8IlHN3O7P5+TYUNmAcCsVp4FggEzRuQi28W3S+YdK42GN5WXGBBE74WaKzkqJyoxjhf7MPafHKTShtnNv0qqVcTVtOh0cYPa9U2qNLlwvXt0BOMvytuIglGE58gVX1IrtrWubguZXtAfruXtTANlm1EjTwJdGWZXsoa0/1xqs3knkC9dazJcpEiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwdDaWVuzpSISfnq0sYokkblNP91vPNR32uGTzRmxsY=;
 b=wP29ek8Y+8ith6BE6qlP3guQM0vTFNecX3o1rvEo9pESOieIhqtxC/mT33+J9vgiiiU6e35NyHdZOEixryiDdczhOPVh5XnglWP8x3m+jLIhuYWAfTeu2QLwFW8ZrzDj5CvUXmmYDngPhh84kBgD259SdhlUMKVlvUqER1fWGzs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christopher Clark <christopher.w.clark@gmail.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Thread-Topic: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Thread-Index: AQHY2oN8A4y+jZE/1ESf3tQREpmAra4DWdCA
Date: Fri, 7 Oct 2022 20:00:18 +0000
Message-ID: <a4524dcc-36ce-267a-afbd-5785eab73882@citrix.com>
References: <20221007193124.20322-1-jandryuk@gmail.com>
In-Reply-To: <20221007193124.20322-1-jandryuk@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH7PR03MB6996:EE_
x-ms-office365-filtering-correlation-id: 62535450-d7fd-4dcf-b8e6-08daa89e8eeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CYvun8AMgO3vaN5vfA5UG/8OfdDBdyttQNHQ5ozuKhA9dFXSVMDIbCwfcQDGmOmQZxjTriRDouMRiIxhp/ZiCugq6phH87I3fqTek85P0r8OIMkwe1jG/Wm0ZdDFiV0NjrN3FVMEl6Ak8BkV2TTDWKucUYXrckj/EYCE05w2628S/39LFmJveo+/wvLvasxKl963BDqd2k60q4kMyohSgpB/HwaUqb9DNatkftQAf3q+OiVFLbMtVuPpI7QfHb7dnzWNWceVZojdaPukN8KYC9rsXZO/Y9jppERJFX2FQ+LY3n6JVXOoSXEsnG+QUAISKaVIlfr9COT1TppKFbYbz4w7vG52Blvo0e9e3TuhfoilJwcnTh9Ao7PuiMt3pMuMz3R1mmkjqvbzJTDpqoyPZ0rAwLr9TWzANFRm9T4xIsFnBR4a5PUm2gDZHDidaGmW6kDM1zgjpzNbnKbv17tsjobEfzoXexpuFqhzjCTaCYyQ7mm/HXd/JdPW4xCKRSKTfb6JL3fJQ9LH8G+T16Wbx/RDYdMBdUIMBYKiwmxjNZ2gIzKSaERUx9sOH1crn0h0NKDO14ruFtQWY7TNQOgHAC5q0+7NX9obEjXhSh9PImf5dnewgOZJQcTi0aXS2zFNK+6xCe2cgNeBnu4eo3kIbz1Vp8rKDebpXLhlXqzTIhpkyf88QX9q+vOfcMI2rWXaDogweOFP3V8eArVoGZKUmDv3oTsPZ4OCxTwvlgtPt5c5XVo/I5YAz5Xp9SmqROGZHmY3Ih4cBKKj5zQdfD0zNlR19sO6Qv9OMyQ++oYXHhX03lEERR1SyO4MtBGKA8syOrQx+yFJnNjT0/DrlAYhXA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199015)(26005)(31686004)(5660300002)(8936002)(2906002)(91956017)(36756003)(41300700001)(4326008)(110136005)(76116006)(64756008)(66476007)(54906003)(86362001)(66946007)(316002)(66446008)(66556008)(31696002)(122000001)(71200400001)(8676002)(6486002)(478600001)(6506007)(53546011)(6512007)(38070700005)(186003)(38100700002)(82960400001)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cEp6b3RTUmhHWkZ6RDJIN25LMjBnanc0aStzVDZPZm1kUkxpeC9OUXFNYk9p?=
 =?utf-8?B?VzFQMEdqSFF0WWMrQTFFVDEvWmI2aHZnOGpTanRpdDRheTF3VlppL3NTZVdh?=
 =?utf-8?B?dmZBNDluQXNweGlNVVFyTWpOMFoyMkl5WURDcXg5akVLaDlEaHVmSnVRNDRM?=
 =?utf-8?B?MFVvL1ZmOUIyTWhZMjhZSmxRcW84UjhhdzJQVzJ6M0tvMWpla2UxQ05OZjFY?=
 =?utf-8?B?ejU3QzJsai9lY2NIbGpGamNrRERFd2pSYkt5SHMrSmlwR21walRZeFVOdFZI?=
 =?utf-8?B?aEk4UkJXamRVUFo1c1NPa3l2blVwUDFTN1VvMklPRXcwY2ZrNkNteVRQR2dn?=
 =?utf-8?B?bFdsVkZRN2NOUlNKNERPVy9mcmI3clNvWk1NcVhtdlA5cG1US1A2Tnozemhn?=
 =?utf-8?B?RzlPZUs1US9sdU5uWHdCUWxManZOcC9BaHhqcE5TV1FCdVViOVI1TS9YejRV?=
 =?utf-8?B?bFlNWWdMZWVWcFpPM0V4OU4yMkliRHRINmtNemErcHVSS3dYVUlQWkRKaENi?=
 =?utf-8?B?YVIwWUtQd2FDTURXaXR4dmk3SEhrbG1oMEprVVNyZXNhdVpRRjc4Q20yMnUx?=
 =?utf-8?B?ZFZCY3lSb2pMZENoYXFjYmJMUUpJV2E1WUhrMitmOTZZUXdnR0xIcG1VdUxX?=
 =?utf-8?B?Z3oxZHhqYzZlUzBXUml4VmhMa0pQcVhHd3B0ak53UFlDQmdZM3RlYkVzam82?=
 =?utf-8?B?eGpRKzFmckVQTFZMZlprVWZlRlBVeXNLQnZ1WStBZ1F4TmRmZWtydlNSOWZH?=
 =?utf-8?B?Q09yYm55MkZiSkExSGk4Z3QvWHVJS0lKd2JaY2l2NWdWNzhDSy83MUU5bDVs?=
 =?utf-8?B?UWk1TXZ1QmFjRWpzQ0NmY3dEalBzdG91ZXpXVFNXMEVyWjlHUkY2K1cya1lK?=
 =?utf-8?B?M3lVMy9vbWcrSCs4TDlIVnVHRVU3c3FXZ3R2YWt4dUMxZjRWcG5xVk9Qajk0?=
 =?utf-8?B?M0RMbHpwc2VGRTVuNmtBaU5vWWVHcng4eUZkNUtzRTBtQmxubnZRNFM3d1FC?=
 =?utf-8?B?WjU0aUZ4NFVrakNPbkxvNkNsRkJGVGl6MmNVSzhtdHZ6LzV1U0E0WmNWQmwz?=
 =?utf-8?B?eW9sK2QwcG9NU3g0TDUvY3FEbk5DL3I4clFDTU90UkphblBXUUptSWVFSFpP?=
 =?utf-8?B?dHhVZHVRcjc5ZTI4YXY5ZG90bzZZa2laTEdmcFFLTHJiZ0ZiWE0ySElNY3lV?=
 =?utf-8?B?SnpCTmFlUWNoZ2U2ZUI5Vm1wWVlXZTNGMm1vb2RqWWFGQjFMaFJ1YkZTcWh2?=
 =?utf-8?B?Zk9JU2RvUmwzWUxGTUJCS1dJcHZjZk9tYU5OTmN5anJqK3V4MEU0U2g4NnBu?=
 =?utf-8?B?RHBEVkFUdytTd3ZDeGNXMjJYK25QYitZc09PbmFPZEJFazRhUTVwUG8rOC90?=
 =?utf-8?B?bU9nQm1yWitQQk9VaHFGMDhZZGpYUHhsRjZuRklyRXZWbjRUbHJCRm9zNG5B?=
 =?utf-8?B?NXh6SExwKzliYWVFeW0yN1FYMU9xcGZnUkVqc3VuNlhTUVdqSVB2UUNVYXJY?=
 =?utf-8?B?SUwrTjIwdlVWR3ZnSzZaeVBWaWxnQjd3Q1czbTFiQm5XdFh2a1JXUjd5L0Ew?=
 =?utf-8?B?SklWQ0hqaFgyRFRXNmRaWkxNN3RXQkw3RThVQXFpNVYvR0ExVmZYK3lSQzli?=
 =?utf-8?B?a3VxNFAyWHk3Uk9XSlNHUzF6UVpSUGNUNy9aeUx6UURubTdKck5CVGJsbGpo?=
 =?utf-8?B?eEVyaFVRV0tmS0lldHM5SG01bGE5anpiZ0daZ1NSR0VNTkt6bGtGYkFxYmZx?=
 =?utf-8?B?RTlubHVISDBYQmI3ZXVRR2puQ1JnZmN2a2NHeUJlblhwbktEWndDOHlGa2dm?=
 =?utf-8?B?OHZxTG10aUlHdW9xWnpBbnFBSDZ6MXRJekJZQmxzd2oyNkRsVHlIZEUrK0FD?=
 =?utf-8?B?bHNPRjkyQm1tMXA1Z0pFcm00L2diV0lMZk1DUHh4ekNZOVJjRDQrVHVOY05u?=
 =?utf-8?B?aUJVekdzdmxPU09VMld3WCtnM1o0RlhYb1U3KzJuRnpZZ2kwdEExdzU2SDkv?=
 =?utf-8?B?NnFlbFhUNW5NU2JQQkVERWN5Qi9yOTRzZlZTSEw2cFhnUDcreDhKUXgrYWRF?=
 =?utf-8?B?aHEvZXgyV2VRRnNTemxzQnowTmFlSmNUaXpEbkRkMnVBTWtTVXRub3c4cE9D?=
 =?utf-8?Q?Z2i+SoKdjXeOaIG9s4xX5zNtU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52BC2CCBABC4C446851EB950F754FC70@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62535450-d7fd-4dcf-b8e6-08daa89e8eeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 20:00:18.1989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aa+vSWN4vyRzTFE3zdOlNuqPe7uZV/QJyGAw5HhbWTKpKyT2JQK3kvI9g7PkutdnG+eEXW+7FaXa91P7jGmALNHsdAMVCkI0vOjpOw06H/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6996

T24gMDcvMTAvMjAyMiAyMDozMSwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gSSBvYnNlcnZlZCB0
aGlzIEFTU0VSVF9VTlJFQUNIQUJMRSBpbiBwYXJ0bmVyX3JpbmdzX3JlbW92ZSBjb25zaXN0ZW50
bHkNCj4gdHJpcC4gIEl0IHdhcyBpbiBPcGVuWFQgd2l0aCB0aGUgdmlwdGFibGVzIHBhdGNoIGFw
cGxpZWQuDQo+DQo+IGRvbTEwIHNodXRzIGRvd24uDQo+IGRvbTcgaXMgUkVKRUNURUQgc2VuZGlu
ZyB0byBkb20xMC4NCj4gZG9tNyBzaHV0cyBkb3duIGFuZCB0aGlzIEFTU0VSVCB0cmlwcyBmb3Ig
ZG9tMTAuDQo+DQo+IFRoZSBhcmdvX3NlbmRfaW5mbyBoYXMgYSBkb21pZCwgYnV0IHRoZXJlIGlz
IG5vIHJlZmNvdW50IHRha2VuIG9uDQo+IHRoZSBkb21haW4uICBUaGVyZWZvcmUgaXQncyBub3Qg
YXBwcm9wcmlhdGUgdG8gQVNTRVJUIHRoYXQgdGhlIGRvbWFpbg0KPiBjYW4gYmUgbG9va2VkIHVw
IHZpYSBkb21pZC4gIFJlcGxhY2Ugd2l0aCBhIGRlYnVnIG1lc3NhZ2UuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4NCg0KV2UncmUgaW50byB0
aGUgNC4xNyByZWxlYXNlIHByb2Nlc3Mgbm93LsKgIEEgYnVnZml4IGxpa2UgdGhpcyBvYnZpb3Vz
bHkNCnNob3VsZCBiZSBjb25zaWRlcmVkLCBidXQgd2lsbCBuZWVkIGFwcHJvdmFsIGZyb20gdGhl
IHJlbGVhc2UgbWFuYWdlci7CoA0KQ0MgSGVucnkuDQoNCn5BbmRyZXcNCg0KPiAtLS0NCj4gIHhl
bi9jb21tb24vYXJnby5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJnby5jIGIv
eGVuL2NvbW1vbi9hcmdvLmMNCj4gaW5kZXggNzQ4Yjg3MTRkNi4uOTczZTFlOTk1NiAxMDA2NDQN
Cj4gLS0tIGEveGVuL2NvbW1vbi9hcmdvLmMNCj4gKysrIGIveGVuL2NvbW1vbi9hcmdvLmMNCj4g
QEAgLTEyOTgsNyArMTI5OCw4IEBAIHBhcnRuZXJfcmluZ3NfcmVtb3ZlKHN0cnVjdCBkb21haW4g
KnNyY19kKQ0KPiAgICAgICAgICAgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4g
ICAgICAgICAgICAgIH0NCj4gICAgICAgICAgICAgIGVsc2UNCj4gLSAgICAgICAgICAgICAgICBB
U1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gKyAgICAgICAgICAgICAgICBhcmdvX2RwcmludGsoIiVw
ZCBoYXMgZW50cnkgZm9yIHN0YWxlIHBhcnRuZXIgZG9taWQgJWRcbiIsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNyY19kLCBzZW5kX2luZm8tPmlkLmRvbWFpbl9pZCk7DQo+ICAN
Cj4gICAgICAgICAgICAgIGlmICggZHN0X2QgKQ0KPiAgICAgICAgICAgICAgICAgIHJjdV91bmxv
Y2tfZG9tYWluKGRzdF9kKTsNCg0K

