Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69557A040C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 14:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602242.938685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qglc2-0003Ie-NB; Thu, 14 Sep 2023 12:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602242.938685; Thu, 14 Sep 2023 12:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qglc2-0003Fy-JL; Thu, 14 Sep 2023 12:38:26 +0000
Received: by outflank-mailman (input) for mailman id 602242;
 Thu, 14 Sep 2023 12:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3lF=E6=citrix.com=prvs=61487cf85=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qglc0-0003Fe-TL
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 12:38:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92d9e6d0-52fb-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 14:38:22 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2023 08:38:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5913.namprd03.prod.outlook.com (2603:10b6:806:11d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 12:38:05 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 12:38:05 +0000
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
X-Inumbo-ID: 92d9e6d0-52fb-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694695103;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tqB5gZlLl/AISw0XNxGKSmweJF2jhgBQTSJT7Fn7zy4=;
  b=B6Jg2YWaGSBKClc1Pf887tH1ezYFqk22KrAYaGGUVYrubuO1zfSIM64J
   Us/XfEh6M9YKPie4bgX+4kPD34X8d53KJPJnxoKh0MW3tSDk97qQ14Hp+
   G8eMeLoXPCdNX5Xjgvu4ye3Bu41fcW2jCOx3D2COmbDAFxPgrv+i1ni7F
   8=;
X-CSE-ConnectionGUID: GiVE7edqT1Ka4wnXOWhvgw==
X-CSE-MsgGUID: AQU/qrZCR6OHbycb+NB/yg==
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 125353442
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:hj9zCK/0h3wcUrPC88HQDrUDsn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GsWDW7VPP6KZ2b1L95zaY3l908E6pbcxtZnS1M5/C88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNKkX5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklh9
 MI1dz0BdyzapOvq37SLbdZsmMs8eZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUuidABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwHimA95OTtVU8NZDuWDU33YhIydIcnuxsPKzyWiUHMNQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZab9grssIeQiQn0
 FWSk5XuHzMHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXryos1LFae0ipj+Hmj2y
 jXT9Swm3exM1IgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:+35ts6wvB9+4w07XApmQKrPwB71zdoMgy1knxilNoH1uA6mlfq
 WV9pkmPHDP5Ar5NEtOpTn4Atj4fZq+z+8W3WByB9eftWDd0QOVxedZg7cKqAeQeBEWmNQ96U
 5WSdkbNDShNzNHZB7BkXKF+gwbsb+6GX2T9IDjJqtWPHlXgn9bnn1ENjo=
X-Talos-CUID: 9a23:v/h4J23FSQVx/TgObsYY57xfNcEbXyLQwG7semyxVXlveJqqSUGf5/Yx
X-Talos-MUID: 9a23:hZs8VAjUSRDqkI1T2DryKMMpHf5VpL20Oms3z7ImsdiPP29WEXCMg2Hi
X-IronPort-AV: E=Sophos;i="6.02,146,1688443200"; 
   d="scan'208";a="125353442"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THW3iykrK2Gzr0LUeecWY9AjRLUVO0QPHBp1NKFKwwandZnsR4xH2GsvZGL4wQO+Ag5wiGGD7E6hMAPQynmCWoT7gl3DfrRYZsjRv1A9nnuDgsN3PDb6KOrrwkDNBHkYqebBb6fTGM6LhnrNDHl92ay1w0XMxMvfantdpwP/wJwFUfBBgc6BlcuReDTJ23fDWxrS8cWwYqmmEvPSNLkerguykzheq5gQM19g2rCDNUCIxb+10oGOf78TeixHPuATeSFrwDCkTnzm3B+WbVA8aG7DpSKj1DRY4IxzMzeqijdRO2vRDMt+k4J+VGkkI7TH0h3kTVEdTaXTW/URcqVhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWrB9Pq/42EEw2thATh68/NsnMyZa1vXuDE5bccAiK0=;
 b=L61/6GC/nlP0JcLiwbn8CBGdVyOVc7LAoPtOjaPE2vn7uciGFKGSXeDv5/nReD5efZjmUqOk4sScKIGSAX213mLTCXHfN7mozKlPj85RlZliNoGmLOdohc/tfgPolD1KZdXv2QkAnntzxo/qEtrCpAKJNruEMiBU/z7eoyR5aC3i9HBwNupRGgXCVBqMRdc8svzVCZhKDVG96kulunfuQk58slNdvnmLPoW4124iLrD9w5nKZRGmRwvxe8HqstgKl09hij4T5eJjr3CWhmCEy+PRWZEpPklLozEe3nU51/Aagzfuxvj8UXD1COquCUjs0xpcW7o5RAhwaEHapiO8Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWrB9Pq/42EEw2thATh68/NsnMyZa1vXuDE5bccAiK0=;
 b=LLe3O3tKQfNr4QmHuP9ryYqVMk29d6BqEhC2q0sKikZRWrzmsKUdHdvihQWgW1zh22fKaq6qqEJELdSxDp0dlPUmIw1nYd8ylBExplIxbGbNgXDeSm1I8gE7bb9voE7q9krOZEzi7OtZlbyQvNWoqpxy76Z4xYArUiemCK8w5ic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 Sep 2023 14:37:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?Q?Sol=C3=A8ne?= Rapenne <solene@openbsd.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
Message-ID: <ZQL-p3LJX7WfwCtC@MacBook-MacBook-Pro-de-Roger.local>
References: <20230913145220.11334-1-roger.pau@citrix.com>
 <e2fe16de-cb08-4a0b-adfe-95da6c86ea16@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2fe16de-cb08-4a0b-adfe-95da6c86ea16@suse.com>
X-ClientProxiedBy: LO4P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 9317d1a2-20bd-430f-dbbb-08dbb51f7143
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L6QIZoX0sKBpUibSAIUUPbJDl8K6Ln7Bq56pubuO4ZIyL56AFXEk+LKhUbLGbB+8aITWiqwrEMV+TSA2lOOkXUBAhZOsaAC+qa1Mny0ZxYfcOOODvcJnOu2C7Y0D83C22x7cXduv6B8ykUb7wrGHmfKq1MIEEk+TOGS/Kcf1Mbh94QbQ0X5C2Sn8WeC95flDMqhxtPsh/VDJnaVorQsSRLQ9UGyE4hqT1r9wJCnBVNQeukNhBN/t1cTaAST9Fvda8EW30Ctgyx2Ecu8/M9lU/YFfKT4JD2XbEjPe+BmACGAqNSX/1N81vZycgCf38Vl3JXnlTRsqoaDxGF3jMLtQjkZOTWZnmiUt3GMsRNGCOlfrZAKdWTnplWZFa3nZFnFNvzu3NJP1n0qou4HQK1SDmfjTVa+Q5GRDnohj4CBjqXkN2u/ujWUF1gdIGopesRyNC+P4dhAi575xDkkBr1mPrpFWp/FgBV5xX3glkqVwXYBes3F7Nqks+kHX4eTa7TUuzjTWzh23trA3ZtL2gxM1xbXw9BXaGrjyQ+k6Ry8s+wA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(1800799009)(186009)(451199024)(5660300002)(478600001)(41300700001)(316002)(8936002)(8676002)(26005)(66574015)(86362001)(4326008)(6916009)(54906003)(83380400001)(82960400001)(85182001)(2906002)(38100700002)(6506007)(6512007)(53546011)(6486002)(966005)(66556008)(66946007)(66476007)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGxDb2taWUlRclVQRmI5ZVdtNldjY3ZBb253T21uS2NqaFduRTQ3WEdoRStI?=
 =?utf-8?B?RTV5Q2cwMCtFMHNBMzVEWU1aOVdMT1NwcTFnS0VQazB0WnBxZ3dpUXhIMFZY?=
 =?utf-8?B?VUVzNnJNaHN6RXp0b2RRMnkvK1hOdzV5a3NNZXF0OG1LdlN5cmF0dFNLUlF6?=
 =?utf-8?B?MkRqU0NWV1JMTXRLWWxZUlhrT1VhYnVUVGJLUjFLWjRNZXU0MmgzY25od2ZY?=
 =?utf-8?B?cFcwT25Oc2N6T1hDVExpUmpBOHdFaUtqTVYvdVJGNHMrNlZQWDJ5YTVLdXFx?=
 =?utf-8?B?WFk2WGVzZ1FDUElGalljZFNRa0R3VzFKclRGbUo4clEvNFVVVDJUSU13b1NS?=
 =?utf-8?B?b3llMGlUaWdDSFRnNnRzZkNBTVJTaTlLTjFiNFFzUjBPa1BVTVgrNHc2Nm5r?=
 =?utf-8?B?NDhvS3NNQm1iVkZZdU1jdDd4NFpXNzRrbmxxaXF1b05PcHIxY3ZwdWtlUitU?=
 =?utf-8?B?K0RDWFhMOHhhRzg5Q3BkblVhcUhFUmsxWXR1aVRpU2ZmZ1FYN3dDajRKTUJx?=
 =?utf-8?B?UVRRRDgxUFU3R0lPc3pSR1o4K1BkdEtJS245VXozWU9ZV0s2MXRwbjF1bm56?=
 =?utf-8?B?dllidVlDMHVLYjR4QlFQM3pJL0JJeWwwTS9WNDdVRUVRcWcxMkZrdEFFKzlD?=
 =?utf-8?B?a1BMRGxGbHQ1ODdoeW8zUTdRTEJyZUF1OVdOYXBQM3hla1l5NFNYbTYvaEkx?=
 =?utf-8?B?TXlIOVI5ZTR2Z2hyMXFzaTg2T3NPVXkzQ2JIQ1EwdHZUTHlaKy9xcEpxQUZt?=
 =?utf-8?B?V0hpR0kvN0ErZkRmeFdOOHdCd3BQM2J2T1VLOE9LMmppdDQ5V2JYL2lxY0ZS?=
 =?utf-8?B?L3EzOWcrUmVNdjNVVXBRNTBUYlRodElHNFVDa1c3WWdQZ251WGpOQzl5bCt5?=
 =?utf-8?B?cndLN2pkYzIveDhwR1Zvc3VVc3k4VnpuMnNsbXZqb0RjU240eHJSZkFBaXZt?=
 =?utf-8?B?TUdHeTdtTFdtVFU1NGdkZlhtM2dzNWRzODA4ZENZaGlHelQ5WHVkSlU4Wk1K?=
 =?utf-8?B?elZqVDNnc3IxTjN1a2ZBS0huNGEySTl5QnJFL29FbGMvdnVoeGcrVlQ3SVRB?=
 =?utf-8?B?a1pFTkxXZWdXcVhsVG5kazZrYU1jWVF2OHBiOCtCbmdVK0FQSmVKem1vNzY3?=
 =?utf-8?B?elN3dmQ3TVRrdVB1Tjh4dEZqUnMycVFSdU52ampzL0MvWjljdlBlcFdPYjRL?=
 =?utf-8?B?QUIxd3plVjBuK3dJU2lEb043N2N1NXpudWEzVW5pNVV4M2E5Y2p0dmZQcTYz?=
 =?utf-8?B?VGVJNGYzKzJibldGbFRkRW9aT2tFelRHSVNUM2RFYXFTWlVlY2tCc21EMmd6?=
 =?utf-8?B?TzB1bC9ybTIwbkF5UUpja01mMXc2ejFYcGR3aitPZkNmeUNqVXFaN0NkR2R6?=
 =?utf-8?B?OUdRRnBkWEhVemZkUDhMS0pjU3FvZjFiS1JQUmlQbDRSSytPUHhWVHZDK1Zw?=
 =?utf-8?B?VVRTanhJS2o0VFhJc29ITUwwL3A1NDhBUnVEWHJ4QWxPYnZMbUVmbk1UYmhu?=
 =?utf-8?B?NDQ1dGJ1RlFleFkwWDEvZkVlNDZVakRtM29sQUc2ZnZGNEppdHZQM3FrRE5T?=
 =?utf-8?B?TkJNbmFyaThwdUVwZDhldUJ4ckhhQmsyZjNPL1ZIQ0dobkhqZ0pRUDZzNGZ0?=
 =?utf-8?B?S3MxaThvUGxuZEJnZHpCNmwrZENCSnpsdTAzNWUwQ1JNZFZaRHIva0NFK3lB?=
 =?utf-8?B?a2IvS2Jxc2J0R24ra2FTSTRTdXdQZXpMNUF2WE1zSzFueXhxcE9JeXRiODQ1?=
 =?utf-8?B?NXFOSExyYmR3NXovTTBPZnFkQytzZit2NXUwUHl5N29ZOTkyUE51bCtadUtL?=
 =?utf-8?B?YW1LZERVTTZBK0Q1dnZNY1o5Sjk0Y3RsNHkybVNhU0x5dmcxdTZuY3NaYVN4?=
 =?utf-8?B?QWYxWXN4WkpmTjF4TzVCdEF3WnFyUHQvWE9IeldLZkNYdjNBUXBiYXlkaGNa?=
 =?utf-8?B?Ni95MVRNak8ranVJc2l2b3Z4QzFuOTVUVklUUWgxVEJ0R0p5Tis5WHdCbzU3?=
 =?utf-8?B?V3FjaERKZy8ra3NZcldmM2I0a0hWU29wQ3Rvdko2V3dVYlFQNWxyaUNNRDIr?=
 =?utf-8?B?d3EvaHNsT0ZqOHRVVUt6N0Jkdm9LcFVLYjlwUzZOOFpaTkQxd2hYSFZvc0Vh?=
 =?utf-8?Q?ySss5Av94unFj/jqlH5iZfCW+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2brilWlNYVfOdYeOERsXfl6kLA5+lNvyzHg554/jPV6oqygL3ZvbRpwWQfI9hMFOAH/+7aC/CSw6DteiMDJrP7RkZbpPYxcrAnTD+U3S8xdE2fKJn+LG5RIFJOsaLOxJeliTvnIsTG9rKg1rfIjwnX3ZzHO3ICC59P+lc9VUgb877HCtbnlisoPB871wBdAzD58EA3DjX3lVT9h9DAauySbYVFUvYDTGdlXL7LN/pG2Vbbq0CDKxq125qSgHpWtUujen+HjP/jRBlQvMz7iWI+iQSg5N/iS8scaSAYAMAzBJ4VoN6/22sFgmS9iohKrswXjJEeguCMD5ua9h3vRonDgk3+C5ZKQUf4gUEZzhf6RaYQsWUTqE5WbzBXf6JWiLXuShkSerxEfbfYkgKEJICxGr0RDA6HcPv7ntO7NWaLhj1aK/xLiV4l7iLsEtqrwsXvJoTgf8eZzZkTkd/RRCfdooiOi/nipGR9leyAJ1L3VRW+4ia7Np4Y+YvYM1Dl8sNgEqdqyfftnF2RZSMa+QrW3e9ufKJoR4IngPB9RacQ/jsWsQ6i4KOdX/FhI2r3pWv0kWZqFuT0TdFWQJIb5QqhEbkWMsupWuLxxTnzUddNaoNAEtR6KduJsNQxPKmucu86j6IDVXMFN6hg8fP4OnoZ1ER5IKT80A3MugI6ZndUMYDetrg6aFcNlp7x/ZEEwujGUfT5K2l+whMthiZY9sgYQzsBD8KpxzCYvSBqqyR2eFO+4b3YIJdqHzQYCiUgWZGSoRMC0eXq2H3RW6edSqHqIvKPFRRPsuBR3gCBEIqpEGT8py7rn+kKj/152nTPDhGOj2L+9a/r+uDAgSV8rCtxiNs+oJ5+AaqK1wnFFabs8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9317d1a2-20bd-430f-dbbb-08dbb51f7143
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:38:05.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbNK7MXvRePli9m19nbzFskuAg3KLbGOxNifEpc1Tf6WDsRQqbL7lRukVREdnPoo39hhpRJGaRDVNwIS/vM99g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5913

On Thu, Sep 14, 2023 at 07:52:33AM +0200, Jan Beulich wrote:
> On 13.09.2023 16:52, Roger Pau Monne wrote:
> > OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
> > Invariant, and it will then attempt to also unconditionally access PSTATE0 if
> > HWCR.TscFreqSel is set (currently the case on Xen).
> > 
> > The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
> > the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
> > TSC increments at the P0 frequency.
> > 
> > Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
> > because the PstateEn bit is read-write, and OSes could legitimately attempt to
> > set PstateEn=1 which Xen couldn't handle.
> > 
> > In order to fix expose an empty HWCR, which is an architectural MSR and so must
> > be accessible.
> > 
> > Note it was not safe to expose the TscFreqSel bit because it is not
> > architectural, and could change meaning between models.
> 
> This imo wants (or even needs) extending to address the aspect of then
> exposing, on newer families, a r/o bit with the wrong value.

We could always be exposing bits with the wrong values on newer
(unreleased?) families, I'm not sure why it needs explicit mentioning
here.

> > Reported-by: Solène Rapenne <solene@openbsd.org>
> > Link: https://github.com/QubesOS/qubes-issues/issues/8502
> > Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> As mentioned before, with this Fixes: tag I think the description
> absolutely needs to mention the (changed) view on the Linux log message
> that had triggered the original change. It certainly helps here that
> Thomas has already signaled agreement to a Linux side change.

Sure, what about:

"The motivation for exposing HWCR.TscFreqSel was to avoid warning
messages from Linux.  It has been agreed that Linux should be changed
instead to not complaint about missing HWCR.TscFreqSel when running
virtualized."

Thanks, Roger.

