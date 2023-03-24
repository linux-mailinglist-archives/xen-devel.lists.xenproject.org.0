Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E562F6C7D17
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 12:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514267.796358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pffRC-0007fM-SB; Fri, 24 Mar 2023 11:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514267.796358; Fri, 24 Mar 2023 11:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pffRC-0007cK-NZ; Fri, 24 Mar 2023 11:18:26 +0000
Received: by outflank-mailman (input) for mailman id 514267;
 Fri, 24 Mar 2023 11:18:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pffRA-0007cE-OG
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 11:18:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 949f6521-ca35-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 12:18:22 +0100 (CET)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 07:18:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6972.namprd03.prod.outlook.com (2603:10b6:510:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 11:18:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 11:18:09 +0000
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
X-Inumbo-ID: 949f6521-ca35-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679656702;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eTYUTsF7h7NQetqYIJLBcg9xA1tpAfVus1HkfzXeFSY=;
  b=hsRhnS6EUd9x67aZZ75ZvfF0d+CGHg+pIYjaD221RDRX3LkmXJhGxcYD
   xGQCTDWX+h7moS0JVKpuXDYhUmzSr5T24PFgLZ+gL3CXTVGMZIG4ERFM6
   YdDoDcfbOM6HIgXl5UQH8dCRZ6wMlVfi2CGeOJbf8PhEocOIG3ikMXPBj
   g=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 104587616
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HFNFLK3YtUtZNCu54vbD5f5wkn2cJEfYwER7XKvMYLTBsI5bpz0Oy
 GYZW2yCOPaKN2f2Lth1Poyw/E8PsMOBytNhQVRspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfBzlU/
 +UTMCo0cRGsg7+E35u5bOYrr5F2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1QZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjBN9CS+PhqJaGhnXMyUI1IjQwFmHq++GTgF6FBe59C
 RMbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A79y9pog210jLVow6T/bzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQOzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:gE13Mqr0wjfHge/DrGFppdAaV5oveYIsimQD101hICG9E/bo8f
 xG+c5w6faaskd3ZJheo7G90cW7MBbhHOdOjbX5Xo3NYOCFggSVxehZhOOO/9SHIVycygc078
 xdmsNFeb/N5DZB/KLHCMXRKbYd/OU=
X-IronPort-AV: E=Sophos;i="5.98,287,1673931600"; 
   d="scan'208";a="104587616"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nA59q8qJAOSQnHzFFZZg2sz+o78+7OupRP8JOVM4rolrZL3mJzq+8SKiQIBqf8/uYVPEszW4aJA88NktBajLR1mFWL/ffUCUdc4oC90Uuuq2tFf9BTQf0/zC+Pb/pb2fvfKZBLR70JDigFdnhEplNqWZxdWtSJbkBCubGknaYE3Avubt7e6fnMJbAeQlHxQ9y9khlNKx0ezcvpQ9j+9Q1gBdUwhZTXlLF+TtaJMqAtaw6/X/QMixjoMC3nWMLeVARUK8Ysb/pEiRzG8PWIF0llAIp1XqvUx6Dvrsv1xd671uew13BH1xLyKM/Dtt3c3GyuGYGt+S8sk6UR03pJSDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTYUTsF7h7NQetqYIJLBcg9xA1tpAfVus1HkfzXeFSY=;
 b=Km5KWNANeR/suCsu+j3p8fmyeUtKxuzRZ916gEv8+F80P6hWtihpLR/BzI4SXU3yThX1wnLVNj74J0Slpy4MITUjNiT40aLzZDnLrsorDXGnI9gfJZn47oNeUdmSWRggJGtYH8+I52CMMdMun07X9tj+BvDxUBiI5BVrZmCiLunfvS65aDZQ7dci9TyYjlhyLB5RCq+SWmYEYTpS7gYBs9l784ngjthi+/9eYIg0eooZuCjYJidO49EGPa3i6LaYqbEMCAiFzoPE6llgr/N05+A8JQQPgOJrGcdU6ulN8iFsYQwmlt52MQi1e5T7SwSVHva51/5GF/wulUQxOyt+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTYUTsF7h7NQetqYIJLBcg9xA1tpAfVus1HkfzXeFSY=;
 b=tMH4k1nMU4mUH9QJwsX5S6/lhHUD/TC2ihS5gKDoRXskCFveMLsBkmAyfGZXEOkrDyAs64Kvr9VKnVHxGWtLwk50dPmGvd4TvrTtQtBLb6IRDbVs60UL1NCvp6v2j9VvAXn7sWMqFkEXi5KOLM8YfVXbdqNUk5Zqm4Z94n8MAcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <badc2219-bc83-fc92-ac05-caf8f24ca995@citrix.com>
Date: Fri, 24 Mar 2023 11:18:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/hvmloader: Don't build as PIC/PIE
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
 <20220824105915.32127-3-andrew.cooper3@citrix.com>
 <5a69da9c-5b91-2c79-c5a5-7a5335295d86@suse.com>
In-Reply-To: <5a69da9c-5b91-2c79-c5a5-7a5335295d86@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0477.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d235c70-a30d-49b1-b32a-08db2c597260
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eIcIRsjZdsvhc4aE8KwcnioT4yQbfdIdQ5cmpmq1FsIkwbz2Or252g/E1sNBi9d4+ydv6Hrc9Ki7fEWIZR4HX00HjVyS94d0+Sbj4Ef1k2t4sdgR98TGKtvnQ5GwCoNngAlNfDgs1cQxpslrS4GuY27IicHf8h7/5ftutuyhTmb8vGw2+UeLJ4hZzmFv0kpWJsZ7L8c9AsK5vcNGOVc7wyi0qVPCb4VBbaaCXPe9Y4m/Bm/Ke5U7pIiXR2CG+NBc6+p5H1lQ9EyQGXZEnAkDnWh36CoYPz/eYqErc78/Vz0rc4mHnflKzPSEw6m7avALK9cZeJSCpjRmcAYZOcn4dEd2abFCpdDvmK1NAsvEIawkoowcKeQDGDuQi/px0KTVFYCil6zJ2k84/UUWmzCeJKf4ftGXCa3qvXTC8z2tUJDADgJ/zjWk3W7ti+wE9Q6fFXRfZFqCW67itKx8HRhJvDwq+HelLeoxK1uFnPsXEnG04xjMKYMqVFpSlZbIGFDHmbmFG5elO0pLlhNr0MPc8RXmU/sV17n479u16L5Ya216p/HSjzHlhWv2ZGZy7Bmukskjy+8S/6BkD1VmxWcOd8Nq0wCaYaVd3dthJrZxTxkueoiR6WnmQA5Z+Cxc2PRn1scFV7YaxpojP80kdW+OS/ixlxpoEw0C+Cti+OCojcJX8nQB+PTrApMKbwbTewo08VmT+4+RneqcCh/NB6peDK1iVjN8iepS3cqScFojvaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(31686004)(38100700002)(2906002)(2616005)(478600001)(6486002)(186003)(316002)(31696002)(36756003)(83380400001)(86362001)(6666004)(54906003)(8676002)(6916009)(66556008)(66476007)(66946007)(53546011)(4326008)(41300700001)(6506007)(8936002)(26005)(6512007)(5660300002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjBGZWdHWm1ibVY3TXNCRUJDb3JjVlFPVkQ4bVRjYmhXbmF4dVpPRTNQbENL?=
 =?utf-8?B?amVBTW4weEdqN3UwMkFyK25xQzc4QldsM280Qk1vL0VNK01WeW5PMFZFTmRa?=
 =?utf-8?B?em5MaU9iaG5aekE2b0NQVWJrd2creFZTRjB5TUs3bHFTM2pTZEVhYlhLZWVZ?=
 =?utf-8?B?U2JXZEowdUI2TzNqUHc1UUZIUmxXZ2ozSUFIcU02cDhKZnlUNjJjLzVtNEFQ?=
 =?utf-8?B?MjhRdXlORlFkZU1lM3E4QWtvRms3RUQ4L0UzdTVQK2lJWm5zUzl4blU1N0FZ?=
 =?utf-8?B?Qm93ZXhXL3V5MXVJQXVYemhPeUpWK3FqRTd5VzZyWmllYkgyTGQ0c3Z0ZEhT?=
 =?utf-8?B?Tnl3UWl2QkpMTytOUm9kU3FJUExUdFBiZ2pBMzRlczdyZW1hS2VVVnNrVXZp?=
 =?utf-8?B?ZDRFeFpwR2NISjBsRDkvU1dyaWMwYnJ0dzN4TUg2QWp6WnBCL0FXejJSSW1G?=
 =?utf-8?B?eGNKb1dkY0c0MWFVZmJ2TG5YcCtxbTRtMUZZTWdJNUpOanMwWnJIMWIycHI0?=
 =?utf-8?B?Z0phZ0hxcUNjZmpVZjBMY0NYam1raG84bWpGSFpONHJDQ1lHTFNmK3FDV0h2?=
 =?utf-8?B?Z202LzRoT2ZUR3JKMjhURDkxL0swZXdRRlJsa20wQW1wQ2tTT0Q4d0JQSHNt?=
 =?utf-8?B?ZDNOYzNDUHdhWHBab2p6Z0JZODdKNlVtSnJZdkdkOWdtZ1pzd0o4MmNwczFG?=
 =?utf-8?B?WDhqWUUxRFF0Q2R4RkpzdjZZQmlMZTB3R3duN0RSZTk1bXZ6WVdTVFU0ZU5N?=
 =?utf-8?B?WTIyS1ZDT01wZUkrSmdPUmdlVHJueVZHako2cWg2SWFiK2RTQU84cHhaMWhJ?=
 =?utf-8?B?Q0NYbkpuREt0a2g2NlJQbFBkYm8ySFY4YWI4NFBRTTA1Uk01K25oSVVtYUdX?=
 =?utf-8?B?d0VSRWRLVWZxR1NkdkErd0JvazR5L0xqRHdqNHRPYkRtdTg4QkVoV21CcSty?=
 =?utf-8?B?ZktvbHJuTnZYTldLSERMWFlZMzk2ejlFemE5bVh0NEJNVzQ2ckF3NXpWK3pt?=
 =?utf-8?B?OGtiVUJnRm02MEpqVGRRODVJVXhmSUZ4Y2E2LytaWDJIeWpxVHlDZmpTNUZM?=
 =?utf-8?B?VndCYm5meEp1VGF3L2NhZ3o1cHdZa0pYRTcybGI5ZlUzOXlEU0hWV1FpYk5O?=
 =?utf-8?B?SzVWV3BSeERnU0Vpa2ppVkRNODJ2bVpCZ1pmOURhZVJMR2NFQTMzNzNIbHVl?=
 =?utf-8?B?VklWOVUrc1J4QUJZZ2dCOWVMcWV3Y0o3dmJETUlmdzVFT0VSNkFaS1Q5eE9n?=
 =?utf-8?B?OURJTjgwTzZTK2JyOG1DYTlyTVBSNWFsM1gyQjVmNHVKQnUrKzE2WW9SOENu?=
 =?utf-8?B?QlgxY0RvYVpoWmF1SHdzeW93eG5CWXo0QnR3eElidHYvM0VoTWx0N1lSQWVs?=
 =?utf-8?B?QklUcS9iV1ZlMVZKVk5POTBLWjkzbXE3VlJKanpnMm1RZkJaSlJQcFVIa2JX?=
 =?utf-8?B?Vmcya256bUlnZFAzUkEwc2gxYlBFQ0sxaEVFeXpIUEREVTJXY1RiT3FQK3pi?=
 =?utf-8?B?OE8xbzROYzNsc0doRk9GRVZnWkdNOFNwVWQ4akRpb2RHR0ozczI3bnpDem1w?=
 =?utf-8?B?NFZZQWZPUnB3YUJORkpoSTF2QkJ2VGl0bTRDY3RlRmdrVjlML0RDLzJSdDY5?=
 =?utf-8?B?U1dscXJpQlovN0U3cjJXaWwycGk2RWFSRDllRWVXU1ZUbkRFYk8zaHdvRTd3?=
 =?utf-8?B?UFBoQXZvWHZOTW4vaWl3TElhSVJBUjZDRkh1M05jbHN2SGtLeG15aFBUNnBO?=
 =?utf-8?B?N29RY0xPREhITTZwV3RlNXZwc0VzTS9XdlNHTkhPeUpTa2x4L1VYbWNDeE85?=
 =?utf-8?B?aE14RHpiQUIwbS9rM0ZSRWp4MjJEeVhpSG5wUUpVUkFpM2NXYm9hcW9SWHJG?=
 =?utf-8?B?LzFuMk5VZU9MUmsvOHhJYWYxWHAyUktJUjZGWjR2YnNNSE9nazF2M25PdFRG?=
 =?utf-8?B?ZmhBNFVlV1VXRG9iMVplbnN1WlBLWHFWd1lFWVljUnlyQUVlWXByMVNVUTJx?=
 =?utf-8?B?VVZHaFJuOGZFOU56ZllKc000bzgzd2lpajJidTE1ZWs4Z1Y3bmE0SUp6SFJM?=
 =?utf-8?B?dFVlK0hhQXNuTjQrTDJPUW5uQlZVUE5zeHdYbWxraUEyd2lBdTQ1SHJCUGV4?=
 =?utf-8?B?L3hoeTlXUExKOFlXVGtOU25RWTc5SjhaSG85bmlRbmNYMWNWdnJoMGxhS1l1?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YkVy8j2WUESmGS4ubJi0leF9Bbeqyjuzs8MOFSK8aMsEKqd2Gb6btBzkAJS5qBa26RXi8ywbk++os8BF7Vna3cyCx4bUJx2KUBJsHcc0A0dWJkfL/FzRMtHL0Shst29UBXfs2gyHpC5gWbAKLWMLZZG4Du7McxRn9rUd2GoL371V0rpMGEauLTSHNUKNNIJyvqVYsd7Cn8hSNJTPWQoOOhxdTg03DFxnCbVWKwNXLOPmnx2i616aKKvwZqUZBbZONFMGpTCRsn2g1jIo/fHO+jzMBSvCYGqr7h7GALokuuCPfvOO2AvmcGLNEt/oo6KrZbGzl45SZABsfnQ2/FDKuwSLddEBd6val1jFNfnFczrDfGK5k6Z5suVnDHeT0AOlThmQ/JpcIdiZHSkbALIy6In6fVnmWC9sLcVYYU44gzmG4WtYwstGdQNTmgksUerXRRk0pBS5BAYxxmC6QpTqb6LDrg+bZCqRCGI3REVCAUM0Uq97n0n59V0e56jWo56qmomE62QNnISBYcAdl4HxKgK8FuaU7OXLZ/wZ0y1gf3v9QOLhSloxzh0HILbm0GjnG1SqyEMYYbosHCHsLl5btWtYHvetpV7B8aw3cmAV8X2hQBd6dtOguim/6lmQDAlBqBET9i34YTSvK7GReadzK7c5weFJENBFDGbf7uNVDxJDpB1jxrQRpEoGvOWIlM+TiofFQmDO5uoaR/MQE5+XtO3Zsvf9sp4LKNNac+PYK9p0rTQGOeBBlSISJRb8h0Z1UVVPH8sd6KcczfbIIhzDnBa+1b4MQsT4t+R4PFBGM0/9llr3bc+GsQNmCeG5aLkHFN1GgwC6PothdgPWVYCIsw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d235c70-a30d-49b1-b32a-08db2c597260
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 11:18:09.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIr4otQ9blSB0Fr3gM95HRBzDp2zzygwuSkn4kW/sNjwbddB3MwO45MBzL4gulkd+o5X3ieOgRSsdVLVfMdHvZ9W8BHn5+TQ06h7OYF4VYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6972

On 25/08/2022 8:20 am, Jan Beulich wrote:
> On 24.08.2022 12:59, Andrew Cooper wrote:
>> HVMLoader is not relocatable in memory, and 32bit PIC code has a large
>> overhead.  Build it as non-relocatable.
>>
>> Bloat-o-meter reports a net:
>>   add/remove: 0/0 grow/shrink: 3/107 up/down: 14/-3370 (-3356)
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  tools/firmware/hvmloader/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/firmware/hvmloader/Makefile
>> b/tools/firmware/hvmloader/Makefile
>> index 4f31c881613c..eb757819274b 100644
>> --- a/tools/firmware/hvmloader/Makefile
>> +++ b/tools/firmware/hvmloader/Makefile
>> @@ -23,7 +23,8 @@ include $(XEN_ROOT)/tools/firmware/Rules.mk
>>  # SMBIOS spec requires format mm/dd/yyyy
>>  SMBIOS_REL_DATE ?= $(shell date +%m/%d/%Y)
>>  
>> -CFLAGS += $(CFLAGS_xeninclude)
>> +CFLAGS += $(CFLAGS_xeninclude) -fno-pic
>> +$(call cc-option-add,CFLAGS,-no-pie)
>
> This is supposed to be coming from EMBEDDED_EXTRA_CFLAGS, if only
> it was spelled correctly there. See the patch just sent. This line
> (see that other patch) is meaningless anyway, as we don't use
> $(CFLAGS) for linking here. So with it dropped
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I do think though that the description could do with some expanding,
> as I don't think -fpic or -fPIC is the default normally. I suppose
> it's only specific distros which make this the default.

Yeah, for ASLR reasons, but that covers ~all of our downstream users.

I'll tweak the commit message and drop the PIE part.

~Andrew

