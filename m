Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AE46D9499
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 13:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518830.805741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNMK-0006JP-F9; Thu, 06 Apr 2023 11:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518830.805741; Thu, 06 Apr 2023 11:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNMK-0006GS-AG; Thu, 06 Apr 2023 11:00:52 +0000
Received: by outflank-mailman (input) for mailman id 518830;
 Thu, 06 Apr 2023 11:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkNMI-0006GK-I6
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 11:00:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f4623b-d46a-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 13:00:49 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 07:00:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5683.namprd03.prod.outlook.com (2603:10b6:303:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 11:00:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 11:00:44 +0000
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
X-Inumbo-ID: 48f4623b-d46a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680778849;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IlpTgSJI9pfA1iEPVzxBYcTZr86Ef7T3f6t/Sx2AMZU=;
  b=NlJFMGcRN/Txd6Dek8Ua9BNaPR1Vqx6S7XEG8/FMBz5hWvPz1fCyXRJK
   f9mbYp017oQtBZqnU+HBpUYKQtRM3VeaUwX/G70BIAOmja6VfdQfUa/iU
   SDFSF7HejnPP06CUptxk3bo6V1i6T4oVCTUy+AAuGcYKMMiXi5hxCV3dj
   k=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 104458869
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qZix3KDgzAsPuhVW/w3iw5YqxClBgxIJ4kV8jS/XYbTApD50hmcFx
 mNKCmCPPPjZNGqnL41zPYvgo01SuZOAn9BhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9A4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+PReBjl+9
 NAiChMTZzCxpsyTy5ikc7w57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuza7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwX+mCNJMRdVU8NZMqmPL5lE1VSFLdmmRmueVsUGbA+pmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpa9sgrsY6AyMr0
 lyhmMngDjhi9raSTBqgGqy8qDqzPW0ZKDEEbCpdFQ8duYC7/sc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:gzQPWq88LBiHJJZZ7a9uk+EKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVcqKRcdcLW7VJVoLkmskaKdjbNhX4tKPzOW21dATrsSlLcKqgeIc0KRltK1vZ
 0QC5SWY+eAamSS4/yKhTVQJ+xQu+VvvZrY9tv2/jNId0VHeqtg5wB2BkKyFVB3fhBPAd4cGI
 CH7sRKijK8cTBPB/7Lc0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfMJ8H
 TDkSb++qK/2svLuCP05iv21dB7idHhwtxMCIiljdUUECzljkKSaIFoS9S5zU4ISLXE0jcXue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgFP4yPaJDg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn93d7VTBtn/3DE6kbKqdRjwkC3bLFuIYO57LZvin+9Ka1wax4SPbpXWN
 WHD6nnlYlrmB2hHjzkV1JUsaCRt0QIb2q7q3c5y7aoOhht7QFEJhgjtbwidzE7heYAd6U=
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104458869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aM9cyZ+1c6w089f298g0+DD8RyVvyvnLcmRb6lNec9hy7OGsbGDTU4r1pXVKx6jLFfharGl06WBt44Q+kXm/WZYrO3onCH2MubAh+BflPbe4nUH9qIwGLmU2XEx0ViXETqg/Tmu8GUm6sTap6eBhEae+LDPXJntoHvZP5x+3noBExAmFK8By9E5oQ9LPIoySTnuT62vyTspDUvZzGi9+7R6NNSFOtI7RQ90zSIzcD0kphXDrB2k9pR57Q8zV+ozLr8xBhcmAZJMwvBU17F2tspc3fr4edYLajkaxPEScDgzvfG0V3Y6gwAeCCFL10piMa1ykXLY71qmWjTx7jsGtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xNSNKUP7UWFvHKNJukQfcArgYn3YiCjUe8bsow8ens=;
 b=OGjC0bWBb+6lF1MCSGZalYbQXc9yKq3TeSsYdK1KFeMkFiB8F0RLz7S1PAuo8eegAfvSAdYhbF6RSuogiRdjOJopRzxi+jKNxcu84bvYzB4jV2R6MllPL0ld9m3vPckmJeqwCXba8NuCyA+leol3JeEDu2q53mcOoa1ewhywd+Gqo5A2lFkc/+Uqt5LlsEOS2aNbgzx4ws2HjPwQgaZHzPGZ8EL039jFEjpP/ezjXw9oqHLkTESpiftfo8P9ja53PMlbTAozEOekg6E5pWl8YqXB2n0m5QGGrbp3z6j09Camt7LVi1gEXNU7ReY8e/nh0oHXZZib0IxwmZ0OMIanGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xNSNKUP7UWFvHKNJukQfcArgYn3YiCjUe8bsow8ens=;
 b=dYzRhre05yY9j+3nbifdi0G7JLp25/Uwx96uMIy9mUQ+98RA9YxzXfGxTCR4oQhYfguMoJICMMtkIKVndnQzEnHQQh0mDtcD3gigBECN/dcZwgYMzbSUlr2rNZmaOezk0S9g1fcDIXpGcXfY6NOHTXGs9i/1h0vee3JqzPi5uHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <00396729-4e60-902a-dbe4-e2ef9ab3fc19@citrix.com>
Date: Thu, 6 Apr 2023 12:00:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] livepatch-tools: remove usage of error.h
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20230406091807.49028-1-roger.pau@citrix.com>
 <4525547c-e309-c994-3dc7-5d1b398aabe1@citrix.com>
 <ZC6k0VNwb/+VzWHP@Air-de-Roger>
In-Reply-To: <ZC6k0VNwb/+VzWHP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3473c0-7d7f-4ba1-b20c-08db368e2ad6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2N1djKhdwr8Ea37Mua45Qb2b5b18jvgmp+ZnAH1l2prOXyHsYmR0ll9PFFRDrQugGkKYhbknCFa91kFETg2iO5H3P6C1V8qewajNMilruglUkyYbTqtnPZx0qTo8BFVGFfAoHbPkYsBe/TER6wifd2tmr+UmTs7Ibt/Tjb7hjOr+0npywaylpyoz3f6pTJTOWhEeL58FRn0O944nvVOZe6wULgN+s/SCBBluCNMF/XFr1cDXkve1ZZ+X//hxK1OJQ7gk1UklmF/jiaR0L3ZTIiWoq00ajJ3ZECU2EO7HIjjRtGzdCR/CiMI4fE3+kK4T1akq2PF5xl6mmHsVOVIms9i72Q/xTfN/MLLGa7ty1bl8FdIq06JLNCvH17lJ+rRSNZ2+HqyCAseeAP5XBAs2qJttwaruNRBbndBdxMSmRx3NJ+ZSFBkCnf7QBDOUYi+o1gIowpi0i4KqYcHiptwe2nFWEMDJ+xf2GCTdnVQjeHdMRvEOV8fhjuXso6BcAQbwoJfOcgK5nBtdtIPoloRA6u1+ER0cXrTzroGFDbkr+ynna/EyA3+mqiT8Zh1kivWwE6QMc5UNVlfacE927hfnTgaUSHggJiQ02/TxRwFnlcRiAluMzj/lVF+/p1G+9dhJi0DkMK6AiEaItDWqXC7X6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199021)(31686004)(6486002)(6666004)(478600001)(31696002)(36756003)(83380400001)(38100700002)(82960400001)(86362001)(2616005)(53546011)(2906002)(6636002)(37006003)(316002)(54906003)(6512007)(186003)(107886003)(6506007)(26005)(8936002)(4326008)(8676002)(6862004)(5660300002)(66946007)(66476007)(66556008)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTVpQkVjbmFhR29ocDlxWStSbFNRTTlDQlIyUjlJQ2Z4NXJpeUFrNWFnZndL?=
 =?utf-8?B?bmF0LytBN1ZIZE4yWm85STRxbFZubzZ6YVFJRFozTTlLckYxZkxaWmo1Um9Y?=
 =?utf-8?B?bzd2TU85RkpuYWVET2t1SWIrSU91U3VYTEJnQjNWMFluL29JbHVzeVJHaXJM?=
 =?utf-8?B?UVZnQWExY0tUL0x3WmVraEZQQmtJa1h2L2d5Sm9JT3ZCcE5FT0kzSlFnajht?=
 =?utf-8?B?SkFOeURXaUs1SysyK0pOcU9mSWJSeFkwaTdza0w1d1hXN0p0L3I0dTBFbXl4?=
 =?utf-8?B?TnZxTmN1SGpGbFVNbGRDUUdvR3c4NC93cFZPemhpZlNaOHZTdUV6Y2cyc0Ra?=
 =?utf-8?B?dllXbkVYRmVyVXp3Y2lTUWxPdVBKMDYrclU2QXNKbGYzSUFFalBxWE02TjBp?=
 =?utf-8?B?am5WNDZBWDZOVndjV1ViSXdVQVFwU0JKVGpmS245NmNhTFUxQVBXNURSMDdN?=
 =?utf-8?B?TFZCSjE1c3BCSVByR1A3NFpYdXcvS1NFZCtqNHdXL3FtWUxkelkzRnJxTHFo?=
 =?utf-8?B?RjU2RlVkdDFlWnZaaVZ3eEhsNm5NWEhZQmJwMk9iaGgxaDdzT0l1bUNWdmNE?=
 =?utf-8?B?WEdHQXFhd2ZFdVdyNWlwR2xqZXBkVU1BVjJzb3hVaXZaVGdFaStKS0FDbENV?=
 =?utf-8?B?RVVFRGhmT21aVlQ5ZHN6N2xZVjA1YWJOYU1WVjlySFptMm15RkN3TEpDLzJT?=
 =?utf-8?B?S3Fqdm56eUgrbzlvT2JyYithQTcvdGdJMGdmOFRmWWxhcFZva3hRUWlxRlpD?=
 =?utf-8?B?U2U5RG5hMC9xVGI1RHg2YUsxdDhKRmROclA1elFra2JsNlQrUG11S0lBdG5x?=
 =?utf-8?B?TStrR0pYOWhaczZTY1pzcGh6L2NkamZwTGxVVDBMTVpuN0hxZEFWSE93aWNs?=
 =?utf-8?B?TFB4SnE2cHJacnBTaG5VU0VSWGdxbXR0dU9WVU9CaDVMckpVTTh5SUYyTzlI?=
 =?utf-8?B?ZFR5WEFNT0p1WnFjUk4wdEtDUnNkcmJiYUFYOVFaMklnOWNrUVdSalJxcTkr?=
 =?utf-8?B?RndMQmFlYjZORjdKT3lwUEwyTU02aVRPaUlLdThjWW9DYXoyUUhrMlNSYnNy?=
 =?utf-8?B?YjVDbGdJZ3BkQlltbldwazhsYi9sTE4rQ0NOdFVQTmUvVFBRRlFhbkQrdm4x?=
 =?utf-8?B?MVNHK1hWR3JvaDJNeHBzVklHQlZxbGxxQlI0bHpDd2laeFZFVXJhQnhyWHVh?=
 =?utf-8?B?VlJhMlZYc3ZDSWZXaWNpSGhXR1FrcEd3ZzlYZVd6WUpTNnF6TDJldkhaeE1E?=
 =?utf-8?B?dFMrRkphdFRxZ3VVSkF0Y0hNOXRieEZ3ZXhBT1Q5RFhncWh0bXFXVytlOExq?=
 =?utf-8?B?aFkzaHRKWVlqNW9BZ1NCL25RQmV0MkpMVklmR25GdytGTWoyZEVWRXlId2pW?=
 =?utf-8?B?QTVvd3hUQytybHlUOXorMUJWYnNaeDkvcUdwRmI0dFplc3J0d1d4cmpMUFlv?=
 =?utf-8?B?TyswZTFGeGs4Sm5pYlRlRG8rckpycTFDNHhuTkl4aWxwZllVSGYybjU0ekNK?=
 =?utf-8?B?ZUV2R2xlVXc0WmkrYmZjQjBTQk5lZnB3R0Q1Zjl0dlgwVnRibjE1Vlk2RE5O?=
 =?utf-8?B?ZHdCWG9RdGNpOWFSUGNrVUpPdHpaMEtraFZNbWxCbTNaa29La2hUSDB4QUxN?=
 =?utf-8?B?RWlZb2hXaDBIMS9OMDNpVWNDRElkNzdmL2I5Wm9wa2xGaUNkYUdXRndYbDJI?=
 =?utf-8?B?ZE9vdS83RCtGVVRBb1RXZUd3QlhJRjBTOVArWmlGZjNrZ0ZCZUxDNlJjMVBJ?=
 =?utf-8?B?ZjlmeFVmSFNydzQ3b0M4UXRnVkxpMkN0Tm56OE9lWjlhSmVpMnJZSzNmaTAy?=
 =?utf-8?B?Q1M4NWZzNWFoaVBvRnhYTVdqbXhib0pQVnNmRW1EM2dYVWh2SDdCd0JTTnBz?=
 =?utf-8?B?aHlTblBrZStpZ0hWQi93VnZuWkFUYXFxYytTWlB6SVIyV0dReE1vUU1Xb0dZ?=
 =?utf-8?B?R0FkWFhEbGk0OG1Fc0EvU1lySTdyMHpVT1ppYXJiMWpEczJ1YTBlQTgrWW1t?=
 =?utf-8?B?VnNyYStYTkdpSG5GTUh5c2VmYVFWL1U5cW5URWV5eHJ1YThmeTdGRmF6Rm8x?=
 =?utf-8?B?V1VqQnpUS2VjWHU3YnBQZkdPaUM2cUFmWEk4YkIwaU4rQUZTS2g4b3N4b0JK?=
 =?utf-8?B?YnJOM1FzWEN1d0ZmWHZnWFVUNCtNa1Q2Tk5wd2NiWEx0MTJhMWdkUHdhQkZX?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BTo38nGMK/GWwpRsBwTncd08KNFD9S0mjLv1yGeDHecWbFdBUg8YvXEmJuWxZByyj/tRNFECMm5CuDwzbi8ekqcqsQTjeEjnMi3pF/LnaeWnp/syOPzDJHMl6fChTbgW/LFFDekHJ+XOKHXFqDaGZsah6W/3zsQcIb3rVcxDPyV8ZrkjZpw341XpmUD74QII2nO0xjMT41V7EVbS0UYYqEbo2Ws+7YVQZBmEhoF1e8UkfgsngkharR6mfjQG3WeeNdasDTTcwRjU9iFkggFh6fm/wH4/4LYOnwGUl2CObjneJUn+bYME9CvmNVzClLMQsv4BVfZED1HhIXDIPy3qEvToi9IvW3/QaKjHse7+nB6skF8zve/cgdmxWOpQwvV3QSP8TZJEyqNiXzs0hA3+/xuwXHYMwl0ALXJvX6OCIahIkaN3SsqpTevvrgeZCOh5/b7myqWVEjJXpVVDxtBcautwBBvu1awv98BOiKkrPjlUlYA2BCM8ugw5DFCaQJMe4b8asmsfBKy8QZfAGbK2V2m6Kq5NvxCGXehzNoly+qXXQY3RWNhKcnZR6OvCGEyu+8SulWZassRkyp9Xz/hG/UtKBbmsZQBk0Tvpxfz9uyigISWg17Zzkp3lve0ZxpmpbkEJuIBxGsdcgedQyCOn4XNSYgeQw3vaAtpeKkzFCZb/59wXsLNGMYat4b6EUIGxf2q0ysSB1qrocsaIRSmM5iQYP89UvUX0jMKQeIYwvwxnIr0ijxdyRporKioALXJ4FdtXyEwy7glavATHpGqSJjD/DksVn+Li1wPhiVWdGQfzQay1nMuKZFDrZ4+QzrV7
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3473c0-7d7f-4ba1-b20c-08db368e2ad6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 11:00:43.8040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+heuQvxkz7any2GBjAi1FeZAO29rjz808ejCd6TEkZ3kkA7+AhnZooSzWSAIiUaWD+n2y9oCl/bruQdLEW+MwM3BMaud5tFuGXoJ2V9RJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5683

On 06/04/2023 11:54 am, Roger Pau Monné wrote:
> On Thu, Apr 06, 2023 at 10:36:37AM +0100, Andrew Cooper wrote:
>> On 06/04/2023 10:18 am, Roger Pau Monne wrote:
>>> It's a GNU libc specific header which prevents building on musl for
>>> example.  Instead open code an equivalent replacement for the usage
>>> of ERROR() and DIFF_FATAL() macros.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>>> Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> ---
>>>  common.h             | 10 ++++++----
>>>  create-diff-object.c |  1 -
>>>  lookup.c             |  7 +++++--
>>>  prelink.c            |  1 -
>>>  4 files changed, 11 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/common.h b/common.h
>>> index 9a9da79..ec2ea33 100644
>>> --- a/common.h
>>> +++ b/common.h
>>> @@ -1,18 +1,20 @@
>>>  #ifndef _COMMON_H_
>>>  #define _COMMON_H_
>>>  
>>> -#include <error.h>
>>> -
>>>  extern char *childobj;
>>>  
>>>  #define ERROR(format, ...) \
>>> -	error(1, 0, "ERROR: %s: %s: %d: " format, childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__)
>>> +({ \
>>> +	fflush(stdout); \
>>> +	fprintf(stderr, "ERROR: %s: %s: %d: " format "\n", childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
>>> +	exit(1); \
>>> +})
>>>  
>>>  #define DIFF_FATAL(format, ...) \
>>>  ({ \
>>>  	fflush(stdout); \
>>>  	fprintf(stderr, "ERROR: %s: " format "\n", childobj, ##__VA_ARGS__); \
>>> -	error(2, 0, "unreconcilable difference"); \
>>> +	exit(2); \
>>>  })
>> Looking at the usage, can't we just use err() instead?
> Hm, err() will unconditionaly use errno, which doesn't seem wanted
> here, as in both cases errnum is passed as 0, effectively preventing
> printing it.
>
> I could use errx(), as that doesn't append an error message, I think
> that's available on musl.
>
> Let me know if you agree with that substitution.

Yeah, anything in err.h ought to be fine.

>
>> Also, I suspect you don't intend to delete the error message in
>> DIFF_FATAL() ?
> I didn't think it was that helpful, but I could keep it.

I'd be hesitant to drop it, considering how much shell parsing there is
of these tools.

But ultimately it's up to Konrad/Ross.

~Andrew

