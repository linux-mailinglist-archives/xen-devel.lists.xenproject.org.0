Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D87513066
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 11:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316379.535288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0so-00072O-2z; Thu, 28 Apr 2022 09:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316379.535288; Thu, 28 Apr 2022 09:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0sn-00070G-Vj; Thu, 28 Apr 2022 09:56:21 +0000
Received: by outflank-mailman (input) for mailman id 316379;
 Thu, 28 Apr 2022 09:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nk0sn-000709-9Y
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 09:56:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7315abed-c6d9-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 11:56:19 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 05:56:01 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2996.namprd03.prod.outlook.com (2603:10b6:404:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 28 Apr
 2022 09:55:59 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 09:55:59 +0000
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
X-Inumbo-ID: 7315abed-c6d9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651139779;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Raw+g6TTZToe1RwUMkEjFiMHn/nBcUKghfPuQrRNOdc=;
  b=H5NSTZNHEtG++inIZE5P41KNbxPDn3RaqwTsWH2cpWuvQOfPst76toVp
   XxLZsXb2o4T5gO7Akf5X9gtgsvKcrWbSiANrbyKiCP5QRTp+nIF9MsOZo
   DoKCuIMGwzuK0MOjBSVJBtawSDadwlDkM1zDQ6fkAu/yoTahfy29w7fmb
   0=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 72582664
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XRjd9aqs5wa/1ZpkBLYPLZufAmdeBmIHZBIvgKrLsJaIsI4StFCzt
 garIBnQaPqJNDbzfIgjaIzipkpX75OHnYRqHgNprHsxEioR8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 4Oq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBM4yWqs0XYzBiDDwgHa1t0pzoGHXmrpnGp6HGWyOEL/RGKmgTZNdd1sMpRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjXFp2Z8m8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK//dnuTaNkGSd1pDMENrKYsCBfv9fuVuym
 j6F70/VABIVYYn3JT2ttyjEavX0tTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiHyZuh8RXfJAHut87xuCooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/v2ARR/vbvTTmiSnop4thu3MCkRaGMHOykNSFJf58G5+d5syBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsiPOZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:MXE8eq50ScrWEhhQWwPXwS6BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfTqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2TiIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+EzcvCku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrZOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpPyfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvG7f2UIUh4rD3wXklXqvpREnBmcEa+a
 hVfYrhDc9tAB+nhyuzhBgu/DSuNk5DbStuDHJy+fB96AIm40yR/3FouPD3oU1wiq7VM6M0gd
 gsEp4Y4Y2mHfVmGZ6UOo86MLqKI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="72582664"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8GeFZrqi9u4ppELnzN9+GRoaAYMgfVqmLri3VcEj1PJ1zGEALcywsAV0Sd+X6KuuIszYvXPw0qRsmIqWpZm2kJThHH17Xvp82Qg2aVlvawj1ZvvLpQ/iAfascFLBUy/X8QbDxT9Y+TTRjGLdThxUj75Va1lYXTtWRFIepCAo765YukmsEo65T+IsBlDd8hY51wIhdAWtJqn2c5/T3Hv7NAA6YeP9gqQltBkQQER0eOiaLo+CRaF4SFyYoB/Mf029msY1dGylFCQ8TMfF/cXLavzFy3t+sZC1dTcgOCXfFKFHDN0+B/QH+kxdA7vt3bCNjPSb5fgZ1wdTVxBs18eBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9qiD5d3iCh0zV6WjSfSq9O796H2teWRahF43wEAtNU=;
 b=nafb+ByVkX2uxjNEJcBcc584wBB+V2gCocgykahBugslAZvLgPbDRN/stCrs2BkDuJv3K3UDxVp9f3z4tRmsmVla3YeEpAWQlUmws2BRhvYzyu/4yzWA0aoRkD/lFoxCARNJw9G/VZc79jPYbOEv34y5tCk5OxTHsFj+mbda0z6+wjJ75tCnRY34Q4AV8tWEBxK0KQVuwiHnUZn5ZPn9YncSi+9z2XyUKq210TIhL4SjaFsgWRmXBSNTvsAv0GJL0Bd6Mui74208nopPNSqKkFvZA2WzUSJ/cdt5ZPcqPtKBiA6I0YYD7pnGHHxb1XC1XFAY+lfCyTQQKdBuWPPH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9qiD5d3iCh0zV6WjSfSq9O796H2teWRahF43wEAtNU=;
 b=C5dBF5CiWeoTUn9d5/+D8i06+I5pYbpO5Y3J+4V9tzKd8nlt0yPsaIUrQY3N9bYvvUSV1otD/9AV3Zog17qjnHF8uQ6MwHW00CNyueU3y+JlAoKy6dvoKOQywehSrMf5gOYOcXSQo2hVqBANYPo2p8ucLeyazYyAXqNEAro4nSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] cirrus-ci: add myself as maintainer
Date: Thu, 28 Apr 2022 11:55:49 +0200
Message-Id: <20220428095549.91409-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f70bbb7-8d79-4c27-924d-08da28fd4c22
X-MS-TrafficTypeDiagnostic: BN6PR03MB2996:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB29968D53D72E995956BA796F8FFD9@BN6PR03MB2996.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D1ue59A/cSdmYN1ko7BXiVYbfib/A74zGIaFwk/kEBDmUvLgrAk/xIBpoddTLg80U1d6fGXSrVae2GVi9XtG0N0gFEeDnLsMk/jBS7SyB5tR8WYvFePiFWJyy0tlZcYxSw2NXG1HI9slUJRTTeukd8mgmcNEGMEmvQ5aDPc1fxiIpdtttgEwJtrgLWALSo0Iwz7snvrsZKYSwhJeN3V4d09AJhs/Kt0etw9kOH7XYMZeEOmfaKG+DRQgjJOBvGDxHtEbHGUikPXesotysFBii+jE29cBM0BLDq70sVK42t/GAnCTHGxlAqOVIuaO+Qk5OsTB7Hu9fDszytLniHTAUV/chVSRE5mZp4daUE9qP1farY7ElR/KJa+jxQIx5hplPF9fI2HfP3Ls3DH2z649QWw/fHErS7/r6tnwVrj7cpWuhpDJcJ1HuBhpDxxi9m9wBbypbahrgn4uIN/HnZpXUP3/K32CYKC8aNEBqV9y7HkgPqJVYaJ3jWqx1mIIp++k4f01f37YTx2SLI1Qo07VMPCYbQ4aVA9wrwARfBNBFQAMlXFKfnHDLQqRjIsHNlPqUFVdAwmi+zOcYh3exJxwvm5aZr4f23Xcu/TO7syBQrzKvhMgf66nQiiVUuutw7n33FjrHZeVIJlsZWpm4vTklA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(316002)(82960400001)(54906003)(6916009)(186003)(38100700002)(86362001)(2616005)(66946007)(1076003)(4326008)(8676002)(66556008)(66476007)(508600001)(6486002)(6512007)(26005)(6666004)(6506007)(36756003)(5660300002)(2906002)(8936002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVpCQmpkQ21abWhxVzJWOHBEVndQSlRkblpjMkYzaE5qNk1OQWxhTmRWT0pq?=
 =?utf-8?B?Q3BjUmJmODB4R0NOcG44elBJWjJlOWFrMllJekcyWktTZlMwT3lpcHhmaE5y?=
 =?utf-8?B?SUVrcWNMMjBsQmRwN3BBZytkVlVtZW5tbUhJL0dIdWRWUzk4eWxkbDV4Nk85?=
 =?utf-8?B?MFYvNzkwTS90angyVnlRT1NhZWVLVURnV1ZwSStUV1pLZkJzTldzRWQ3aHg2?=
 =?utf-8?B?N2duNUg2ckV6OUp4YU81aVlDaVVuUHJOT3NKRUU4YmtvYVZGZFZpQWlLRGpB?=
 =?utf-8?B?S05LdnBxVWxxUVBNeXFPK3UvUVdhR2RKQnNaOWZtVlFoVlM2aHpVY3BhUHdC?=
 =?utf-8?B?NlhjOGFyVlFia1dVbndkS1hHZ2xTMXA5WE1SWW5MdDV5T3NIcTJCazU0c2VQ?=
 =?utf-8?B?azdtdTBUMWx1bzlvSVZqTEROK3JXelNkWDVhdjNjNldjQ2Jyd0ptci9zRTc0?=
 =?utf-8?B?a3g0RUtIWWQveFN0c0MyK2ttVGozNlMyTUs5ZlNHMWVSWlpTMkM4UzI4UnVY?=
 =?utf-8?B?L0VTTnpHbjFWTEZqZnJzd29VL043VUw5aiswMUZuMkpiNk9pckYxZHBqSVRB?=
 =?utf-8?B?SWJLRG5Ja3NWUzQ0a2NMMlJqV0xlZTlVTjVYOWdubXpCcmtma2pGN2w1ZW9Q?=
 =?utf-8?B?QzdZdzdvVDdEYlpzaE5ZQ1NlaDVveE5VMVIwa1Bybk1wTExrUm9RUHI3Nndo?=
 =?utf-8?B?cE83WkJkcmtGY21NRThKT3UzemNjWUprS1N6WWg1ZkZDdk9GN3FjMmRya3B6?=
 =?utf-8?B?ZVBWVkhNMUtZRzNvazJyTlU1dXVudWdzRHV3bm5ueUQwNlBUbHEvNTBMZi9x?=
 =?utf-8?B?VXQ1eWpQVHFsNm9ZaUFBa2h2ZVRwMk5GZ0JxYlN1RlpiaFhJNHRHMFhDa2xx?=
 =?utf-8?B?ZmtmekZuM1lQNlEweXJWMjRMbHpkeE9NaGp5UTQyMkxiR0p2LzQ1ZTdGVThL?=
 =?utf-8?B?VXcwZzF1WWsyRmlITTg0V0RrY1VoNVZZM0lMZWQzSXhycjVMUGlXWjdNbEpL?=
 =?utf-8?B?YnZNRngrMGlUZ0FmcXlyQU1xRXVZTE9TT3ZzVEJGNDdwd25VdmF2SXdGVWky?=
 =?utf-8?B?MU0vWVdOVGJmVU9XMXAxcU55bjA0bmVna3VMTmRQMm9ha3J3a0RQaXJRa3Vh?=
 =?utf-8?B?Y1RJcTZoUE1Lcm5yaVZBSVpaa1lHUTE4VlJYZytaakxtWENRakEyK3BIckxi?=
 =?utf-8?B?QjZBTzJsM1JYcGpyNWgrU2NsZk1XaFRHN1FqK3I2d0VxdlE4Y3JCS0o4blVl?=
 =?utf-8?B?RmFaQUU4ankrY01Nb0cxMnQ5VzhKUEZtUXR4RmlIcEpnTWQrdEY0dDg3a3FQ?=
 =?utf-8?B?aC80d0xmSWhQQ3FWa1V6NngxbTRtaXk1UDlmamJ3WWxsUFlaQVpQWk1hUzJv?=
 =?utf-8?B?TXVWSXYweWVSRGhLbHJyWDZONnZyVHZPZWJ1R2g3MWxlaTZEZXBmYTM0Rm5B?=
 =?utf-8?B?YnUwUHpVZkcyY2dWVmwvRlVMR3hRMko2L3BsRnI1bWgwaGlFdnlsUSs2Mk9w?=
 =?utf-8?B?UkJqdTRoY21qWmppMzJ6QmllcG1BcUJsNDJwcVhlWEhOZEt1ZjhHWFFYQUV1?=
 =?utf-8?B?aDdNdzFJQW93eEJFV1psQ3BSMFQ3Y2R2THhoYW1aOENJaDNTNEJ0U1lGcUlm?=
 =?utf-8?B?bzUrdmtXOHJ5b1BuTDY4S0NFNFp6c3JrZnk3aCtBQ3pLVzVTeHlBeE15NDdB?=
 =?utf-8?B?ZVpkODRNRUJ4VHNwK3FqeEtMZjhIc0RpZ0duNnhMNnROL2tpZHFlYzlMbUdQ?=
 =?utf-8?B?UHRpL3JLOTZHU2xCUVBHY2NwT1JaZ3VYY1lraDU0RmR2d295akoxY21LRG9v?=
 =?utf-8?B?ek8ybzhmbHphUTFVZThzVUxTS0VDWFJOMFBPOFRmUFRLSTlWeFVjV2g5Q1FH?=
 =?utf-8?B?OWdHbW95cHRhYkhQZDZjeVZZdCtZVEozV0ZQV2doaGg2RDlnazdoVUFPa1ZJ?=
 =?utf-8?B?TGFpQmhmZDgyT294UHRNWTNLanM1M1hIZXp6dFpTNU52OXFYTmtYRU9MNmVU?=
 =?utf-8?B?MmdRNkxGdXZBdFlVV0tON2FHdEFtUWoyRTRCbTFpcDRKS0tyaHZxMy96RjZJ?=
 =?utf-8?B?RUIyT2NhTW1DWSsyai9DY0ptNFlOYVFBa1JoZklKaEpmS3J0aFVkQ09aSjFY?=
 =?utf-8?B?Z1JaNE56bEpvRXp3cTRZenZTVmJRc2NuM1NZWVU2UVpzeEdzR2R5enlNa1dt?=
 =?utf-8?B?UTN0SEMyc2Z4c3dqakltTXFWS015ODhQV3pIeG53TU0vOHIvODJQOHc4OHlR?=
 =?utf-8?B?Y0o3UlluMFR0THFtNDQ3YmcxTU9nRnR4S2phUnc3V1pMbUFRc092ZVk2NVdq?=
 =?utf-8?B?dkVsRkxHTzVBbVk5RHpmUFM5bEVTb0xQQkQwYm9KT0p0MVZjWW1samRWcjlL?=
 =?utf-8?Q?PkbdMO9hh7go0DKE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f70bbb7-8d79-4c27-924d-08da28fd4c22
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:55:59.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5C//Mk+BCw0slc7efYwaJpQNOW9JF+EPemI8F1qX1iOJNdkk/pUYabJhipaXaGco31V+69kLj12eocyqyi1Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2996

Given the testing done by Cirrus-CI is FreeBSD only introduce a new
section in the MAINTAINERS file to cover it and add myself as the
maintainer.

Requested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
FWIW, I wouldn't mind it being part of the "Continuous Integration
(CI)" section, but I understand maintainers there could prefer a
separate section since this is ATM FreeBSD only testing.
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a47fafe85..6248d07aea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -260,6 +260,11 @@ R:	Community Manager <community.manager@xenproject.org>
 S:	Maintained
 F:	CHANGELOG.md
 
+Cirrus-CI Integration
+M:	Roger Pau Monné <roger.pau@citrix.com>
+S:	Supported
+F:	.cirrus.yml
+
 Continuous Integration (CI)
 M:	Doug Goldstein <cardoe@cardoe.com>
 M:	Stefano Stabellini <sstabellini@kernel.org>
-- 
2.35.1


