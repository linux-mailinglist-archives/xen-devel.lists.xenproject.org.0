Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C865B77BC13
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 16:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583687.913968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVYve-0003zJ-U8; Mon, 14 Aug 2023 14:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583687.913968; Mon, 14 Aug 2023 14:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVYve-0003xq-R1; Mon, 14 Aug 2023 14:52:22 +0000
Received: by outflank-mailman (input) for mailman id 583687;
 Mon, 14 Aug 2023 14:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tgG=D7=citrix.com=prvs=583eff3b4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qVYvd-0003xk-7F
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 14:52:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 295fa10f-3ab2-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 16:52:18 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2023 10:52:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5636.namprd03.prod.outlook.com (2603:10b6:208:297::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 14:52:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 14:52:07 +0000
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
X-Inumbo-ID: 295fa10f-3ab2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692024738;
  h=message-id:date:to:from:subject:mime-version;
  bh=h3r8VfZzQv1nlbZXaNy+XstpNnDPjhYt0XOpBlcOWKs=;
  b=ImAM09Kg0IXk6e1yCh+EiGiKXzzFtkS10PJB3pqEp8hbVJ+J5Wk9eUeP
   xgsXxwNhcJht1zqozuUr26cWShDB7Qwz5Ah4T48HHxRIF16Wb6Xbyje/a
   oA75Oq3ceu7LRLSyUPnBhMCa5j6PNW1kzygCmsGfg0SUZIyISqZqH9M9U
   M=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 118121877
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SuogTK+a5yu9ZIxARbPRDrUDHH+TJUtcMsCJ2f8bNWPdYAtSk2BPi
 n1XRDXZbc8+UBK9c98ZMdP1qyVT5NOJ0Io8HzLYnlk8Q3xDo8OfWozAJUr9YS7NIpHIFkg5t
 stENNeYdZ5rFyHQrUv2Y+C79iMgjviBH+GhUbebN3t9HQE5FCwog0ho8wJVbvaEpPDga+/ak
 Y6q+pS31CaZ5gNJ3kIoB4Or9k9l7aip5TlCtQRia69HsgSHmnRJBpwRe/rqJirzG9MFQuLiS
 +j9l7zopWmxEzXBqD+Guu2iLhBVGO660Sym0Cc+t32K20AazsAK+v9ncqFaMQEP0G/hc+lZk
 L1lrYa3RRoiIprCkeEcVwgwOyxlNOhN9aSvzUKX6KR/9GWYNSO1qxlSJBtuZ9ZAqr8rWTgmG
 cEwc1jhUDjS34pa/5rjIgVcrpxLBNXmOooZpkZhwVnxZRrxacmeK0lizYYwMAYY3qiiL96HD
 yYqQWMHgCD7Sw9OIj8q5KcWx49EsJVdnwpw8zp5rYJvi4TaIZcYPLLFaLI5cfTSLSlZc9rxS
 ssrMA0VDzlDXOFzxwZp/VqHoMXqoQnwcbsABZaz8fA3pXyoxGAcXUh+uVuT+ZFVi2aYcvcGc
 QkxxXBrqqI/sku2UtP6Qhu05maeuQIRUMZRFOt87xyRzq3T4ECSAW1sojxpMYR68pNpA2J0k
 APV9z/qLWUHXLm9YHSR7LqL6xi1PjAYNzQqbi4YVwoVpdLkpenfizqWF4Y6Svfl0YKd9TfYn
 DeDvAMUgZUvjsMFkKSA52v3gBCzn82cJuIyzkCNNo6/1StpaYjga4G25Fzz6fdbMJ3fXlSHp
 GIDmcWV8KYJF57lvC6HTfgJHbqpz+2YKzCaillqd6TN7Byo8n+nOIVPujd3IR4zNt5eIWO1J
 kjOpQlW+ZlfemOwarN6aJ6wDMJsyrX8EdPiVbbfad8mjoVNSTJrNRpGPSa4t10BWmB1+U3jE
 f93qfqRMEs=
IronPort-HdrOrdr: A9a23:BcbkEK3clTKppO56lMz+dgqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3AdocEHWuqjDf2K7Oij1nmfPdS6IsOVFf48F3bCna?=
 =?us-ascii?q?qGE1iT7PIbH6r+q9rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A66auAw7wdZ9m5Z4U2655EbPaxow35K2+I2oLsak?=
 =?us-ascii?q?FtsfDNBdqAAeeriuOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,172,1684814400"; 
   d="log'?scan'208";a="118121877"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9dsW5LQ84C0RFMjZr9nFKW4UfRw9lDZpK4KlMMqBb0WeyOaTisaHRqHOFslt+GHwG5g74dBLpsiGjwAjyGRDtRRe2T/aNS1gkz0Mp7WN8KuHZfryg23q80inm7T+4XQ5RAYQ/Mo3/1sK63K9w7NGlV+sGJvdbLRDB/BQJihdF2W4NK7/825Ei+oW6lVw0ghK832tJF72rklFz63REO7Q02JKjveZ+yyTjo/g0kVNUm3QaWV9XNcUkaoQq7rS/qr95qsRzRqN7jzVpPxabk2YpEKx0f2zrWKnrvvU1933yN+XBbkNclwsZjme7MgKESCP27SKddjyStAEIbgAWR3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3r8VfZzQv1nlbZXaNy+XstpNnDPjhYt0XOpBlcOWKs=;
 b=aYzJzSHcyHfFGK2Y58KRS7xHaLxj5vfGPgSwPwMeg1fdvGBVIqPH5+OLCEBiWug5NymhzToyVrDIcWjbIYFvCJIvZvXYdqj3i/0PW0n4d0dtN+72iDHUi4oAq3/uOILXYqOH9MQZYPlDVgVziU32y+pk4SP1o8vqFyM7adSBmcxQU4XyrNwEmU/RUbwX5CYc6lQM2Z+NqzUxNjYMhOcj8+59Y3HoxCJrvfJlBrKmsKHPDUKJmSLkTUEYyfzSus+hBos8DQOsd7PNArd8uBfTSqOdQsrOvuAILFJi/0wjeyMilY9BF1RroqttHSYfDrxKc90A3yrZ8yQIoCKadObktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3r8VfZzQv1nlbZXaNy+XstpNnDPjhYt0XOpBlcOWKs=;
 b=kL7RAHfFyUfzC99NRZAOjYALwV5FQv4I+Acg7B7fdOxjhHCnH2fj+Qe+xnKtgtAutH8izVauRfQUbJ89k3UcUCRjjG4J8EqUo7bgnk2/yPjBevfJao6Qe0YJC/66yIpwx0uqH6Iw83UpqwRmkgolz5vVnJ6OoQire1gARO4wgKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: multipart/mixed; boundary="------------55FxDnBiyeOeQ5RkyTtwUSqa"
Message-ID: <d4826ecd-fabc-03e9-2ec3-788877a560b1@citrix.com>
Date: Mon, 14 Aug 2023 15:52:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Build errors with fuzz/x86_instruction_emulator harness
X-ClientProxiedBy: LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: 19346b1f-b85c-4ffe-a568-08db9cd60787
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SIHskmsI8whHo48AvuvgTTHEVPnaLXebbN/c+XH5LmWsjS5KF0fGjxXtdLhBKQtuTwJVUaewbJ9u+b47htFU9s69RGy+nohCrtgM6MRry9O7QbZMmqP9pUlm1Zx7BteLPEIPzFby2S0mIZklyu1mVm1UV5/R3Ma1TKgHBlgQiN52tH72S4jqBqF5ColofylKnTmsMZszB2Fno/NDkPADz4NII69CeXy6mR1SgtEc77GjdyrRlSSqs/ihHTPRpKsNNlHsLfXDKlvg4uuD20jrC0k54tZctYpibLMOnBrZEAfS4dMRn5+NEQWU1CJyqi7X5Wezvik3JgVYs4FpZ1yyPG30BD3gOq/Th+3zGE6w2wQpMkIs4VXFuEFUyTYYQrvUuTgf8eLj/lCrSZd0Q4gMqEjlXa+r8MwDNKi0tTQ/EYkWv9kz+hVS1JsqQNOz55m2HFHG4/AfIdTS2SY2lmwAAZ7u/sF3p6W7c1400xz6uSByl8N6q2wswD3nWfCv+AYwj2frpHylR/5cJJd12W6zZWbE79uX2BxTT9JLGHCDVQoMUyz5lkddMMOyS1TWAUoxT/8IYke+3dxq96MlBWz/6LllecntKc6hxv7KPGFgUJjKkBv1Okv5COnng8VrLPJpuJkLu/0K4ZmEhXQZb0haig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(376002)(136003)(396003)(1800799006)(186006)(451199021)(83380400001)(21480400003)(41300700001)(8936002)(66476007)(66556008)(66946007)(8676002)(316002)(6512007)(31686004)(2616005)(26005)(6506007)(6666004)(6486002)(33964004)(478600001)(38100700002)(110136005)(31696002)(36756003)(86362001)(6636002)(82960400001)(5660300002)(2906002)(235185007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFhsRDZaT1paTmJ2UTU3RXN5NlB5a3dwcE1wb1NmQXB4REhJQnJmQ05HSFVG?=
 =?utf-8?B?L0VnOGdKQ2ZoQnY1RG5UOU1XbzRPeE9COUtZbUlubUxvZ0ZHRXVuNnUrdTlo?=
 =?utf-8?B?M2t2cXJ6QkJ0QXBWZU8xKyttdFhiZGgwa2RUUUJnT3dDcW1sM1B6czlMUjBJ?=
 =?utf-8?B?L1Q2cC9EMXNGZmdwdWhrVFlyTnlBK3F6eWhJTHp4MXRZV3lDQWVBKzk2blAr?=
 =?utf-8?B?RmlPeUxQYXphUWpuanhZVTRPZHBtTXdXZmw5Tm92TUcwenpaN3ZiQlp3MXk5?=
 =?utf-8?B?MkthTVJESTRPOTVEUjRNYlZobGtFMyt1M2FaQXpaczBYam9lc21FNUhRVlI3?=
 =?utf-8?B?bURZZW04NzAzc3M0YXZLaG16dDV4TXB3a0tlMnhMaTBPeDFCRGxES093N05V?=
 =?utf-8?B?bmVvSjUvUGU1Y0dWNFpGM2Q0ZEFvMVZrSkF2UDF2eklWOTRyWHRhQjJONUxh?=
 =?utf-8?B?MTBSem8vUjZLck5acGRVcFJiL0dHVnBTZ1FKY09TUER1VHYvM21pTG1keG9J?=
 =?utf-8?B?M0NYSGZjNTRrZEdKNlNTTkNobmt5MXl5NHRSendlOFJDYU84QmVycWJuWlAx?=
 =?utf-8?B?RmJKbEQra1pGM09NcDRCeUloMmVNSThiRnZLV2U3VTdOUXZnYnZkc2xEQ0t1?=
 =?utf-8?B?SGlPclNEUVVUdC8xbElOMVBpSEZkd3gwZ3Q0WjNGbEZyNmhtL2xlRjdQb2xY?=
 =?utf-8?B?TVBtNGQxR2gzbXg1eldPdFltbVVFRG51VUo5OGF6NmxxU2lyVnhVWDhmTEFI?=
 =?utf-8?B?RzY5Umx5bCtOM3c2RjRRVkxwTGdXc3ZpTXlVV1lhZDVVeUhoeWNJaHFkYTJD?=
 =?utf-8?B?MEc2SnpnUTVwbXJuTjZMNnUxYkloTHdPV09PSjBveU5WMlAzd0JOTHo1cnNW?=
 =?utf-8?B?akhGS0JSNDBTTjFtVFNsSXVYcm55VFJUb1ZkUkJqbTZaZ2wyN2xaYlI1MEZj?=
 =?utf-8?B?TVZheWtua1hpbE1RWmd6U3NZV1hVMzE4VjBwZkd5OVVaQ0t1VXkwbDFuaWZR?=
 =?utf-8?B?Q2tmUVRELzZuYm41cGtTQVl0S1JJU0hLT1o5VkVEUXcrM0RGUWJMMXIvL3Bu?=
 =?utf-8?B?a3hqZTYzQnNoN3JTb3ozUFN4UUFSNTdwZE9FRVFiTCtUTFJONlgzWFFxbEp2?=
 =?utf-8?B?WktzbUNmeG5VK3psQTQ3aWJkUEl2QUowZ3ZOd3RzWGNxVTk4NndIbHJSVXhr?=
 =?utf-8?B?QTlsQVEzWVFLbk5IMDhSTEVKQXBINjVWZXpmWUt3L3hTSzZadVFiZE5tdmM4?=
 =?utf-8?B?YXNBZTgycG1yYzhpaDFkbll4VXNuaUFJenhKbFpZYWp0NFQ1Y1o0M05wcmFI?=
 =?utf-8?B?Q1dVR1piOG9teFZlVnlVd0NWNGhRUzFTNGRyVS9zZCtuckZnQVZxMFBIQ0wx?=
 =?utf-8?B?NlhITHV2Vi9ka3I3QnRPblZYdHVDU1NBakZYZUtzbDJtMjJRSld4YWdWeTB5?=
 =?utf-8?B?WGNWNmdUWUxWMWFKSW04WEdhOGVaQS9ZTVlIcCt1RHdVVFVyeGF3UDBTeDdP?=
 =?utf-8?B?Z0dSekxQcFRPQjNKTittZ0w3d3RPbGN3bWJjR1BHbWNHSTcybnJ5RFNjUXFF?=
 =?utf-8?B?clJRSmttZlJoUVhrYlNBUnE5SlpydTRPYllhUC9BZ0dyTGx2NXR0MUZBQ2xV?=
 =?utf-8?B?WHR0cFExT3ZROUtwWTdYRVAyYW53MGVpMUVDa09jZHRUcGI0MkxZeDdTdGNS?=
 =?utf-8?B?Z0NzOU54WkxxdUQxKzBxb1E5V0VrTDZFRktrekNTVVl4VDRVV1lwK3VZMDQz?=
 =?utf-8?B?dmE4QjJTbmhDWHpOZUxTMSs1N1FJbVhoRGl3b2xYMmsrQWFFWHJkZWFnb1h0?=
 =?utf-8?B?aloybWNjMkorUWd6all3a1l3WDlUa1ZlRjlkTjFvdzZQdmRWQjhmQURNQmZz?=
 =?utf-8?B?S1F4UFRvdTQxelJoVHRtMjdvN2xTa29SN1ZlR0lJTFM3a2pwUmdXdHdiU0hG?=
 =?utf-8?B?UVBRdGFxdmVIUVFBT1JhNDR1M1JMa21vZmQwSWR4bEtuYW0zMlFSNExSeEdK?=
 =?utf-8?B?Vk5QMXd3aXczRDZ1dktHNWxTWVZucHVQTnRyRUMzS0tabE1mTHVMQlBFc0s1?=
 =?utf-8?B?N0cxV0QzNytNdlFLYlBUd1JaaXpmNkdUNUV0Sjl1Z3NzS080MnNDUis3R2ZJ?=
 =?utf-8?B?bXJ5a0hpdUJ3ZVZCT1ZMeWE2M2xRYVp5VkxXd1dudzVFbWtMdXU1MEY3bmFT?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vUqPb6YuBpi5d1HxlCg1Y4aYnksm/t52bK8+AUkkT7K2LHOon0T0RB+2ax+zBJ9QY0MwiHejCMi2KNQTWGl92WB4CUhsLtSEpUtK6d6ZDnR43VE+A4jPvC5+ROkOpzbUm08+kkeG4SBuZDBYqNaTHd30AD6s03g28h7VNVeePlv96bXRzaUICxiz/gaovSlACszDGRfFY5C2rcGemFwXwKcsLtxxX2yQIADLw1EEJHK8VpnvJlvHXmUP7pOa1IAu2ZLVIcLGm1AhmFDCkE1rH1EfjWlkLjipAwvNLo9GY5FGe2AIwITEm9KTBuGz2XH9etZe2m/sPI1s5yJbveJLWKdvXYzkQPIvFIaJmjkfAfBDc+CPN0x5tJh0yioe7D14qMvHjA9JX+C0fRla+A0evD4mt6GS/GpkaeZb+u6O+NZinb/WtY7CqcOCONYkIvQwOLOyUMif+cMvg0uLJx6L94yfbA3NUmtTBPohrMLYL6zPeJnI9WsWuUWG4Ls7KG1bXNJ7Jp0JtCDD8FgDCVyMA9lVSZROVtCzwnHQm9WHgGGmlH1luT9qFV254+SbSY/nhkgQTvz8TmzQgF+xU1mGeHATAtMxRMWJu4JdLQFY3fDzJ7SI+KMTCRZQ34uGdEhMA9w9udunEcN0EQe/ntj+eu1NCmsD2qmcLJ1gOimPIX4aAYL/oHVf0xQXBb8pMfDENTsv3U/AjV+EyvEYTZCNWXeOZHowN6zS86q+vRlmX6M09qZm+49FDb9GrIMDp4uWaqHnkRnQZay3nPUfWN1ULFl1G2rWcgoa6LowvTGo+Qc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19346b1f-b85c-4ffe-a568-08db9cd60787
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 14:52:07.3159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccNlMjLh8ogkCyjgNda6emiXlE75m3ugxpW0FxDChTxAFSUnrD7OYw7m0VznoxB7aK2cTjhIl1l1pwBiVA1dEeaw0x6dI9zGy5eULuUp4BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5636

--------------55FxDnBiyeOeQ5RkyTtwUSqa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

See the attached log snippet.  This is current staging, with a GCC 13
toolchain.

First of all, a minor issue.  Counting the number of
`-D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__`'s, we
have included CFLAGS on the CC line 4 times.  This is something that
appears to be in common with all of tools/ and is probably the primary
contributor to exceeding the Gitlab CI 4M log limit...

Next the error.  This doesn't build when CFLAGS coming in from the
packaging environment include `-flto=auto`.

Clearly our wrapping trick doesn't work with LTO, but it's not obvious why.

readelf -Wa tools/fuzz/x86_instruction_emulator/wrappers.o | grep emul_
  [223] .gnu.lto_emul_fwrite.38.43da3a7fd30cc0a1 PROGBITS       
0000000000000000 01c2ec 000194 00   E  0   0  1
  [224] .gnu.lto_emul_memcmp.39.43da3a7fd30cc0a1 PROGBITS       
0000000000000000 01c480 0001a7 00   E  0   0  1
  [225] .gnu.lto_emul_memcpy.40.43da3a7fd30cc0a1 PROGBITS       
0000000000000000 01c627 000175 00   E  0   0  1
  [226] .gnu.lto_emul_memset.41.43da3a7fd30cc0a1 PROGBITS       
0000000000000000 01c79c 000186 00   E  0   0  1
  [227] .gnu.lto_emul_printf.42.43da3a7fd30cc0a1 PROGBITS       
0000000000000000 01c922 0002cd 00   E  0   0  1
  [228] .gnu.lto_emul_putchar.43.43da3a7fd30cc0a1 PROGBITS       
0000000000000000 01cbef 000216 00   E  0   0  1
  [229] .gnu.lto_emul_puts.44.43da3a7fd30cc0a1 PROGBITS       
0000000000000000 01ce05 000180 00   E  0   0  1

shows that there's something relevant in the object file.

Manual poking about in the build environment indicates that
tools/tests/x86_instruction_emulator is similarly impacted.

Any ideas?

Obviously we can inhibit LTO for the x86_emul userspace, but that ought
to be a last resort.

~Andrew
--------------55FxDnBiyeOeQ5RkyTtwUSqa
Content-Type: text/x-log; charset=UTF-8; name="x86_insn_emul.log"
Content-Disposition: attachment; filename="x86_insn_emul.log"
Content-Transfer-Encoding: base64

bWFrZVs1XTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvYnVpbGRkaXIvYnVpbGQvQlVJTEQveGVuLTQu
MTguMC90b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvcicKZ2NjIC1PMiAtZmx0bz1h
dXRvIC1mZmF0LWx0by1vYmplY3RzIC1mZXhjZXB0aW9ucyAtZyAtZ3JlY29yZC1nY2Mtc3dpdGNo
ZXMgLXBpcGUgLVdhbGwgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLVdwLC1EX0ZPUlRJRllfU09V
UkNFPTIgLVdwLC1EX0dMSUJDWFhfQVNTRVJUSU9OUyAtc3BlY3M9L3Vzci9saWIvcnBtL3hlbnNl
cnZlci94ZW5zZXJ2ZXItaGFyZGVuZWQtY2MxIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLW02
NCAgLW10dW5lPWdlbmVyaWMgLWZhc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtZnN0YWNrLWNs
YXNoLXByb3RlY3Rpb24gLWZjZi1wcm90ZWN0aW9uIC1tNjQgLURCVUlMRF9JRCAtZm5vLXN0cmlj
dC1hbGlhc2luZyAtc3RkPWdudTk5IC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdkZWNsYXJh
dGlvbi1hZnRlci1zdGF0ZW1lbnQgLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV25vLXVu
dXNlZC1sb2NhbC10eXBlZGVmcyAgIC1tNjQgLURCVUlMRF9JRCAtZm5vLXN0cmljdC1hbGlhc2lu
ZyAtc3RkPWdudTk5IC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdkZWNsYXJhdGlvbi1hZnRl
ci1zdGF0ZW1lbnQgLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV25vLXVudXNlZC1sb2Nh
bC10eXBlZGVmcyAgIC1nMyAtV2Vycm9yIC1PZyAtZm5vLW9taXQtZnJhbWUtcG9pbnRlciAtRF9f
WEVOX0lOVEVSRkFDRV9WRVJTSU9OX189X19YRU5fTEFURVNUX0lOVEVSRkFDRV9WRVJTSU9OX18g
LU1NRCAtTVAgLU1GIC5zdWJkaXJzLWFsbC5kIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VG
SUxFNjRfU09VUkNFICAgLW02NCAtREJVSUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1zdGQ9
Z251OTkgLVdhbGwgLVdzdHJpY3QtcHJvdG90eXBlcyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRl
bWVudCAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1Xbm8tdW51c2VkLWxvY2FsLXR5cGVk
ZWZzICAgLWczIC1XZXJyb3IgLU9nIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyIC1EX19YRU5fSU5U
RVJGQUNFX1ZFUlNJT05fXz1fX1hFTl9MQVRFU1RfSU5URVJGQUNFX1ZFUlNJT05fXyAtTU1EIC1N
UCAtTUYgLnN1YmRpci1hbGwtZnV6ei5kIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxF
NjRfU09VUkNFICAgLW02NCAtREJVSUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1zdGQ9Z251
OTkgLVdhbGwgLVdzdHJpY3QtcHJvdG90eXBlcyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVu
dCAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1Xbm8tdW51c2VkLWxvY2FsLXR5cGVkZWZz
ICAgLWczIC1XZXJyb3IgLU9nIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyIC1EX19YRU5fSU5URVJG
QUNFX1ZFUlNJT05fXz1fX1hFTl9MQVRFU1RfSU5URVJGQUNFX1ZFUlNJT05fXyAtTU1EIC1NUCAt
TUYgLnN1YmRpcnMtYWxsLmQgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VS
Q0UgICAtbTY0IC1EQlVJTERfSUQgLWZuby1zdHJpY3QtYWxpYXNpbmcgLXN0ZD1nbnU5OSAtV2Fs
bCAtV3N0cmljdC1wcm90b3R5cGVzIC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IC1Xbm8t
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11bnVzZWQtbG9jYWwtdHlwZWRlZnMgICAtZzMg
LVdlcnJvciAtT2cgLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIgLURfX1hFTl9JTlRFUkZBQ0VfVkVS
U0lPTl9fPV9fWEVOX0xBVEVTVF9JTlRFUkZBQ0VfVkVSU0lPTl9fIC1NTUQgLU1QIC1NRiAuc3Vi
ZGlyLWFsbC14ODZfaW5zdHJ1Y3Rpb25fZW11bGF0b3IuZCAtRF9MQVJHRUZJTEVfU09VUkNFIC1E
X0xBUkdFRklMRTY0X1NPVVJDRSAgIC1tNjQgLURCVUlMRF9JRCAtZm5vLXN0cmljdC1hbGlhc2lu
ZyAtc3RkPWdudTk5IC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdkZWNsYXJhdGlvbi1hZnRl
ci1zdGF0ZW1lbnQgLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV25vLXVudXNlZC1sb2Nh
bC10eXBlZGVmcyAgIC1nMyAtV2Vycm9yIC1PZyAtZm5vLW9taXQtZnJhbWUtcG9pbnRlciAtRF9f
WEVOX0lOVEVSRkFDRV9WRVJTSU9OX189X19YRU5fTEFURVNUX0lOVEVSRkFDRV9WRVJTSU9OX18g
LU1NRCAtTVAgLU1GIC5hZmwtaGFybmVzcy5kIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VG
SUxFNjRfU09VUkNFICAgLUkvYnVpbGRkaXIvYnVpbGQvQlVJTEQveGVuLTQuMTguMC90b29scy9m
dXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci8uLi8uLi8uLi90b29scy9pbmNsdWRlIC1EX19Y
RU5fVE9PTFNfXyAtaXF1b3RlIC4gYWZsLWhhcm5lc3MubyBmdXp6LWVtdWwubyB4ODYtZW11bGF0
ZS5vIHg4Nl9lbXVsYXRlLzBmMDEubyB4ODZfZW11bGF0ZS8wZmFlLm8geDg2X2VtdWxhdGUvMGZj
Ny5vIHg4Nl9lbXVsYXRlL2RlY29kZS5vIHg4Nl9lbXVsYXRlL2ZwdS5vIGNwdWlkLm8gd3JhcHBl
cnMubyAtbyBhZmwtaGFybmVzcwptYWtlWzVdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2J1aWxkZGly
L2J1aWxkL0JVSUxEL3hlbi00LjE4LjAvdG9vbHMvZnV6ei94ODZfaW5zdHJ1Y3Rpb25fZW11bGF0
b3InCi91c3IvYmluL2xkOiAvdG1wL2NjcGhTUWNTLmx0cmFuczAubHRyYW5zLm86IGluIGZ1bmN0
aW9uIGBkaXNhYmxlX2hvb2tzJzoKL3Vzci9pbmNsdWRlL2JpdHMvc3RkaW8yLmg6ODY6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGVtdWxfcHV0cycKL3Vzci9iaW4vbGQ6IC91c3IvaW5jbHVkZS9i
aXRzL3N0ZGlvMi5oOjg2OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBlbXVsX3B1dHMnCi91c3Iv
YmluL2xkOiAvdXNyL2luY2x1ZGUvYml0cy9zdGRpbzIuaDo4NjogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgZW11bF9wdXRzJwovdXNyL2Jpbi9sZDogL3Vzci9pbmNsdWRlL2JpdHMvc3RkaW8yLmg6
ODY6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGVtdWxfcHV0cycKL3Vzci9iaW4vbGQ6IC91c3Iv
aW5jbHVkZS9iaXRzL3N0ZGlvMi5oOjg2OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBlbXVsX3B1
dHMnCi91c3IvYmluL2xkOiAvdG1wL2NjcGhTUWNTLmx0cmFuczAubHRyYW5zLm86L3Vzci9pbmNs
dWRlL2JpdHMvc3RkaW8yLmg6ODY6IG1vcmUgdW5kZWZpbmVkIHJlZmVyZW5jZXMgdG8gYGVtdWxf
cHV0cycgZm9sbG93Ci91c3IvYmluL2xkOiAvdG1wL2NjcGhTUWNTLmx0cmFuczAubHRyYW5zLm86
IGluIGZ1bmN0aW9uIGBpbnB1dF9yZWFkJzoKL3Vzci9pbmNsdWRlL2JpdHMvc3RyaW5nX2ZvcnRp
ZmllZC5oOjI5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBlbXVsX21lbWNweScKL3Vzci9iaW4v
bGQ6IC90bXAvY2NwaFNRY1MubHRyYW5zMC5sdHJhbnMubzogaW4gZnVuY3Rpb24gYGRhdGFfcmVh
ZCc6Ci91c3IvaW5jbHVkZS9iaXRzL3N0ZGlvMi5oOjg2OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBlbXVsX3B1dGNoYXInCi91c3IvYmluL2xkOiAvdG1wL2NjcGhTUWNTLmx0cmFuczAubHRyYW5z
Lm86IGluIGZ1bmN0aW9uIGBmdXp6X3JlYWRfbXNyJzoKL3Vzci9pbmNsdWRlL2JpdHMvc3RkaW8y
Lmg6ODY6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGVtdWxfcHV0cycKL3Vzci9iaW4vbGQ6IC90
bXAvY2NwaFNRY1MubHRyYW5zMC5sdHJhbnMubzogaW4gZnVuY3Rpb24gYGR1bXBfc3RhdGUnOgov
dXNyL2luY2x1ZGUvYml0cy9zdGRpbzIuaDo4NjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZW11
bF9wdXRzJwovdXNyL2Jpbi9sZDogL3RtcC9jY3BoU1FjUy5sdHJhbnMwLmx0cmFucy5vOiBpbiBm
dW5jdGlvbiBgTExWTUZ1enplclRlc3RPbmVJbnB1dCc6Ci91c3IvaW5jbHVkZS9iaXRzL3N0ZGlv
Mi5oOjg2OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBlbXVsX3B1dHMnCi91c3IvYmluL2xkOiAv
dXNyL2luY2x1ZGUvYml0cy9zdGRpbzIuaDo4NjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZW11
bF9wdXRzJwovdXNyL2Jpbi9sZDogL3RtcC9jY3BoU1FjUy5sdHJhbnMwLmx0cmFucy5vOiBpbiBm
dW5jdGlvbiBgbWFpbic6Ci91c3IvaW5jbHVkZS9iaXRzL3N0ZGlvMi5oOjg2OiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBlbXVsX3B1dHMnCi91c3IvYmluL2xkOiAvdG1wL2NjcGhTUWNTLmx0cmFu
czAubHRyYW5zLm86IGluIGZ1bmN0aW9uIGB4ODZfZW11bGF0ZSc6Ci91c3IvaW5jbHVkZS9iaXRz
L3N0cmluZ19mb3J0aWZpZWQuaDoyOTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZW11bF9tZW1j
cHknCi91c3IvYmluL2xkOiAvdXNyL2luY2x1ZGUvYml0cy9zdHJpbmdfZm9ydGlmaWVkLmg6NTk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGVtdWxfbWVtc2V0JwovdXNyL2Jpbi9sZDogL3Vzci9p
bmNsdWRlL2JpdHMvc3RyaW5nX2ZvcnRpZmllZC5oOjU5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBlbXVsX21lbXNldCcKL3Vzci9iaW4vbGQ6IC91c3IvaW5jbHVkZS9iaXRzL3N0cmluZ19mb3J0
aWZpZWQuaDo1OTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZW11bF9tZW1zZXQnCi91c3IvYmlu
L2xkOiAvdXNyL2luY2x1ZGUvYml0cy9zdHJpbmdfZm9ydGlmaWVkLmg6Mjk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGVtdWxfbWVtY3B5JwovdXNyL2Jpbi9sZDogL3Vzci9pbmNsdWRlL2JpdHMv
c3RyaW5nX2ZvcnRpZmllZC5oOjI5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBlbXVsX21lbWNw
eScKY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCm1ha2VbNV06ICoq
KiBbTWFrZWZpbGU6NTQ6IGFmbC1oYXJuZXNzXSBFcnJvciAxCm1ha2VbNF06ICoqKiBbL2J1aWxk
ZGlyL2J1aWxkL0JVSUxEL3hlbi00LjE4LjAvdG9vbHMvZnV6ei8uLi8uLi90b29scy9SdWxlcy5t
azoyMDQ6IHN1YmRpci1hbGwteDg2X2luc3RydWN0aW9uX2VtdWxhdG9yXSBFcnJvciAyCg==

--------------55FxDnBiyeOeQ5RkyTtwUSqa--

