Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2F86C2E88
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:18:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512295.792201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZ4W-0008Gc-0M; Tue, 21 Mar 2023 10:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512295.792201; Tue, 21 Mar 2023 10:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZ4V-0008DD-Sc; Tue, 21 Mar 2023 10:18:27 +0000
Received: by outflank-mailman (input) for mailman id 512295;
 Tue, 21 Mar 2023 10:18:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peZ4U-0008D3-8I
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:18:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b491823c-c7d1-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 11:18:23 +0100 (CET)
Received: from mail-bn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 06:18:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6592.namprd03.prod.outlook.com (2603:10b6:510:bb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 10:18:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 10:18:17 +0000
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
X-Inumbo-ID: b491823c-c7d1-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679393903;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cVLAeorRfOJNodM8Cgsl+D4JfekTvFt3q9/CyxQDbbA=;
  b=dylsnFJApy5bw2iMFrgTlR3jFae/EASjptHz6LfEPhM3Z4E2oa1Bh3vt
   In0KkzcD9ptqNuWoLsiWPMhDO3gvsu5Y6GcvpYEx3UFeolEDFPkQK65i5
   n53Jn+rHZ8F4OxQu7EyLhP1UscRaHaqhD0ItwV9BT6rBItv5Fjlrabs/K
   E=;
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 101682582
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:drNyMaLI9CMGnGMlFE+R6ZQlxSXFcZb7ZxGr2PjKsXjdYENS1D0An
 zMYWDuDPqnbMDb8Lo0nb4yx/R9V757XxodjQAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5FOmNy7
 LsUBQxdUQqllsy82Z2VQ9Vz05FLwMnDZOvzu1lG5BSBV7MMZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dupTSLpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXqlCNhPROfQGvhChmyInTQ3LRMqcUqAguL+sHCnXOwcA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpa9E4tclwWT0j0
 HeImc/kAXpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWdi9T0HXT6x
 WmMpS1m3bEL15ZXj+O84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:OTGeJ685V+T9N2pW2CJuk+DjI+orL9Y04lQ7vn2ZKCYlCvBw8v
 rF8cjzuiWE7Ar5NEtQ/+xoW5PgfZq/z+8R3WB5B97LNzUO3lHYT72KwrGSoQEIcBeOkdK1u5
 0QCpSWy+eeMbG5t6rHCcWDferICePmzJyV
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="101682582"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV89mGK+2aSMQeDTgUIEa1g3fQXQPMK/PDPhW+WFgqzFnrUoa9tJsLUaL+q5qviKOXtQC+j0ozzJlKKAjR2pumPotxw4X6ZW3MiZx9CsQ77Oky22caP3DHAd9jPwJO2X92Os1vA6tE1b3GghQwvqficgSD9COKOFd0hPeLtmuUMEfc84veNMa5jMRs96shmidUoCwjnDVhFaPTMMsjZUGzhl2TPz9NVFGeKnQQKbgyM6VStkjtBceZ26KynIfYbvqk8+A1cgSsj495xta/dsXU0CVUZxuCSg14Cjvlna+2Quw+K+X7xWxBw6j+HQxzsX8FTkYdZnX6+mlkitVO06oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7pNI2lOTWTJSy3yy4DlRG2H2RV1SYngs6WL/wKhKxY=;
 b=TIhTUSQI2fhNI4STQKN+YnCMGhWlqodsCpqkYfEKFyEkoEpevA5srwxCyfNgMysaxz2Q1vezIUAbyY0sQexFJWixf0HGs840TMtb/KXBFDFU5V6w4rhQq8U06dgDjVRgXLjtcTTQXjY5wS2CrEX3XACXXE2/oPAywjAZHccEdVnCKQiWFp7j1lNoAWLN2W4vapnMy0l8ZNzAOxvRIBWknRcLxYh0dlZAur9WqMBwxeGh/xd3WzGRS4UU5LL9G+abEK1sHwkty7EpXm9kxhOPopK0IMjkBQcbQWd3OuW7xDuRG00WJIXZUISKaKAUxrwEQmFoSzNYHGO1fi5hnx0RMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7pNI2lOTWTJSy3yy4DlRG2H2RV1SYngs6WL/wKhKxY=;
 b=ffkqkYH9i4wgl6xkVKFJjbDvXx+sSZ9wGGDN5KbrmevqyM07yAZo/lYpJV03K8kUdJ0Yg4uikt3Vk+legS2pxW5g/WsOMfdyYdrueHOXGwPTtDwfWpY82RSyBg0wThO9zVTWLZlZ0aKiolxDKkbUzOFU46mcxaRS3PBnwP1avuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a5c65e6f-c764-17ea-3e60-fe04d0ed4982@citrix.com>
Date: Tue, 21 Mar 2023 10:18:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vmx: Provide named fields for IO exit qualification
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230320182052.1831486-1-andrew.cooper3@citrix.com>
 <8e247141-a210-64c5-3831-a39f252de1e5@suse.com>
In-Reply-To: <8e247141-a210-64c5-3831-a39f252de1e5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0660.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: a595558b-5760-43e6-4e77-08db29f5964e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kENrDAT/+JjoMeBpHkiVWeElPoNWAs5f/qARnK60F/4c+aGBvadqqF5Itn9sw9MZpIVMh/RL177Wyg4c16zNralIBIY0a9yveMZlUJZS+xySG2vdh6hnX4x0K17z1ufd7iPVfi0uEsqJlf81AlL5aDSU0z+YevdjIWewzj9PWVcNGSXmiRO8eanDvkTMMVWo4Kii8qxCdvou1PU32WoXzXzL5Msm5wmLjN5uwtmZWORVDHkZeegFK1bhfg1IcZCMBYRGknOMVyWmYecpEmc+8ZqkTp3T5zRYE0s/BlLASkrKINPpt9XH0GWfKq0n76dyyb3g2poLAt903cbHaniQO7jgJBhfmRWDe7/Z3c+t0736hYgO6/nBRXUAFjt9TtNREHgqhaO/hWHEb974JXBgaX10hqFopS6rlQWgmVN2kQIuQxbQh8FA3zUeYmKSTnuQABKKTgOJZJpWbB08Qly3RTMz9haxZ1Vjpyq4h4ApzcqBIgwvy7I+qSmL2AJqzg748Wg5V0daXOmng8Gs6uKiYBVfixcZ/KwxhzL/ExzkHS0LQeczPuqspYqTlCrilkVHtRxvQgi873jTtKSi91rfp0PddSAgqVQE6T86X7B0k5Stw2MlNi8adA4kTKJ/NEQn0LlWrGxuiiXa+heuirTwyr0KCkwJO9iBWUCWv98RmEPWfusN3rfoQLT4uyOtriCYoYcz2hPPunrmmK1YuO+CRu6DUwGDKbZT5A1GnPhDr0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199018)(38100700002)(31696002)(86362001)(6486002)(54906003)(316002)(8676002)(66556008)(6916009)(5660300002)(8936002)(36756003)(66946007)(66476007)(41300700001)(4326008)(478600001)(2906002)(82960400001)(186003)(2616005)(6666004)(6512007)(26005)(53546011)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUJUNHNzak1IQmV3dGFDUUxFdWduZmx5MEREbG1SVzJoV3dkWk1aWmQxSEVS?=
 =?utf-8?B?QUhpdzZOdnpaMFcvNURVdkhxaGZFK2ZTc09PVzdyL2RjbDNXK0E0TEROYWZn?=
 =?utf-8?B?Q3d0OVRQNUlwQWw2Um9RaVI5Y0FNTWRhOGsrR281ZU9vdnQxVHVhLy9nQTRp?=
 =?utf-8?B?ZDNXS1RydzZYQURpcEpkNTU4WlVjTkI3K0FOVzFGTUZYVTV5bGRSaU1Cd3di?=
 =?utf-8?B?ZDhRNU5PRksvMytBZVkzMDdvUG5oOU9wOHlwd2l4MkRjd1ZodmFxemwrV1Fa?=
 =?utf-8?B?blNEZFl4VE5Sbkh1Y0NtSlRVSGJvdTBhbkVDTEsvbXQ1ZUYreStuUXpBUmRk?=
 =?utf-8?B?d0g3VEVrK3N4UTdpTXc5L29TN0tjZ1o4SlhvbEdiNmUydk5Sckk1TUxBSmpT?=
 =?utf-8?B?Y2JSdW9tbC9NeEFWeHd4YVZVUUQyQWw1VmtaVDBYbDVTc0gyY05nM0NhUDhS?=
 =?utf-8?B?bWdCQmMvbkovVzlZMUZhVU1rdkVubVBRclY5NnBXV1lHS1BaU3E2REF4eito?=
 =?utf-8?B?SGwzM2RZczJnR0F5UVN2KzdkOU1oaUhibDJKVytOMXdpK3AyU1VVNEJNUGpr?=
 =?utf-8?B?QTNKN01XeFptUXhmOWFoZHVwSytYOGxLOTdoU0psa25VMTlHZ1R0QkZhUllP?=
 =?utf-8?B?aVRIRjExTURIT2FubnpEWHFFVEZQOU5NeWlIMzg0ZnFMS1hKRmlwMmlQbEFX?=
 =?utf-8?B?OFM3VEQzNGl3NmFWRC9DejNJbi9mS3NFT3FoclBkQUNrQ0pPZ3k2QkkwKzNo?=
 =?utf-8?B?N0hVVWlRRThFVHU1RFFkNDcvRnlrdjF0Q1FPQlB3cFhmUkM3ZFM1RHFyMXNY?=
 =?utf-8?B?eFpnbEtoQVkyejJubmFlWW9LWk5PVjhpSmFlcW4vQUtXdmEwVDZOc01uUXlV?=
 =?utf-8?B?eHZuNkRYaENMWmRiUEd5c0NwbkJ1cHYrN0sxK3Z5eXoxZHZKSEttVFJrYyt6?=
 =?utf-8?B?UlE5elJUZC9FcEZFS01VZS9OSENoRWlONVhkdlFuQWhXR29rUEVoK1cwdHNE?=
 =?utf-8?B?K0JabUhSd21QMTRMRDZIMGUzanFHZlpTcGlnY3hQeXhDU3YwUUdqUXYybjN2?=
 =?utf-8?B?d3p0TGk2L3B3eVZKcGlIVjZiQXFPM3ZxTEVXRXdRcU1aRVlMR3BvN3hSZWdr?=
 =?utf-8?B?bVpmNWI5RGFpeS9hOFdiV1I4Rlo4TjYwUWdMTVk0ZS9SOXVtdGJSNEVSWTE3?=
 =?utf-8?B?KzFoRmlENUZpRC9LR3JjODZSb0huUnFkR0wrZFZNeTFibmJISXhzSHhrcnBP?=
 =?utf-8?B?T0p3Z255WXh2SklRbnVRMDFwQ3Fic0lORmxLK0xuaXljZ2V2aCtGaTNhblAr?=
 =?utf-8?B?cEF1ZmxxakN3RGVRTml5d0pmWUQ0cGpSQnpsQnlialVXYWZORVpGSEc0Ujdl?=
 =?utf-8?B?bmNLUUo2RWRyRE9USmROcXNJc2lRWXpWalErdHdVRVA2SGlzeXlXeityNkJE?=
 =?utf-8?B?elZiNXhtQVF3TE9RT0ZZZVQxeStlNWEwSlE4Q3BKa1A5UDBhMjh4Y3BTQmxk?=
 =?utf-8?B?VGhUSk9Ud3lIUE1RQWFvNnVqN1V6NVVwSTRTZHBjTldaWVlTcUZLNmMyYWdP?=
 =?utf-8?B?aVAzUWpMZTRyV05LdlJLSk5SMjZzbjRqaWJOMHBUZXNkZENKWUlDUFNPRkxu?=
 =?utf-8?B?di9lUVZvZFZvSjlSNVVMM21pZzc2bld2VTdPZXNnZ0FKK3RjbG5DekpEdWox?=
 =?utf-8?B?d1V0S1VVU3h2Y0UxTFNDaUIxcEM0aGxvaCsxZWhsUnBmOUxqYUhtdllVN1pP?=
 =?utf-8?B?eHRaQ0JNN3l5M0d6QitSKzF1Ni95eU9uOFB0amtUWndtaytoZDFJR3hTMTk2?=
 =?utf-8?B?RUZZQlgxTjlZWDVINCs4akN3amNESmsyeE1oZUV0Kyt4QTdVQVIxQzVVRWM4?=
 =?utf-8?B?SkZXczVkQTAyb29BaWlxZUswTVc3aXY1VUJmS1JSUVp2YmVGQTVXcm5UUlp5?=
 =?utf-8?B?NVlyd0xDWnpMYWI1R0ExV0Z1WU4zZXFVWXNOVG9ReG9oeGEzcDVmOVJhaklL?=
 =?utf-8?B?dEF0WHc2NytubTRULzJkc3pwcG0vOWc2dWxyVTVuUXVnTVJHSFJibFRiRzhl?=
 =?utf-8?B?T2gzSklvdHdKRUJlSjBvaEgzZ0NGMUpMNUtMQnJFTjdVaXFHd1B4dnY2SlZR?=
 =?utf-8?B?b0FaMFdFN2swdlhXMDhEcjZKaTRFUW4wYXphbU9uZTRsTGNLOC93UU5CVGRO?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TZCRJPCFW9TIVMtNQD47Hcbwj8JJhF80Fg2bc4IxiFyv4a0PPBYbC0qjh8HVVj5kem0ZAL0YMuhkGHg34W+sZDQwtah3AYVtLWuV0CfdNMShglXoADTAPviHY5c7kWGm4O+WQNtpdQqT+N3j1JDPyF8es95oDy3ou7gghIAmYjyeQf+JvNJ1tT5FmRnPshUY1ZuVjk2dhcXlWZBEsrsLh/VLrtQ0olshPMx0mLt9MdEbxlbb+XF4BH/9SvS1PSy3W6blyi0ePexsO87lYHYDGQ9QPhRuccBDGaSJ8bLMJZ2oNV7Fg2dytZYqtX1GcWcRBQph+tEauKe6tN0INSofQ0Y0q1ShyMuFARpYcjGInXBmpHSPITng2zK0wW1x0N3kVjE7haDkzZYmXdkk22Y5DAQegkgcQSO/VWCxnAiY81OFpvF5sdx/Ba62Ak8Vu9Rw7RN1LDJzEQkfbJHcH3roOqNmtNcQDmkpVNerdeSS9j3yRN+IzxR03of3iCX4wZH850/UNv+m7Z+85R1M1Et9j+gD5x62mNYgDGC5/bG11b+G2QJKhkyqNHrjR3IZxJcpKwtO9fq649hshCiQzsE5LqKE9AEFJaZL9xpopyJjHeOk+qU8uL7k0eezWF0T4whyk+o2ZR/77xedljKF5WPh24Cwq53QqGvg/sKp/MIXh0Vw2tAA4VRHYIqRYGnYUucPCliMrA0T6WNJfFJjgjwkBKrPeKPO3I5H5jlVoaqPxVfjyluPxGW99j9L3lj2Bptj4oqyLmZFsfevCRCxMmBRGYSWCFGKfJ0rkPKMRbuxTaNsmXm1cIP9vNF6Tu76f4WyKf6nj9cycS9Q5BlG+zEFhAZ8JgUj8lUaks600GuS3oc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a595558b-5760-43e6-4e77-08db29f5964e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 10:18:17.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlh3gM/A6bC52WLEcP0K+TCbFf3lObiAkoF6uQTbC+r1QJaoVEDFfkQjuarDNaIFv0Pq763dOEWg8rFIoLRkaWWNbPkP19epKE7nJc451WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6592

On 21/03/2023 7:59 am, Jan Beulich wrote:
> On 20.03.2023 19:20, Andrew Cooper wrote:
>> This removes most of the opencoded bit logic on the exit qualification.
>> Unfortunately, size is 1-based not 0-based, so need adjusting in a separate
>> variable.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> but ...
>
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -4560,23 +4560,37 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>          break;
>>  
>>      case EXIT_REASON_IO_INSTRUCTION:
>> -        __vmread(EXIT_QUALIFICATION, &exit_qualification);
>> -        if ( exit_qualification & 0x10 )
>> +    {
>> +        union {
>> +            unsigned long raw;
>> +            struct {
>> +                uint32_t size:3;
>> +                bool     in:1;
>> +                bool     str:1;
>> +                bool     rep:1;
>> +                bool     imm:1;
>> +                uint32_t :9;
>> +                uint16_t port;
> ... I'm not sure this is sufficiently portable: Whether a bitfield of type
> uint32_t followed by a non-bitfield is padded to fill the rest of the
> containing 32-bit field is left unspecified by C99; this particular aspect
> isn't even "implementation defined" (afaics). Therefore I think it would
> be better if either uint32_t was replaced by uint16_t, or if port also was
> made a bit field (and then perhaps also of type uint32_t, or unsigned int).

Port is a naturally aligned uint16_t field so I'd prefer to keep it as is.

I'll drop the others to uint16_t.  Furthermore, as it's simple cleanup
specifically for another pending patch, I'll commit this now and follow
up on the other thread.

~Andrew

