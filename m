Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1279B511330
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314490.532557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njceX-00007T-CR; Wed, 27 Apr 2022 08:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314490.532557; Wed, 27 Apr 2022 08:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njceX-0008W9-8q; Wed, 27 Apr 2022 08:04:01 +0000
Received: by outflank-mailman (input) for mailman id 314490;
 Wed, 27 Apr 2022 08:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njceV-0008W3-Aa
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:03:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 938ea47e-c600-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 10:03:56 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 04:03:50 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5455.namprd03.prod.outlook.com (2603:10b6:a03:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 08:03:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 08:03:48 +0000
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
X-Inumbo-ID: 938ea47e-c600-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651046636;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=F7NYIhxeUpb0L6PFKMN7AjZE2buHjL9O5cHSPgFflDw=;
  b=JURoCTn4MYMteiwAWcBPbboOh4meMe9uEXGra17sUZA+0V6yoFTFKcnm
   S+I7Orvs3LpI3r87XlWvFzAxki2CmD2FrCmy675yPwlAPLsOEbvWX1GqG
   xtdyVBowR8miIjYZ8xwdniH1kisJc5Wbuvl++bWJF4XnMVbx72p+8BSKB
   o=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 72474057
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uAN0P6DWaL9WnxVW/1fiw5YqxClBgxIJ4kV8jS/XYbTApGh21zwOz
 jFNW2/QbveOMGbxcotyaI60oE1QsMXTx4NnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jj3NYz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhSl
 PlLlMeCFD5qEbTBwfshCkBATSBhaPguFL/veRBTsOS15mifKT7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t7B8mcGM0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjy2iajK2AHwL6TjfQw6iv55yBM6/vKa+HLQfHXZe9axH/N8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAa90G1T9+7QxyxplaFuAIRX5xbFOhS1e2W4q/d4gLcDG5USDdEMYYirJVvGmds0
 UKVldT0AzApqKeSVX+W6raTq3W1JDQRKmgBIyQDSGPp/uXenW36tTqXJv4LLUJ/poed9e3Yq
 9xSkBUDug==
IronPort-HdrOrdr: A9a23:LO7wFKOI03aT4sBcT0j155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsrvau4FGbCAcqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wM9HdwGOt15Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexrwqEH3QSuvyWqOLtB0B1v977jK3Z4S2MaGPLQ18bpaou
 W1bLofjx9+R37T
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="72474057"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6Xm5jngDy5P7Pg6daiXUsYWE2lMSSIhsIpe4xXmxyEZ/j4KiaIkne1c/sQsifr+eKZImuNJzeIGpSuNndmXXmOiBwdEw7y9B32KrZd1wL6LXuOuD1yscIp4gL9itE0nEbb5DdWF5t1AkthY8UFol0RaDIeggopoDWCO1W++FoCch+dnR4G0sGP1JVAfpthVJX37TqrQCdiEai0JcPZYhs/CpE8exXLANjjdSoSbpn1YUmFAoMfeMa3Aa5snzuKYhdj1odGDIqmTZIYUdyOk3sU2659e3wr5XHBLEJlDmcOItsTxYZzMqYTGoEwSNJCoRW2IELMtSNS4XI+Drwwkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3857EKIiRgMECL1axKYb89+TdkuiPe6fyL1azL8axA=;
 b=CFGxvdA1fhbT0tOH8ZWF6V0kOSFIu3ttBcOD6H5gUAFB0lscHLvShALpgII6gBRDOxJSzNeUKj7fbWBEAJpaQc6Yr/yOAZElKhDqrFKO1fnMHdjT0vLuWb32qOERF16mYim5Ebgn/ZcJaJtsPAW2aAiACOfd1XcN9LV/3axRnPRw3Mo3HgAm6RCW1AH0dVRkw4TUSwHPNhObsC3t+CjbyTgFndrQlVvad0YgMz9FHpZQPmkKTtB4JbygQWL8Xn2gP1n3AjHMTrirFA1AHYvAlhBSN6t3ZFT/t+u2RYc8UMtLCvvp1TXkHoyp+3BmPLdXmLRerqHzRtXJFrDS71wIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3857EKIiRgMECL1axKYb89+TdkuiPe6fyL1azL8axA=;
 b=EkhT4nNmltxRX6W1z3ACfZoerVfEiWmQiJ4gjtgPod4o06eMqBQI1RXFF3r84r8JUjCVIY7qmj7Qg9hEQCKeDlo0Ikii4J9jfNSXu3mucR5p4Amucdb4Nq/CHJ6HMWb0OHA/+j1CoeNM5BBG4u4XWeVqlzXowe+/fZY7nTc2hYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 10:03:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>,
	Edwin Torok <edvin.torok@citrix.com>
Subject: Re: RMRRs and Phantom Functions
Message-ID: <Ymj435hWOcY9BK36@Air-de-Roger>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
X-ClientProxiedBy: LO4P123CA0156.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a31a37-eb14-4675-f8f2-08da28247566
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5455:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB545501308C0F458732F416B98FFA9@SJ0PR03MB5455.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5y+XdEQjKD61ZAGgppzbsuKHwznrw0oJ8ZakVLWZKp0VljPA3uKx/k2WSSM9F5Owdie2EE3MrdITI7c7TF/YRjoEom6Z2vJvdD8FAnbxlH5zsJgyKD3xjzG5XeOthQncg68KJDd5brvMSQM0uyDdAfbit+GkRq0jEDB+K/+aCAFdQ7AlRDXcC7OANg9D0UUndKyiOo4RP5NFetRWWXuglBC6OZ3ZKFN+htXrt01OaE2PDsGSB4NtZruH5kozlqjA8dajepBDQj4LbWcIlHNJAIC7t0oN+yo9p9J0zkotD5Gi7I6hvRS135OO7yB0cuF2BJuwm8R6OI1OGKn+ZtNpKNsXKo6U3K0ph6sbr80sFi7X8b+JtFMp6WivrwNSa45E5gCsCpDBFiLbJe2geYBDBfv8MY5XG3iqlnGtpNS7BXnPF5nlGIQn2kxbQj+qZPLV1cjeKiCRVpUu5Fj9FvqDVm/TzOhz7HTzTKvrjpnVjMsWk1938inWhXScS793u89Drud5GKR22Fp5RiYL5Mp+yHoEHMBRUtf9yMZ3+t182798dmynR6kFekuhgzYrDf9rl+Q4fUyG3S7ioHOLQ2Q8Ea2JZdNNPud/RXSj/sZ31BBoDt78zI70TkllA/xvBP2GBpOVBM+i8mOrACxI89WhAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(107886003)(5660300002)(82960400001)(6512007)(8936002)(4326008)(66556008)(54906003)(66946007)(26005)(316002)(38100700002)(33716001)(2906002)(86362001)(508600001)(6486002)(8676002)(6862004)(66476007)(9686003)(83380400001)(186003)(3480700007)(6506007)(85182001)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emxKemxaMUxuUmxOYnJhRzdJVm1FRDJhR0g3eHlSeTJxK08rTXhCZWF2VWdp?=
 =?utf-8?B?emdSWVNoUEx1QzBxSVEwSFFDNjJJcUVZRXZVS1h0MWoveE91R3J0N2ZjY2lT?=
 =?utf-8?B?aVlUbGVITEJRWkFvcE51NWYxN3FFMFpQaWNpTlMzU2greHZXc3hmUkdTRTFl?=
 =?utf-8?B?RDdZclB4Sk93ZzVycnp1V2hMdGNpTktvdWE5MVUyMGFRRjZzd09uV2ZsSVlH?=
 =?utf-8?B?U2JpRThaaXB5dytDU0Z0dml2WGY2V3dWMnFyMzBDdkNKUjcvNnRLY2xObTFF?=
 =?utf-8?B?cnFXN0Y3UnRkZUdSamdySHBqZlBZdWFSRlpwTWxLLzBNVnhVOCtHb2JMODhn?=
 =?utf-8?B?T1dLT29PUERDRzlNSUFhckZFdmoxYUdyZkVTaDFmazU3LzhhZDlZcmlFSTVR?=
 =?utf-8?B?K0RBcFVhQ1dtRHoyV3FnOFVGVzh4bnpWeW5DL1Z2Mm1xMDdQZlFDb2hRUDdV?=
 =?utf-8?B?ZThqYVdlYUE3QXZLMERzdGpyaWtHZ2QzQ2orSXRWQ1ZHZGlWY3VsYWIxK1Ev?=
 =?utf-8?B?SlE3dEdRTUlBdW9JaVFVYTdEdXZKcmt0VXdMbmZDc3NqeCtSQy9YbUJoQ0lp?=
 =?utf-8?B?K0txMUN4eGhmNy9za2pvSmlqYzVMZ3BvTWNFWGIwajZybFlvVk1EK1lQUDRG?=
 =?utf-8?B?aERacGttMFE0Z1N3QzNvWXBnRGhrV2JHTXJpb3RoZzFkbkk1Q0ZKMElQK3JU?=
 =?utf-8?B?NzUyaFlXcVg3VWoyT1lyblBKZFZ3Z3lzTHFyMU4yK0JSY1o2QTNzbFJwRVRT?=
 =?utf-8?B?bmJQdEZoV0VSdHBHdlNiK1BIV2FWOUJIK1BZZnIwdkR3K1d2ZWd3TkVHdCsr?=
 =?utf-8?B?dkE5RS9ucXdvL2ZWZlhaNXBQcEI2Mis2ZHppMVJsekgxZ3hYcEN1VndTQS92?=
 =?utf-8?B?cUFGV2xQQ2xQOUFsWEx6c2dFZzBXdWtNa3MyS2Q5TzZUbjZsaUlPQk1BU05B?=
 =?utf-8?B?c1VVdUVOU0pOU3pvTkFXcmlCUmlRU0FrNW8xY2VXM1owS2tsd0ZRSVFCOUFr?=
 =?utf-8?B?cHNMZmdPQm5DWXlicyttNWFBcGw0NHJDcXo5U0tlUUQrVVlRZTVReXVRbG1t?=
 =?utf-8?B?QThoZXlFWmRQS3dOSFFzS1VGNTdlU1kyNVgwSGpkRzJpVld3N0pvVXR5REpX?=
 =?utf-8?B?Z1lTYXdqSDZsZHR4TDJ2Z0FjTVlQMVRsMWszQ3ZPQlRnNlRWRG1qMk84Skdm?=
 =?utf-8?B?RjYzZlB5dSs0anlvL2pjRFliSU5kQjdqaU5nb3hraGV2MW44ODhUUmxtcDZt?=
 =?utf-8?B?V0pNLzIrMDVHRktnSjlxTUZUbHpyR2JOTjhNZjVTU1ByQU5yQUUwb1YrbkdZ?=
 =?utf-8?B?Mk5nVlRPVDA2Q29CeTdVN2pZaVhuazRaRmExME8veDlicDlQd3JpbWxuR0l6?=
 =?utf-8?B?dW8zUll4UFA1bmxMRm9FazdHLzR2TlZNL1lTYklLY1R0WFk1Vjc2cWlOS2VK?=
 =?utf-8?B?Z1FJcG1hbUtseG0rYTI4K04xU2hrT0pUVktzNWMwMGJqVTd6NmNWNWtQYmFM?=
 =?utf-8?B?RElNVGZPSDBMM3dLVkQ0cTE4YnhVY1FDeEh3ajN5OFpWUjBwS0hZTU1ESEZw?=
 =?utf-8?B?Z1ZpQ0ZNVVVEODlRYXViRFp0bFVRRHNBallPM0NYMmlHZ3pQRHFtRGZoeURo?=
 =?utf-8?B?NnV5WFduYXZQRy8zckUxRDNjVFVvNWRNMldyb0o4NHhGZFFIbUphcWtaRnJV?=
 =?utf-8?B?a0JVMkM0Z040QUpVNkVOdDRQQVdrY25jODhKcU1qRHFQNkFDY0xrSjJGei81?=
 =?utf-8?B?QW1kWnBXdnRNanlmNk5WRmtMSFFqQ0ZySzZHRzZIRlgycUFaMWNoaUhVN3cz?=
 =?utf-8?B?NFNmRFh6bzEzZ1NXSmwxU2ViZmNQTWYzMUl6MjZWaWlXdmZMZW4rZGlUWWJV?=
 =?utf-8?B?WnFBUklkb0tIWWNMYWQ4L0J5Skw3TzRjTW4zVTZjclg5M0hVNjBuVDRRT3VU?=
 =?utf-8?B?RWhvK2tNclJyWkpWWUMzYjh5cGpUc0JkKy9nSlBRODMzRlVoUy9jSWVNaXRa?=
 =?utf-8?B?aVFlLy9IcDFiSFQ0ZXRZd28vaTNCMEY1cFBQbDlpMENRaDZCenFzTFFBUjlG?=
 =?utf-8?B?cnFib2lSejduczV6aXhaM0RoOG4wSVBieUxWZHJCZXlOeHpwR2VFbGFDWFFo?=
 =?utf-8?B?SkdKeFMrdkhYZERJOWQxQU5wUEc4NWhTaFJmdjJHSXd1bFdRSDJ2ZEJMVlZX?=
 =?utf-8?B?RktKaHlYNFEwcENuT1FWcHB3U05SYjlQRit2WUtPa3VLWWZmeHpCYjJEcnJX?=
 =?utf-8?B?SFY5T0wxRk8xQk0rSmpLaXdUWEI3OHFXTjU1TXdLVkxodmUxSUhwZHhpUnNj?=
 =?utf-8?B?UHVaSVNPRmtheGpJN3pGeHB5bjZmMUttMGVLK1k3Z0doWW1ETU02dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a31a37-eb14-4675-f8f2-08da28247566
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:03:48.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cejawdy0HFwN7B3StxVWINUBnQuoOIkBgCJ3WsjSNZiFdCHLPdww5Ai6bC+80b0XYrh8//PWUOHp/2rUhStT6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5455

On Tue, Apr 26, 2022 at 05:51:32PM +0000, Andrew Cooper wrote:
> Hello,
> 
> Edvin has found a machine with some very weird properties.  It is an HP
> ProLiant BL460c Gen8 with:
> 
>  \-[0000:00]-+-00.0  Intel Corporation Xeon E5/Core i7 DMI2
>              +-01.0-[11]--
>              +-01.1-[02]--
>              +-02.0-[04]--+-00.0  Emulex Corporation OneConnect 10Gb NIC
> (be3)
>              |            +-00.1  Emulex Corporation OneConnect 10Gb NIC
> (be3)
>              |            +-00.2  Emulex Corporation OneConnect 10Gb
> iSCSI Initiator (be3)
>              |            \-00.3  Emulex Corporation OneConnect 10Gb
> iSCSI Initiator (be3)
> 
> yet all 4 other functions on the device periodically hit IOMMU faults
> (~once every 5 mins, so definitely stats).
> 
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.4] fault addr
> bdf80000
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.5] fault addr
> bdf80000
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.6] fault addr
> bdf80000
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.7] fault addr
> bdf80000
> 
> There are several RMRRs covering the these devices, with:
> 
> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> (XEN) [VT-D] endpoint: 0000:03:00.0
> (XEN) [VT-D] endpoint: 0000:01:00.0
> (XEN) [VT-D] endpoint: 0000:01:00.2
> (XEN) [VT-D] endpoint: 0000:04:00.0
> (XEN) [VT-D] endpoint: 0000:04:00.1
> (XEN) [VT-D] endpoint: 0000:04:00.2
> (XEN) [VT-D] endpoint: 0000:04:00.3
> (XEN) [VT-D]dmar.c:608:   RMRR region: base_addr bdf8f000 end_addr bdf92fff
> 
> being the one relevant to these faults.  I've not manually decoded the
> DMAR table because device paths are horrible to follow but there are at
> least the correct number of endpoints.  The functions all have SR-IOV
> (disabled) and ARI (enabled).  None have any Phantom functions described.

According to the PCIe spec ARI capable devices must not have phantom
functions:

"With every Function in an ARI Device, the Phantom Functions Supported
field must be set to 00b. The remainder of this field description
applies only to non-ARI multi-Function devices."

> Specifying pci-phantom=04:00,1 does appear to work around the faults,
> but it's not right, because functions 1 thru 3 aren't actually phantom.
> 
> Also, I don't see any logic which actually wires up phantom functions
> like this to share RMRRs/IVMDs in IO contexts.  The faults only
> disappear as a side effect of 04:00.0 and 04:00.4 being in dom0, as far
> as I can tell.

I think I'm slightly confused, so those faults only happen when the
devices are assigned to domains different than dom0?

It would seem to me that functions 4 to 7 not being recognized by Xen
should also lead to their context entries not being setup in the dom0
case, and thus the faults should also happen.

> Simply giving the RMRR via rmrr= doesn't work (presumably because of no
> patching actual devices, but there's no warning), but it feels as if it
> ought to.

Xen should likely complain that there's no matching PCI device for the
provided RMRR regions, and so they are effectively ignored.

Thanks, Roger.

