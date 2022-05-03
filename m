Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157F518992
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 18:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319778.540160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlvH0-0005jh-Cn; Tue, 03 May 2022 16:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319778.540160; Tue, 03 May 2022 16:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlvH0-0005hi-9o; Tue, 03 May 2022 16:21:14 +0000
Received: by outflank-mailman (input) for mailman id 319778;
 Tue, 03 May 2022 16:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlvGy-0005hc-Sr
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 16:21:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09439ef1-cafd-11ec-a406-831a346695d4;
 Tue, 03 May 2022 18:21:09 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 12:20:55 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3403.namprd03.prod.outlook.com (2603:10b6:4:43::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Tue, 3 May
 2022 16:20:47 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 16:20:47 +0000
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
X-Inumbo-ID: 09439ef1-cafd-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651594869;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7l8ELOECyci1/B3ZF07O9GdIccNxyxV28w8MkB1oWn8=;
  b=cL1rw44pWsYwRb6bzCV8prxPvJviCUvlPrcW9gmTc3MkRrWB0h9d5Amw
   LSB0bhvTi9uHPv4BrXo8kwgm8ac450lJAX3ftRM80jjgBGct9Nkj5MqE5
   BBa8hoayTPpvodZs4V1RtA3noMivW4YGS46YS9YnhSln/HJYXda49k1r5
   c=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 70505550
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iIKJLqpLlridN0HI436IyXIA/WReBmIdZBIvgKrLsJaIsI4StFCzt
 garIBmPPqmIZjOmL9l2OYy1/RsFvZWGxoAxGVM/qihmHilB+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 Yiq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBZ4ruoeQEURpkNX96Le5i+aP6OnOwvpnGp6HGWyOEL/RGKmgTZNdd1sMpRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjXFp2Zwm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK/fdvvjWOlGSd1pDSbPbnaIGLFfx2n2nFi
 GnK5U/JGDoVYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGaNoxo0S9dWVeog52ml1a788wufQG8eQVZ8hMcOscY3QXkm0
 wGPltawXzh36uTKFTSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa3871JBjO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:wj8Xy6x6D80FC91Jc275KrPxv+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICOgqTM6ftWzd1FdAQ7sD0WKP+UyCJ8S6zJ8n6U
 4CSdkDNDSTNykcsS+S2mDRfbcdKZu8gcaVbI/lvgpQpGpRGsVdBmlCe2Sm+hocfng9OXN1Lu
 vU2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnS4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUoZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpArHRxfZuC+lqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60TJiApIs+MfP+UpgNddvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.91,195,1647316800"; 
   d="scan'208";a="70505550"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8s5oBAVz4uuFdp6JrbNxZoj32WBitCk3P3FUinCVvuI/tCdXWETo+gtayU0A1HUNiMFJKhm5mI7ly3/3YYVeeA0FferzEcSwrZ49GIFanAV16KLShhFSKcIL5GCWuip6lWOPvgfbvqHdcS/02FJGZ2l4qCsAj1fLUI5lPafN1kdKhUTySPj7X5CfuY9jGEQNYCcie4srN1Z3xyLbHJdsQv3aLjaTu7ntsj+Re1QJbH2QPFMba3Xlsam24lYpr7p7aLx7pE1C2oHNH1ppE4b6twiOHZ8IBEoG7yJe+NuDLYvHB6Y6lFFjislvL5vEegRIr7Ptz9bArXAOhC3L1E97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6RFzzGxPKZprX2xkIxyR/rvK1kwYmEkki2XS56ruW0=;
 b=fYOhSON1k6LDzn1ZhZWP4a6Zs825sqUgCQKLFsDzrh0fE27VgM8tUGw/k0jJsg1keNp7yeh5HToc0lGDricslYWePQkopfwQE1nARHvy0nms3a8E1EKL0g6BWaCkh9uHmwwhP7Ni1QuONpQ3C7lgydCI0yF4MwJYgtmT3mgEyaHiga/aRiHgxQUVrTkafZLaAa2TvJweAfb8y/wLVhH88mg3OOgFKF0LPnDT7HWig6ryOw9uUCBzcnb69H7P+7Xhn7K1MYay5/qBhosFRy99eTmNuD21ysYj4xwu1f1eyCp0lrzBrbxiQdKNyqBbiKIsafdANdAPCmBFsNPrMSAT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6RFzzGxPKZprX2xkIxyR/rvK1kwYmEkki2XS56ruW0=;
 b=pG1na5+ZoYMftF5rmnXMzGk4Scn1i4edcYpO3Hw88Ibcuiu8mWE5PvZEBsG3juxkNZVlCijYdk2AGdS9FStEbOb5M0T2JOAu3LnrTgIcwWb6PGbrgxdiTRRuKnZFHdXPOVLA3Ydaz6RLAixOMEF6LdSuqZg537WUJbOtlJUUF+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 18:20:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 07/21] IOMMU/x86: support freeing of pagetables
Message-ID: <YnFWW4zenNq/SAt4@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <1389c785-ffe3-5d8c-36f1-a923ce5250cd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1389c785-ffe3-5d8c-36f1-a923ce5250cd@suse.com>
X-ClientProxiedBy: LO2P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4647cc6d-8ec4-4770-ca6e-08da2d20e171
X-MS-TrafficTypeDiagnostic: DM5PR03MB3403:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB3403464A881EA11E68A2AC9E8FC09@DM5PR03MB3403.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wtU8UJNviWKl8Qaf9IWZ/l8RZH4qewEb0l9xSDZOG2uHtEZx0tJUbDuIYR7L7UblK1SpsxMXgrz9cfE/Kjog7ltWtNTztXZxXMc0z00GdRxr/U3ziHOIs3nJBlE7D3ZWAgkzUSDNGq3s2Usw8jwNP5CsXGtAbBj5f30DngcuVe9whn79jDdErNygLuzJgPfJUMFQYM8UzrhsXWwYN9MQJoD24eF42rD6EvPRi3lQPkaRsWhT7qjCwTcgVI4rzlXUPpWfP8jZeAMpUjZEFcKWybHOnLsaIdm/ENp9dNqK5fR2hRB9NlVT28r4aAOZ60Jx1NBMxQjLEE9jT+kbbld1fOoE5xqAzTlbZN6Qa3vlVvRG8X0jdig5LlDfhnQyXeaiPj/IINqy+cSWS7Ej4986GeRzHe++qLlEEqapGn7vFmZx7A+7oVkWG3cqjUjhv5wfkQS1ofxDjAcpSe/QDhb8nVOAZHwX8IYDt4S8frag4dOVrFVtTCdrBPpVNxlzMsM0438MIPmAtOeDn07eoXlXviqCD1PhsDUbM27sVoVRaiXy1kjG8pLku34ej123Vr4GEfoWAIXBBHdIjafNh8W7dfp1pFVmU4R9C5fCM7FVlJGr0HfP0Vz+J3UYo6d698m+SWW8QAqth74mGpHPV3ONbX19V5P4quRcf3U7d7t1k+YfLqZ2hsiXl7AoFwUPEmjNL6o4pJBEPDMuIeibatksNlCvG9/Kei10z55XCi7ocVELM+cp3Fkozu0ofixb3x4SALtrPEijuXAsnLuumPfd+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(33716001)(85182001)(8936002)(508600001)(38100700002)(5660300002)(4326008)(83380400001)(8676002)(54906003)(6916009)(82960400001)(316002)(86362001)(6666004)(6506007)(6486002)(186003)(66476007)(66946007)(66556008)(9686003)(26005)(2906002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWNhSWxUeGdGOG1XckQ0TUNORTdaVFRQS2VNdmU4Y25JdXB1ZkpVVzRDNHcy?=
 =?utf-8?B?cmhrTkJVbW43MW5seXIzWEFhOVhKMDR4M1gzdEo1eWlhRldlRWdabmhkZm0z?=
 =?utf-8?B?TnFCc1BwditDc1VrdWJGSytueFRvQTFYZlZjTjM1NXNhaStWZ1ZsT1M5TXRx?=
 =?utf-8?B?VHpuZzRYTWQza0o0MDJ4OFBLVU5kMCtMYWFnOCtoZzQ1b3YycXhzNnFnSmVH?=
 =?utf-8?B?ZG1iUnNDcWZ0SDNYTE1qRUluUHlReFBHWHo2cXN4WVpnSU0vbDJQZWk2d2Jx?=
 =?utf-8?B?cnpWQ0tNb21nc281K3UrcmN3K3R3K3hEZFd3cUpycEdraDA2b0lXYmFJUFA0?=
 =?utf-8?B?blNNdVhJSkp0MVFaaHh2TzJuakhMbjUyWDlLaGVmLzh4Mmthak5lRmxRbHpG?=
 =?utf-8?B?RlVIbmxrWDBDMHZRM1gvK2RzWHRWZGsyb1M2MlVLY1VWUElNa1loUHhPbktX?=
 =?utf-8?B?YTcwUHI0OUxuWENlZDdJLzhQWjJkeHMvTzIrbG5HckdQRTNUZkFJWjhFUjlR?=
 =?utf-8?B?NnNERjg2amxRdkdrSGMybURQVzAxTk5CVGlTQ3VGV2dTYjFqUWtYZklYNHRp?=
 =?utf-8?B?NnNWT1QrSjJKdW93REpjMkF2MjF0cnFYejF6QjZ2SmhjRExITU5XbWRjeUE3?=
 =?utf-8?B?UVN5VCtFdmFkR0psWkswbTIybXk5enFvb1NYN1lPUmMwVEptK3pna1hEc3gr?=
 =?utf-8?B?eTVJQ2RObk0rVUFTWkpuaC9qL05vNy9xS01ZK0I0SFNjbzJpQmE0aXZPN1hZ?=
 =?utf-8?B?dGRwdDJUMTNWVFc0YWd4OU1iSStUNm1jY1QybllENjI1Q1JFbFFSVmZDVEpI?=
 =?utf-8?B?NnM1eUtYV1o5VmdVa0p4STlaQm50OVNETXY0NkVtUHNMSmM5Wmc2K0xxMVd0?=
 =?utf-8?B?V2p4a2llVDNXVXNVQkcwZm5PNmcxV0JhUlZCMmlzZndkL29NbElTUlRPK1FZ?=
 =?utf-8?B?SjFpNVFTbldMWTkvQzVzdElCRFU0cm5hYkZEZ1BPVEdHZ0ZjVndZa1FFQmhx?=
 =?utf-8?B?b1NvalprTUxXdFhCMFNDaVJ6Nmo0M2lpTWxFZnFrZjRtV0E4eFdTbWVCeHNE?=
 =?utf-8?B?TlZMblNWQmg5cXU0dVZOVG4vZ0NWRlFPbTZDb3o2eXVEald2ejhqSVVxcGFu?=
 =?utf-8?B?dFViRHdvRWttM2RmWEo2aloxbUtGTEVQamljNTk3R2tiUlN5cFdLQVZSZ2dY?=
 =?utf-8?B?bVN4OXl4ZlRwL1llZElWYmUyeHRZdytiWTV3V2dpMW04L2poM1U5UGowVGNZ?=
 =?utf-8?B?TmpuaCsrTGlkY29VU0U2cHRJV2gwUUZuVGJRaytOMGFOQ09jNGE3SkpJaThy?=
 =?utf-8?B?eUZYZFQ4dmtlQmhTVk1LQklhN1llUi9sRG5CWUlvNWdZck56MEpJOFAxazUx?=
 =?utf-8?B?a3Y2bnhkY2hzdHkyaFkyTXB2Z25qNGxKSmswaHZkQS9SZnJiV3RwOEFJVjk0?=
 =?utf-8?B?SklVRFZSQnI3VFpiNnRlVDYyMkVjTmlpWVZlWEVBVGo4eWtmTHRlejg4aitX?=
 =?utf-8?B?MGQyczV6WTVTajdXRkQxSXBaS3lqU0tMSVorczVEM0VCNVBmNVBHMzY1OCtl?=
 =?utf-8?B?aHZaSVlIbjh0ZFQvbGxyVnRpT0VyL3RxMzFkcnA4VlhoUW5NSStPUGxpQy9L?=
 =?utf-8?B?WitlU3RlbDdDN2hnbmlCd0dNUjZPTFRreUxsNEd4T3lWbkJ2Q3NsRURXdmhy?=
 =?utf-8?B?V3FPMDQ5YWkwVCtFWkFZZ3dCeVI2NTdrVE0xUFhJTytqSHpySTNqb2N5Y1Uz?=
 =?utf-8?B?Y2ZuY3RKS2FEdW1kcVR5UFFFbCtTOWpVM3JtYld5K3pwOSt1cUNnMExGaWg4?=
 =?utf-8?B?YXJhMVM4b2M0ZXdiTnVmWkpaLzRDTUlKSitGVjBiRVYxNEx2QUk2WHF3VVdo?=
 =?utf-8?B?UGo5TXlZWEpua05vdDhrL2hzR2lNRW5RNVRkeGdDRktMeE1xcXgzRWVVNURm?=
 =?utf-8?B?REgrR0Nka3k2c25rYTdNTkhjSlRkUWtEdjBXanFGL3VZQkJjbi80TmVNUTJt?=
 =?utf-8?B?c2R2ZEtmd3lhL0lxQm9zc1NhRDNvQytnNlFacTdwOFRZTzF2aWNpcDh0WTRn?=
 =?utf-8?B?Q3ZleldicnNZM201REJ5ZWJ0UkdDWCtXQW9QVTQ5VjdOSlAvK1lYUitxSjFM?=
 =?utf-8?B?cURTUnk2M3NQdEpCbGNwSmRST2l0NUg4dnFMTzA4TXVyS2RBdmVFVG03aXhT?=
 =?utf-8?B?Nmk0N2V4QW03VlNDU0ZzYVlUMmd4bU52V0FGY0Yzam1ocE9iLzhDcnVFYWMv?=
 =?utf-8?B?YWl3eTEvTnNNOTM4T3U1OE91b3BKUFU2b2xoL3JidTgzdmFlRExLUzhwcU9m?=
 =?utf-8?B?Y0dTM2hRRUpROEY4YkNaUk5WeWpIR0lvZGxYSzFLWlp4MldGNTd2SGpCRTQ3?=
 =?utf-8?Q?pyPDu37bOrvh6i2Q=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4647cc6d-8ec4-4770-ca6e-08da2d20e171
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 16:20:47.2911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/z73H02Q9FBW/0vBPnlQ1yY//jDSyH71z1EJ0ugZNiICikUVT9qBUTNIRbRTvLXemqBjq4IELXsvTYijonOpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3403

On Mon, Apr 25, 2022 at 10:35:45AM +0200, Jan Beulich wrote:
> For vendor specific code to support superpages we need to be able to
> deal with a superpage mapping replacing an intermediate page table (or
> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> needed to free individual page tables while a domain is still alive.
> Since the freeing needs to be deferred until after a suitable IOTLB
> flush was performed, released page tables get queued for processing by a
> tasklet.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was considering whether to use a softirq-tasklet instead. This would
> have the benefit of avoiding extra scheduling operations, but come with
> the risk of the freeing happening prematurely because of a
> process_pending_softirqs() somewhere.

I'm sorry again if I already raised this, I don't seem to find a
reference.

What about doing the freeing before resuming the guest execution in
guest vCPU context?

We already have a hook like this on HVM in hvm_do_resume() calling
vpci_process_pending().  I wonder whether we could have a similar hook
for PV and keep the pages to be freed in the vCPU instead of the pCPU.
This would have the benefit of being able to context switch the vCPU
in case the operation takes too long.

Not that the current approach is wrong, but doing it in the guest
resume path we could likely prevent guests doing heavy p2m
modifications from hogging CPU time.

> ---
> v4: Change type of iommu_queue_free_pgtable()'s 1st parameter. Re-base.
> v3: Call process_pending_softirqs() from free_queued_pgtables().
> 
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -147,6 +147,7 @@ void iommu_free_domid(domid_t domid, uns
>  int __must_check iommu_free_pgtables(struct domain *d);
>  struct domain_iommu;
>  struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
> +void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
>  
>  #endif /* !__ARCH_X86_IOMMU_H__ */
>  /*
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -12,6 +12,7 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/cpu.h>
>  #include <xen/sched.h>
>  #include <xen/iommu.h>
>  #include <xen/paging.h>
> @@ -550,6 +551,91 @@ struct page_info *iommu_alloc_pgtable(st
>      return pg;
>  }
>  
> +/*
> + * Intermediate page tables which get replaced by large pages may only be
> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
> + * per-CPU list, with a per-CPU tasklet processing the list on the assumption
> + * that the necessary IOTLB flush will have occurred by the time tasklets get
> + * to run. (List and tasklet being per-CPU has the benefit of accesses not
> + * requiring any locking.)
> + */
> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
> +
> +static void free_queued_pgtables(void *arg)
> +{
> +    struct page_list_head *list = arg;
> +    struct page_info *pg;
> +    unsigned int done = 0;
> +

With the current logic I think it might be helpful to assert that the
list is not empty when we get here?

Given the operation requires a context switch we would like to avoid
such unless there's indeed pending work to do.

> +    while ( (pg = page_list_remove_head(list)) )
> +    {
> +        free_domheap_page(pg);
> +
> +        /* Granularity of checking somewhat arbitrary. */
> +        if ( !(++done & 0x1ff) )
> +             process_pending_softirqs();
> +    }
> +}
> +
> +void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg)
> +{
> +    unsigned int cpu = smp_processor_id();
> +
> +    spin_lock(&hd->arch.pgtables.lock);
> +    page_list_del(pg, &hd->arch.pgtables.list);
> +    spin_unlock(&hd->arch.pgtables.lock);
> +
> +    page_list_add_tail(pg, &per_cpu(free_pgt_list, cpu));
> +
> +    tasklet_schedule(&per_cpu(free_pgt_tasklet, cpu));
> +}
> +
> +static int cf_check cpu_callback(
> +    struct notifier_block *nfb, unsigned long action, void *hcpu)
> +{
> +    unsigned int cpu = (unsigned long)hcpu;
> +    struct page_list_head *list = &per_cpu(free_pgt_list, cpu);
> +    struct tasklet *tasklet = &per_cpu(free_pgt_tasklet, cpu);
> +
> +    switch ( action )
> +    {
> +    case CPU_DOWN_PREPARE:
> +        tasklet_kill(tasklet);
> +        break;
> +
> +    case CPU_DEAD:
> +        page_list_splice(list, &this_cpu(free_pgt_list));

I think you could check whether list is empty before queuing it?

Thanks, Roger.

