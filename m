Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE1354DD7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 09:29:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105649.202062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTg9U-0007di-Qh; Tue, 06 Apr 2021 07:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105649.202062; Tue, 06 Apr 2021 07:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTg9U-0007dM-NN; Tue, 06 Apr 2021 07:29:32 +0000
Received: by outflank-mailman (input) for mailman id 105649;
 Tue, 06 Apr 2021 07:29:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgwS=JD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lTg9T-0007dH-8L
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 07:29:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e98721e-934c-4694-adfe-7ec3994501b0;
 Tue, 06 Apr 2021 07:29:30 +0000 (UTC)
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
X-Inumbo-ID: 2e98721e-934c-4694-adfe-7ec3994501b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617694170;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4Ww9wXXPGkM2/E52FDo0SFlPVEKaXXM1ywRi2WExDMc=;
  b=UVwETZ0CK8t7TtOvB3OS6puxpMY7BjadO5vzFnZwUpoWlsvi9Bp5dTru
   Bf0N+YjR85Prw2ofC8Sq/gWFNIbtYPDbAu0QPvspYEKydA1ikQni3NTMb
   echKAzmMKUjUF98hlmKuFx/fwP2FofUNq5OgbNth/lrxPcHUKeaFSkc+W
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N/DowTvzGPe2tJNuA73e7yFPMSJNXsXjwiWLTQQaQZfb9p0B/8tlpEfJu3iGf5auscHR259JCj
 DFjGbn+MpGNzxmcf1hoKMdQMzt6VMSCBaH5IMxbSDYrIqCT2/z6m4HEDSPZbE9SVgmxWRNMrb1
 3Q5DrzKlfhTwEt7HD+Qq9TtQuBw0VJDWAWzFhQH1ZEgZR+l72K4CzuvDp7qdCnmyR1bX2ekOnp
 ENMLlvkRhfhYd037IzVJE09xszbYAZUVQbSuGX6Amd+C9YhKXdt2c0ld6OSnvyTpdJwnxXR3uI
 wY0=
X-SBRS: 5.2
X-MesageID: 40946663
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vr2Yba2rJPzdM5SwsIN/MwqjBE0kLtp033Aq2lEZdDV+dMuEm8
 ey2MkKzBOcsloscVwDufTFAqmPRnvA6YV4iLN7AZ6OVBTr0VHGEKhM9o3nqgePJwTb+vRG3a
 ltN4hSYeeAbmRSqcb/7E2GH807wN+BmZrIuc7kw31gTR5nZshbhm8SZzqzKFF8RwVNGPMCZf
 ihz/dAzgDBRV0nKui9G3kZT6ziirTw5fbbSC9DPTBixCmi5AnYjYLHLw==
X-IronPort-AV: E=Sophos;i="5.81,308,1610427600"; 
   d="scan'208";a="40946663"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlG9DxylwRe43blyWG4UQnRgTrRB5NdYCRXzYTYFDB7PHyz2OZGzO0YjMSyXeSB5BuUf9YACwvH7W1QDSiSLia+Njgt0fkOpEZS3vbZ6UvQsLsHRLkfXYe7D4BxSMsEzWxpSI8xjOMQS1E98L+6PcGRCGCQ/H6frqnDeRnncYp/2F4P+bBtgrxE/0Oy/cev9kXBDGhpMYpxyjbHX0QODSAz9pJoh8kLZlbWv+MDpFUM10E5s9iHhKlCZ+VhbUcLEZ3fBmxQV2TODA1poV4CzpsjV3vIpgDo3mh6McLMkAq85hztDe5p7jp/4IT25bLYOLUta2ionzsOzUYksl1a63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GC/Nd7vUo+zO40AkbW/KhsU7bPjZbbPFHxSbzenE5pk=;
 b=VxXRH+0OapZcWHOFHNG7XGXzFeLyLJYKIa+EppdYa0uuiS16qwJsm056KFLzzW56ZUrYsSQw1RhHepTLFXWSGTSkskjGixg4YUyUEhwl1qJSYYDv14kGNfeTMZpK7E+Ag1lWIzwZzV3qzgMdfj2YUqkc4RHougAOD77Bs3tD74EFABSoEA8xni0wV3XosS0Tyr1BKCtmO3SWlvH7Rj8aPDhBDDxhdVQomIOecWvBE/GF/HQ/Ih+CVQadzMqPwh7YQc/jA4LMulab0ENNHk/YNd4FMvomufPpuXS11rvkIiAQSWallZqShb0PUysG8NSUaniRMeTf4PLGY8Hid9Di6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GC/Nd7vUo+zO40AkbW/KhsU7bPjZbbPFHxSbzenE5pk=;
 b=UMZDrV8M69Z3oIQS80mSLX7X61istfN65I4YiIFaa2w0P2/2BfJzvrPDj79iPYJ+F08NKPJLjexrz4ds3qkQUKn8bCAPpb+3GjUF05++6tNn9LuqNrDwXmkjjOUVcsj4DKj1YfDSWhwwlS+mIwHfO465Lf20fdbPizGNLLXG/dY=
Date: Tue, 6 Apr 2021 09:29:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 08/14] tools/firmware: hvmloader: Use const in __bug()
 and __assert_failed()
Message-ID: <YGwNz6ZP8qtVVx+D@Air-de-Roger>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-9-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210405155713.29754-9-julien@xen.org>
X-ClientProxiedBy: MR2P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d176ede-b133-4449-8d59-08d8f8cdb4fe
X-MS-TrafficTypeDiagnostic: DM6PR03MB4682:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB468225A09BA02180DF0D35408F769@DM6PR03MB4682.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w3S72kco+yECnIixrukGcpzWr/cEE7f8CgERzXdqRhVk+vH5KWITPVobzMXsDw+dxSJnJ3RJOGtjJ8pWPlnBPy3yVcs4a20oHrm1Fzc9oTLxYdVzWLvgSiC8850Ay6CRTd85BB0pee9MY6KkYKYPCY/nWEdW8TRegrOx8T2fb9KClLt3jvA2J5z56ACDORSq3iEuWTgWw++chUY0ojRtQZI7+2U0T5oA2bw5/cdPioEICMAmh9CPhcun2LSD5IydQIe9Dt8fPar0xiXNL66qxAE9fnVjlVZEAerxCqqlmbVc5jWG0SjoTJqSY0jOyTQfJ9lL8xCHMCGztqO0s7bzh1cSs5VvY7chWnXUQOuZdfOUeEZoVcOtyrRjQHs+bHhYDsUajrwhJAfjsYhBrF6D5BEBxqmLcanqUtCYOaRV1dtwRFLTVItoCXrnItYGfTOTRT+a/sAgkF0KAeHqNfwTqBzYw5LSdKrXKD5QOpgIoNPx6tb9e9/L4VLLfSvQ+Izo/wM8Rpql3CPmlJY4lljiFdnQgQKPtLaZmma/JzTTGlgiI6EECUJEPqKERm/HTtzSx2blATTGUV7Su7yRAHCvOtnXKfGNt3Ge2A85SvCgedZBZR+8KkqpXVtwQaWEWLPmAPNfk0wsXcZgJGXq80U0nH1TVO5WaY6pFXFUA4h8FeBD+RSyNwcxgaVAYfI/7AYs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(376002)(136003)(39860400002)(396003)(346002)(2906002)(956004)(4326008)(5660300002)(66946007)(4744005)(86362001)(66556008)(6486002)(6916009)(9686003)(316002)(54906003)(8936002)(478600001)(33716001)(85182001)(66476007)(186003)(26005)(6666004)(16526019)(8676002)(38100700001)(6496006)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SmlKR0ZiaFZuZ3ZwbVhPeFhkRUVtdUpZNE1PclVJYjNnMzlXNzBGMGtYak5Z?=
 =?utf-8?B?K2N5TGVNR1dibEk3QTRKb0lVTzRoeVFZQ0hpK3NYR0gxM2QyS1g2WWxVMEVP?=
 =?utf-8?B?M3BwRTRQRTFDQnlWZHRYbkdhRGFKWlUrUm82bDBNQ2VPMHpxajVORFhheGZK?=
 =?utf-8?B?VDhWRVhScU5LVTFidTB1ZTY2V2gvMEY5QjhJNVQrdlNhalg3K3JTWDJZUEVw?=
 =?utf-8?B?b3V5M2NKVHdrdXlESUtTSk5lYVVRLzBrK1BhWHVjU2dKSlRSN3ZRaWpKcEx6?=
 =?utf-8?B?MzBXYy9YTGdZK1VhVU43R2srQm1LNFh5amNVWnlSbWozOW9Ec1gxMWVrMURu?=
 =?utf-8?B?ZXpVOFNLUkFtOUQ0RkQ1N3RYdmovbUpzMUEzK1VhbkkvZEgrT2IxSmRNNEZG?=
 =?utf-8?B?OEhENExHeE5NUW1wTkZIQ0YzdzhkanJMSjBtNDRud0haVW1ZQjc0WEUxa1hS?=
 =?utf-8?B?elJUQno0cGVnVWJOOXJmbXQwTitZZlgrdi9wYmJpbmNxWWpKaDZyR1lGdXEr?=
 =?utf-8?B?L2Q1TTNMYkVNMTRLeXZYUExIbTZvenBCTzRFV1hKUzdrSHVhOFd1VkhCWjJK?=
 =?utf-8?B?Zmw3ZXVLeitkUzNSTGdxUlo3MHNmb3c5NTFVREY3emRuSjlXcEJQQnNDQTg2?=
 =?utf-8?B?aW04aEZsdnA2NE93WVhUNkJnRU10WTdKK1R4bXU3WEhmTm8vLyt6bDN3dkti?=
 =?utf-8?B?eWZMVzYyNW9IcFkzQ2pKNmNmNUU4blpwMXZ4SVgzQ216ZXBGcDJjOVhkUEZJ?=
 =?utf-8?B?OWFuZ2huTndmUXkrMHBENG4vNkE0TkphSlZPOWdMc25NSVE1WFc4TlFaeE8v?=
 =?utf-8?B?dVVWYVdIc01oN1pzeDB6SEdSWm5iT0ZuMHlpUnVBSlpLbUlzTXdwNjBXQ0o2?=
 =?utf-8?B?d0VrQ0FqU2duOE93ZXNTa2NuR29aWHkvYnJEN3BqTGlPR3MzRVFuc3pveEZa?=
 =?utf-8?B?ZHpUWktYR0JNeUJ3djVRNWRUT3RYWTVjOEk5Mi9tWlZHSE12MGc1RkdoZXd0?=
 =?utf-8?B?NkNhT1lBSzFnMTVmVGE4ZXNsNEpwa0pVanA1T2ZxTVc1Uy9FZkxFclhkSXZN?=
 =?utf-8?B?SmlHY3ZWM1FVU3Q4NlRPWlBUbWFhODJSZUM3WEZTM20zQW1SL21qNGMrekV4?=
 =?utf-8?B?Nk1DY2RRZHZVMFBVSkZiYVV4ci85RUlhU2VqcmdiOU13S1JDenVZYnJwSkZa?=
 =?utf-8?B?bjVLejlWV2szWDUwaG5sV0hKS3pWUWl2TVA3MnlkK25PS2ZOdFN6TWNscTFU?=
 =?utf-8?B?M0RENmZqTDdKT3BiaVJ5RlhjRzNJL3dWRmNIQkp6M1V3amxYT1ZzY3VPRDY3?=
 =?utf-8?B?Q1Q1N201UyswUTVqeTZJN2c0eW8rYU1iUFVwdGlqa21yTGJlaWhrVmNnb0Zi?=
 =?utf-8?B?UHludW9jQ0JDRDlEYUpmeXRyRTd4VWlHbC9aVUErVi9XRUZjWnBnaW81WjNk?=
 =?utf-8?B?MkFDN0c4U3kxeXpheWp2b1dFVnVXWUtRNUJ1MUk5V1IrK205cVA4Y2cwZnlV?=
 =?utf-8?B?WFlmUkEyNENEYTZzdWhzeVRvcVE4T1hnODErK0h5eEtFWnVFVVp2OHRuLzNT?=
 =?utf-8?B?TkdwR3hYaGluUkdHVU5ueHpVNkJQL3BaQis2Z0kzK2dJYW43RWkyYUxRdHhs?=
 =?utf-8?B?b3MvbElmUDV5YXlqblpZVno0T2lScmw2cm11L3BVM0RpR0c3OTZ6ZVNOMkZq?=
 =?utf-8?B?Nld2VS91QU1HdVV4b0Z1Uk50VWpEVm53U1hGcVNzLytaVE1TTjlicDdBb1Ru?=
 =?utf-8?Q?QbNR6/HGlxGlbdym0vJ8CbbQxY9zmfUyMHCS6PM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d176ede-b133-4449-8d59-08d8f8cdb4fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 07:29:26.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FO2IU6tWCVwiQlWlh2tOH8AQESGcfYWKfJDlvceyo5yrWUpUgMHs9++uaktJq/QXDaG3/QZiSpGOfltSVqgUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4682
X-OriginatorOrg: citrix.com

On Mon, Apr 05, 2021 at 04:57:07PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> __bug() and __assert_failed() are not meant to modify the string
> parameters. So mark them as const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

While looking at this I think we should also make the line parameter
unsigned, but again doesn't need to be part of this patch.

Thanks, Roger.

