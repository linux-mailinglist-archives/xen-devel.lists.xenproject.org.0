Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D536A23D5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 22:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501587.773422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVfh7-0006sZ-PM; Fri, 24 Feb 2023 21:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501587.773422; Fri, 24 Feb 2023 21:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVfh7-0006qG-LM; Fri, 24 Feb 2023 21:33:33 +0000
Received: by outflank-mailman (input) for mailman id 501587;
 Fri, 24 Feb 2023 21:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVfh6-0006qA-1i
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 21:33:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e043097e-b48a-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 22:33:29 +0100 (CET)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 16:33:25 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN7PR03MB7130.namprd03.prod.outlook.com (2603:10b6:806:32c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 21:33:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 21:33:21 +0000
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
X-Inumbo-ID: e043097e-b48a-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677274410;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d5Su5P1+VSQFCaK7xzz2jg71qjinsOyXOTwnal9daHU=;
  b=cfT9omLJhyVi2D7SDdbR7swbBpaTB9o1/5RFugd5g5O0z6QWkiH+X02L
   qWkIpzQKNX7JNGqHhshjLSgMI8kKwtZjYiqppmKDn5sso3c8P25JMEpyY
   O61JhqDjF4BU6cOWIDCdD0jzZaLzak04aqJGA6muYmzlurexFlOT6gliu
   A=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 97300687
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/BspgK38hdfjaS7XKPbD5T1wkn2cJEfYwER7XKvMYLTBsI5bpz1Sz
 jcWWW+BPPzZYWSge4p0bI+0oRwH6J6Ey9JkHQRrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAWNA3
 rseeAo3VyukueH1kbLrRLVTiZF2RCXrFNt3VnBI6xj8VaxjbbWYBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6PkGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHygANpMROLQGvhC2VyVwGpNVz4qcgW9/N+njWCvGNxgN
 BlBksYphe1onKCxdfH3QgeqqXqDshkDUvJfFuQ77EeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty8bniJE+iFTIVNkLOKyoiJvzEDL5w
 TGPpQA/gakeiYgA0KDT1VPKnTOq4ITIRwgd5wPLU2bj5QR8DLNJfKSt4FnfqPpFd4CQSwHbu
 GBew5TCqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meK0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:j+heI6DI4e9FCXPlHelc55DYdb4zR+YMi2TDt3oddfU1SL3+qy
 nKpp4mPHDP5wr5NEtPpTnEAtjifZq+z+8Q3WByB9eftWDd0QPFEGgh1/qB/9SJIUbDH4VmpM
 JdmsZFaeEZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97300687"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mkr1EQx6w8p3g4RLfyn5hgqeI/SwQZtKQe3zxpVYgKaSO6uRldy/SQIgIqs482e0g7ijRrRnk4C2jgVIFxV5JZEnyBjiyK7Ide/cnKYDxEpckTtUHxR7bolkj3QSnb966gIsrUkcyU9UYgFGK+vQtJF/6chJY8bIXggg3X+cSP/6HC+4VxdxXPbd8InOCfMqgpMNHAvvRLE6zttTJRe/zseB+65lvncTJ3jhTWVp58K7dOCgldQ5NQC9pGBwGppIrhsnVIQzih8WTv885aKgUvPiVVjLKx4fTGJU94OU4eEoaNicAq3yq3tgwBxCUANFOn1C8ZvZJzKKFuMNyV9pLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5Su5P1+VSQFCaK7xzz2jg71qjinsOyXOTwnal9daHU=;
 b=G/ebgzuYVeT7FOyhFPBm+BxHlYEYIUXmoKdKUdEctMbstQJa/9LLUZo2IkFI/Q8ONxG8rW/lP/vYOOU35np+iGVVBeyJWIQ37FD188J4IHwY7JmeJTMYY1nF1w3zR+4g2NRkEpiIrAZLdAyBQnqvkFOddhsxUl9DMSMtNM6PzapGyExo2llgGE5f1elrfYGcqU3jOrwmmdr2UgP5gYiZIl+6PWls1yjGeudAzDG6nmpgWHkfed8aVKg8UYMBhA87Co77i4hZ0FycD2UYlh0dObJ0xcbRerrl5GexJ1Y23GM4evLobKJ2hOFcud3ePzVgaCRJMzJiAsDuCrRpRI4HAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5Su5P1+VSQFCaK7xzz2jg71qjinsOyXOTwnal9daHU=;
 b=rlMsi6VlvFxaWBgZDWoohcDadkG9agNSdLEn15Vdv0CCDN4aQGik2/1+SmxJUli4FedU9j4W2ASFF3ERdneQjHZiO4IywAeW7lYXY9NUI2wCF+NJyz4FuwMDA+fFYCciTcifr3pUUJJ/iivvWb7k3c9TThNS39BOS620zz1bL7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
Date: Fri, 24 Feb 2023 21:33:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
In-Reply-To: <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0157.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN7PR03MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c17136-b919-4fc9-cb71-08db16aec068
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mzdjr6g/EisBmjrJnUU4b6FPP2sLD02qVCtuzHLjr4nh7IYpgpTHk1bKzoYG3OJ9XOPML6Vb+6dBq59KHMSKbOs7l45yMVIESS5m8cNIFVfjqx0Nlr+UvPYCb9UILco42oGEZf4cT2anjHYvsEFvD51LHIsrLWbH1PJZEdqGuDlMasrrbdH6dUYerKakXf6Hl4PhZCs/Jh3KW5ahA5hVhl0sNZT0uKrzntji9blEuy6dXJGYDuOo7hRMxmJC5Hw1i6weYdW0/QNQ0R35jhS84NZAcsFhLkg/lwBQCrFMzWM64hsNOkQ9rsZ59oVb/UklaZAqWw50nri/E+S3BSzjcJpX7/28FJ/8rn1BkqbFsvfpEXkUapS9CmTfMgD8gQJhc+rUQw9f41FzCO5nXtoYR00z7AKxvCCFh31wVV9SnMJQWLgNaWilwwKLrMr5zgBLR8XtGz1OLIbUiH8ssHUFQYR0wwWD7k1D6+kor8eHWItvypD74y/tkqncvH0pcdVzBR+4wbNEWdoseZrcCXw7LlxoF/OMOGK2Ln6T6xuRe2LP+5E3OK35Ak+sm/uTtXz4BWntaH4UYp98QG1x94wQNOkVZ9Zil5n6M7+AynMnz75Z2GbjqzpU1BQUWByhoaXY54l7XcK0CdXfuipC8urGPb37JwwGrCLkUhKS0WZoJ4agLOKRgSj2xKKblpGZ7+mBidbkNA/LOculrEsjYQZ0CmFxexPC8XawepLbWdQ/gss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199018)(316002)(54906003)(6486002)(66946007)(8936002)(38100700002)(41300700001)(66556008)(8676002)(4326008)(5660300002)(6512007)(66476007)(478600001)(186003)(6506007)(6666004)(83380400001)(26005)(53546011)(36756003)(2906002)(2616005)(82960400001)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djEzKzk1WE1RK2JhbzJqY09KSnpadW1Rd0luYWx6SVdQYkpTVmNzZ2xGWVJB?=
 =?utf-8?B?TUYzUXpBSjBMZlpNWnBlUzNibzJnUkFuMnhSakJXUlRmKzlISzBzd2d5VW8r?=
 =?utf-8?B?M2tCOWk0OHZJZ1U4T29DM1o0WHV2dnpkVVZVK0RYNm9YSUU0Vm53eE14K214?=
 =?utf-8?B?U3djL2pLWmpkY3RVT2loRklwWStJbnNZNHBNN1lNM1hpeTkrQ2FkNHRTOHJi?=
 =?utf-8?B?SkRoeWlVSVpWdkY0TzhoSDhTNWlEcUEyTXQvYXRRZUNDb1JtdWtTY1AzUC9C?=
 =?utf-8?B?YkYrVTRWZytkL0hZN1h2V3FPa256RDNiQzUreXY2OEtCZFpiL3NHQWNIWlJE?=
 =?utf-8?B?V2s3Yk00Y1doY0k1dnNUalhENVdxandwSEU1b2hzN2kyamd1bVZNdnowRFhr?=
 =?utf-8?B?eE4ydG1GS1JCQkxkZEl5bnYwQTNQWHNIQXAzOWtYU3duSHdKakcxMFZPcG5F?=
 =?utf-8?B?QURKZG42Tkg2MWlpUk50UUJMMzh1bTY3N3hFcUVZYTlRRmNyKzE1aU1tT0dZ?=
 =?utf-8?B?M1MxTHN4SC9VcFFDTjg3SldSUlFUaVVLQmxINU81L2JYek5tVlMrZVU0cnpG?=
 =?utf-8?B?Q3pZaENyZld3WXhBcjZicEFkRmxJZy9EY09qWlFqNXdvLzFoekhZTG9rRnFP?=
 =?utf-8?B?Nmk0ME5teXNEbXpXeEtVaDkwNnBleUNLK0FvT3ZMY0lRK1BjOHhYY2d3Rk1V?=
 =?utf-8?B?VjcrbTI4T2NDZE9hNVRsa1BOektkaVpKNWwycUxlZ3kyZVpwNDBRMkdWclFC?=
 =?utf-8?B?MDR2Z2thWVpjVXUxSi9JcEVQdGZOR0FSSHkwc3RWSUMzT2YvMHNKQnlWSWZB?=
 =?utf-8?B?MzJScGVoMDU3M3hmNTJJcjdxa3FUcVRGRUVPQ0hsR3NodXhhMUQ1SHdsdFlN?=
 =?utf-8?B?dXQrUUQvdjhGV0hYcUx0cCtqb053dWZDV2FnR1dEbkRoOUVlM3VaMHRvY2JL?=
 =?utf-8?B?dzdOOXJkMVo5Tnd3TFBUczF5OWs5OG02M2N5MjRkK21nVGZqZktOUitlUmJE?=
 =?utf-8?B?aG9DTUFNdmtIbVB3WUJ1eGxyMVNBZ1g1ODA5Z2lIWWtLZWU1Q2FoRjI5YTNl?=
 =?utf-8?B?L2dSOFVLT3BWVlNST2daM1Q2UzBPYWhGNm15aGU3M0pXTU53N0dSUXRFUlNG?=
 =?utf-8?B?TVNQeFZEUU1pMlNxMExIQmpGOE9WZnFGRWEzUnFsN1VleVl3L0NGWDlLRmhn?=
 =?utf-8?B?MmlHWGpFbGZjZDZoVzBkS05RSDRQVEFsZnc3UzBydm1rM0VlTWhOaHZlT0VM?=
 =?utf-8?B?VGQ4K3lKSmlycTQ5U2dZTU45T0IrVjRrNGtHSGJxc3RQNnVjWVRiS054Q0xx?=
 =?utf-8?B?NmNHZHNpTXRITmFzNytCK29UMWo4M2sybXVjNGlpNmk1M2lqVXJlekFYSjBX?=
 =?utf-8?B?QTJmeWNrb2FCVzVxWUJwbUZva0lKRk9YQlhiQTRDaXhoRUhNWCsybjlKVVBh?=
 =?utf-8?B?Q3ErY0RpcnhQYUFIbFFZTGV2UzhlZTVtWmdndS81Z0t6VjliSjNmWDRrNitx?=
 =?utf-8?B?K0lJNFZJdDFJWmE3OUxsK282WFhzV29JbEFwbXJOUWZxZUxZL0dveFRGQk5B?=
 =?utf-8?B?bUdHaGRVYW1JM0NwOVFrYlkxRk9BcjRsTUI1cCtPRElaODJvY1ZXTHQrOExk?=
 =?utf-8?B?RlprdC9aN3BUMkRYYU9qS0xlWk9UTE41Vm5TY0xmNzZyUGtyMFQ5RlpUdC9H?=
 =?utf-8?B?amhhODBIY2NjeGRxUGhiM0lQdEh3ZUN4NWhKZDBSNmU0WDBBdXpIbVBpUThB?=
 =?utf-8?B?dFdIVGs2MSs3TldGR0YzOUxQOHIxRFhHU2J3Q0JZdDRmd0ozRHdzTzJld3Rn?=
 =?utf-8?B?YjR0b1FscU82WlAwNUJESjFNNEUxQWczRXl1a1E2SHZNQk9FeDk2RVRUaWtp?=
 =?utf-8?B?MzllWmpuN0kvckRSUjJyRVJlNUJXbFJmcHc5UEQ0QkJ1YVlOeE5QVVNUOC96?=
 =?utf-8?B?RzV5TCtwaG52alJiN3cyRlgxaWdrVDlIaHhkL3lpRE9LZ0hkMm5wa2w5V2lH?=
 =?utf-8?B?dEVuNXh5amRPWFNFazF0N3ZSWVVBY0toMWFpUkdGS3N5amtqSnZkamdZUVZs?=
 =?utf-8?B?S1QxSHFIN2JVei8zaGprWkYySzByWjYxdXBkYXhtbXFiaUxIMzFLN2VYQytZ?=
 =?utf-8?B?akF4Z1dINzJYU0NjVm9QTHNlYW1jaVprTVpMRUZVN3ZDWmVTLzZQTW9icllU?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UZkmxKhv64Ijnldor02OjKkBtXQ+iIL/ePtdpi2LrWBqN7Bp9IsDWJDYmAj8sdMOa4TeGSANV4g1OA+QYAhiKQVraH6yufY+TNKKBB7qghNW0i/fostF9CGKaP6ezV0VMX9NICuh7tMwfRlUL0gWi8ESOPt+s9G5PvDA4C+esjQt8ClcCd45RCDKr+Gzxz3Tz94EBHfrIlQ6Hx9R8b6SZ6LY4gmM9GObGizmR0sghukICW5a77RE1qKoZJfnIYusmMJAxu10mNED0UEMWZxuiVlVzuZIUMEjvrw7FvNqt5vm7sDLzVEYJb72O4CUZI/Q/ANptJEjh8PbwFU9ItteoTIhnW8sWtQ2G6QrSOeTWWY7rhjGXCSWb72c7vhQXJY2Iatowx+cNhi+It3HI5OaViCSxAoXSfz67gXLpBL6140J+bolYcV6qPf4a8AqjdqwVaM+Ifo+L8olT540vNZjEiOuYR/CR0CEzU7tE91iJfUGLemOp3NBo+jf4gvk30LkkkmKXF5ghb9OlmCBuCQnOju2gtGFB6nAHCf86X/FKBDKcM+ab1K0If/qOqrb6+MkAz9EU19cHcBK93Tx0Bb1MgQeqRtuB9YoMbFiiyvZHHvXde3uarov6uz0yRAgSAePfE4IV2LfiUFi//Qr58VjJM2HQ+GbXdOHLylDMlT4d1MeTomiK0m1YzrQT27S/xWdG7D7mVddSa60VhEE7VymrCrikCp/vbsttFg9Xbv2oRZ3MHSEJXf1woNkZ1r1UMGcyqP6+EYYxKgaXackRySE38AvsNRELLuS7Hw/Bz6VHbRRXU3eR+fOQPIiGk1jFg3Aazv11KUQgvFgG5oYR98uPaC1UeL8R9oggXKpaAWkp4/FtPjicoWJ/l/GuV9IVvjX
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c17136-b919-4fc9-cb71-08db16aec068
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 21:33:21.4395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hc0geAOlqWbr9HjtwuJwusKBFyU7WbJGVTHMuUQSX7WHB9qUjh34vdG2rV9EYBVbS1rfwhJyHc8MO4HgeQ5jaimerXuWSXkR8mRaBehtZhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7130

On 24/02/2023 8:08 pm, Xenia Ragiadakou wrote:
>
> On 2/24/23 21:29, Andrew Cooper wrote:
>> On 24/02/2023 6:49 pm, Xenia Ragiadakou wrote:
>>> There are more detailed per-patch changesets.
>>>
>>> Xenia Ragiadakou (14):
>>>    x86/svm: move declarations used only by svm code from svm.h to
>>> private
>>>      header
>>>    x86/svm: make asid.h private
>>>    x86/svm: delete header asm/hvm/svm/intr.h
>>
>> Thankyou for this work.  I've acked and committed patches 1 and 3.
>>
>> Note that you had one hunk in patch 5 (whitespace correction in
>> svm_invlpga) that obviously should have been in patch 1, so I've
>> moved it.
>
> Thanks, I missed that  ...
>
>>
>> Looking at asid.h, I still can't bare to keep it even in that state, so
>> I've constructed an alternative which I'll email out in a moment.
>
> I 'm also in favor of less headers.

I've committed as far as the nestedhvm move.  At that point, I've sent
out a small patch to try and help decouple later changes.

But I think we want to change tact slightly at this point, so I'm not
going to do any further tweaking on commit.

Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
updating the non-SVM include paths as we go.  Probably best to
chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
only got one tree-wide cleanup of the external include paths.

Quick tangent - I will be making all of that cpu_has_svm_*
infrastructure disappear by moving it into the normal CPUID handling,
but I've not had sufficient time to finish that yet.

Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
disappear (after my decoupling patch has gone in).

After that, hvm/svm/vmcb.h can be cleanly split in half.  struct
svm_{domain,vcpu} can move sideways into hvm/svm.h (with a forward
declaration of vmcb_struct), as can the svm msr intercept declarations. 
Everything else can move to being a private vmcb.h

Finally your svmdebug.h can come at the end, pretty much in the same
shape it is now.  One thing to say is that right now, you've left enum
vmcb_sync_state public, but it's type is already decoupled by virtue of
struct svm_vcpu having a uint8_t field rather than an enum field.

And I think that cleanly gets rid of the entire asm/hvm/svm/* dir, which
is a great position to get to.


Beyond that, you will want to clean up the hvm msr intercept handling as
hvm_funcs, which I think will decouple the vpmu files from svm/vmx
specifically, but that will want to be a separate series.

How does this sound?

Thanks,

~Andrew

