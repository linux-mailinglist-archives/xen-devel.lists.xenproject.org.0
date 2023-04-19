Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC96E779E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523312.813242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5Hf-0003yH-8M; Wed, 19 Apr 2023 10:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523312.813242; Wed, 19 Apr 2023 10:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5Hf-0003ux-5S; Wed, 19 Apr 2023 10:43:31 +0000
Received: by outflank-mailman (input) for mailman id 523312;
 Wed, 19 Apr 2023 10:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp5Hd-0003un-I4
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:43:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01accab8-de9f-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 12:43:27 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 06:43:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB4989.namprd03.prod.outlook.com (2603:10b6:208:1a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 10:43:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:43:08 +0000
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
X-Inumbo-ID: 01accab8-de9f-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681901007;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rlNNSuetub0TtpXM4QrP+7ZksCvo/FS6QUeGxDg1gYU=;
  b=dJ2tV8sdHBrE+OCV8V6/Suuh6t4KkUzTc1KPMqduzfnjpG9D43fUCA3o
   uT7QkAYOL/zLTgi7gZf8Pm/LHUOCKVLJuAfve4snWnfgqYQbwbLuzc9D3
   oioLWhYUHrnccOTQNZfLhZJDI7Gr0HGV0zojGQIyHFlYdMd59fm+cjg/K
   U=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 105428109
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F+9ao60IJZYQVB04cPbD5Vdwkn2cJEfYwER7XKvMYLTBsI5bp2RSy
 WAcXzrQPPmIM2D8c4x1PoWwoE0Pu8TVy4QwS1Y5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnNagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLjwW0
 vUUNhw0TE7emOyp8amAaqpTr5F2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1IZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rKTx3OiANN6+LuQ9a83mU+WwWgqWRQudF3imd6Dmh+ZcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRPvbuPWDSi/7GbhTqoPG4eKmpqTSQDSA4Y5dj/scc2hxTGQdt5OL64iMXvHjP9y
 CzMqzIx750RkMoK2qOT7V3BxTW2qfDhVRUp7w/aWmak6AJRZ4O/YYGsr1/B4p5oM4KxXlSH+
 n8elKCjAPsmCJiMkGmGR7wLFbTwvvKdamSD3xhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLITrwJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:tIpUvKxuw0HITgwQEBeVKrPwFr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I4OrwXpVoI0m9yXcF2+gs1N6ZNWGN1VdAR7sSjrcKrQeQfxHWx6pw0r
 phbrg7KPCYNykcsS8i2njbLz/3+qjjzJyV
X-Talos-CUID: 9a23:c0GYTWC/ssaxSEP6EwY6rGkdFt4JS1+DkWjePH6jMkYqd5TAHA==
X-Talos-MUID: 9a23:Kg7IPggjmkecBJNwyv6dkMMpN5Y1+rarD0Q0wJw+ms/dDQtKK2a6pWHi
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="105428109"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ig7LToGyKX4fzh420WyVzuyhyjBcwS5A8r1h3xSLuOwuHTBfL36jgjAkC2+PEWNoWNVjjLeg2PPQHoHLrAabDmM9TGGUrUJYh2r7rofib+BX4fEO6XiscNZWCHj2axWwGpCYR3CeY9VGsvHyg5teX42lnUzCWM6HE4UtKWz2C4YmS3CLrL6R4eaUoi8REANCBR9zT+3vVno4xLxYue1ONFjVZ5q1WLPensrgCoZjky1/3HWHa3efdLnKgJlw8pGgKIDjKD8+e4vJ5p8fKWXYlygekqhtwxo/AXXv0aUzwcdb9hPlJuuGB8NSH/ig7xC3ixsVdiOd1Ncx2dLgFNelDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1dZ4MdggJ3XVqh4kGp8C/FJwRikOHRyrhdlvHMotLw=;
 b=D2w3JXJCBzsP98VUmflzQXM4a/ejKzkPJ8LVY2QYdvOoukEr2at2OhKEpsxuMCi5wK+Th1XU4jZCPvdCIE35vWqiN4I0rw1cnSOOdMnHX0prCRdzNM5qwDHAbzoo9lMDOLK3v69ysiSxqmlvRYThF01JdOiqw0kemnhqF0/kh6Ux7Ixr8KZLBrS0oQraigDRN+mK9I9tj1BdmixyZSg4rRzVVXiopVGQvPDLhkQYnABz5aOJ3nvR733vTZ2BUfc4RHnC4yyNgKeAamECROucKeRD3kvgv3PssEr+Kd36pPKpD802bnkku2HU2QoHA/13+rlyA5BPZ944j5gaQJJvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1dZ4MdggJ3XVqh4kGp8C/FJwRikOHRyrhdlvHMotLw=;
 b=IPgYuYWffizwaXcxfIKt7UlCPt2FykRgzpVG+R9SC4qkJzl5XqfXUwLVMNoG2sLiww4oVDqq0jQnbzejC8mQ2lj9bA1nds5jyaLI0O4jVR8tNbNphCXJI+d11jd2JjfhRUU51EHqNRM7367lHN8+Lxqx7Xp4NrQtkzptKStl87c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 12:43:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Message-ID: <ZD/FttS9Fkz7XExY@Air-de-Roger>
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
 <ZD6/Fk6S6D421AgE@Air-de-Roger>
 <acea0109-967b-f3d3-2a60-b71e5a207ea6@citrix.com>
 <ZD+3Y+YYQxFSoAJi@Air-de-Roger>
 <38fcc039-bdd2-b939-d619-97621abc74d4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38fcc039-bdd2-b939-d619-97621abc74d4@suse.com>
X-ClientProxiedBy: LO4P123CA0634.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 7adea02f-478a-46d5-1028-08db40c2dd0b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CmJF+f3R7hbZY+AnAfOz1+erBjCwy80SpTJqYDT7m2upngpsECC5Pf5Stlj04/2xyDt+mv7tKh35t6HoI/DL+AlGCunsPHGo4A94PLqBPJ9gIjpXw3s/RjpWHuDk6DE3jvjxitnUwhi3BVGhBYQz9hXiOCLU82Mso1XZdClvG1iky8mt1A0pG/Zvbj+DAEfKzDqGxX/UoCRwtlgF8Fwgww1Sot4IJdn5O+tbQR5nGr8E4vfmftX7o7zM7TCsNDM3oz0lpUFvf0HB28GuSmHo4DFPYrQR8zx/v9WlxvrYNCuxgF2Nezm9KfH6BXRWYxosfuqGft6Ego+7Z2czeHGKaquMeYzpbib4L8UxyIRm54Dh12JbOTAJg3L6fbvwcgY0LAmVmYwB2PSYat/84zATm8Q5nrOcNoc54M8cHnJt1OvWUb3wzPNd6C09nyML663lcGYndO2Exrhiu9FYBVbD87Mh4AMymmcxtuAXjBpV6nRmJ5dzPmH9owUseAvYn4F9IvgwsbN98NEBI1INAcaLPATn5sVZXm5lHAgn6C5mxBoK2PQZCelvBN1VH3J5m+Sv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(33716001)(86362001)(2906002)(85182001)(9686003)(6486002)(6666004)(186003)(53546011)(83380400001)(6512007)(6506007)(26005)(107886003)(478600001)(66946007)(66556008)(66476007)(6916009)(4326008)(82960400001)(41300700001)(38100700002)(54906003)(316002)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkpoK0RiNTVRd3BzcEdremNjSWc3NXEzSitNVjZPMjBWSzRoSlJJbVB6RkRO?=
 =?utf-8?B?cDg0YlZSaXhHTGdPd1pYNEZJc3cvSHdSeSt1MlhiajFsdGM0ZWhiQXRPTDk2?=
 =?utf-8?B?VndPc0NlWFlZVlVkOVJTL2tsWHZiYTB6MTNWT05qT2NkdDI3TXFGUWxZOFlr?=
 =?utf-8?B?OGREaGl6OGJqWHlKbDhJcFRMZGkyQjV3Mm9XNDJ3dTRialBJRDVEaFQvaHJ1?=
 =?utf-8?B?LzU5K25OYWxkTjE2QkRsUUlQcXA3bnZJTWxsb0I0T2o2d3lJV1J1VzhlWVNm?=
 =?utf-8?B?bWtCMnBhUks1dDVDdVQ4SGtWOFd1dFp0STNVYlpGb3BBa0dCaUE5d2xSN3JM?=
 =?utf-8?B?VDZsTHFNYXBYR2Y1ZTIwVGZqbWpDb1BkL3U1eDNESVBra3hJWkwxelVLVEhM?=
 =?utf-8?B?Wmp4V0xRTEIwR0dTRWdHd3FpYno5dTFyMUxaU3BlYXZVUWF0dlQ2bnh6Yno5?=
 =?utf-8?B?aENNMHBXMkkzQWM4K0ZWOGtxdnptb1UzMFRxUkQ5NmZoZzQ3V2loSVhPZktz?=
 =?utf-8?B?Wkh2cVF6NzVLMzdDTXJTa2FDSlRuVnVpWUNKY2tFcFRGVjAxMDN5UThKMndr?=
 =?utf-8?B?djVnTW54a29EY09keHpEMWtOVENXakNrbVB2eTJpL2ZOeUFQVzBKdFppdXls?=
 =?utf-8?B?OU1mMkdHMHBqSm9YM2xNOGhRWWY0a01ZNFo1bFpxNVVhdk1ibnVzdElzQTNw?=
 =?utf-8?B?dVBjc21FaktKZEpzaE5XUmlWNHo1OGdaWm5LVm5ES0duZjVRRDJEWXRGNlFy?=
 =?utf-8?B?U2tUMm9BTFVkazJZODFBVDNodTMwa0psc0FKd0I3Wmt0bmFyeTBEbENBN2JT?=
 =?utf-8?B?dUd1NEZyRFRQMWswMkxaejF3S28vTUx0SGFOYVVxbjhiSDhROENaZWJlUnBH?=
 =?utf-8?B?NldzZHJSODFXS3l1dkNnUE93bTJaampoTlZyblVabW05T1V4NlJ4a0xQNUxm?=
 =?utf-8?B?RFBLY2Nhb1o1aUd5YVM3aE1OU0hZNkZqSzBJdGRUaGJnazZUc3YwTnZnSGFL?=
 =?utf-8?B?UE1mM1hlZWs2L29XTGhWcm1JZzZWWElKaE9JMEVqSE93WlRBUmNwbk1KZGhD?=
 =?utf-8?B?c0ZRRnFoNXJ0Wkk3K3IrMEwxRmNhZnF4MWZCUUU3V2V1K1FWL1JybU9yQ2lO?=
 =?utf-8?B?U2hGMWY0OWNJeEJjTVlVaXV5ZDg5VThMSVBNMFM0RnNWVXhjUDQrOXl6b1Ry?=
 =?utf-8?B?RENuYzdXb3pSajFwUmk5c3VLK3YxS0xWTGV1YWRaV2ltdWpvc09lRmFkeFd1?=
 =?utf-8?B?dFhXQ09YLzVKU1dCZGZqL3VkV1UwNmxjQUdjcTJ0QXVIN0ZNbk9QdHJTQmlY?=
 =?utf-8?B?L3NvODlhbWxEekp3S2haaEppdlhpdkwwQ2tPOElpZzhjL1orSi9kdGt1alJH?=
 =?utf-8?B?eFg2V05oR1pUYjR0Q3BRUVJZQXpHdWl4WWM1MFIyczdZOXJrTkpocEJjMEgw?=
 =?utf-8?B?QzhQNndQZzZjVVJURWdYalgvcHpTcFE1ZHZJdldCcko3Nlc0Mk82eDU5cjU0?=
 =?utf-8?B?M0FucFJ0OWFNaFZrcjU4b01TcmVPQ0lkbFZoSGNkbGh5NXpJdnlaR2pDTW9C?=
 =?utf-8?B?dWRTMlJnRXdDSGVXZ29TNkwyaWx1ODE0bVhHbzd0aHRTYm5sT3JSOXY1Q0VG?=
 =?utf-8?B?RmxxUzRFNjdaakRFYmRXbVJEVTlJNlpLdFFyNGpKOW56Z3c1dE9jYzNmVS91?=
 =?utf-8?B?RTNtQkE5S1BFN1hFR1pLcEkzdS9qNGhIOGpqV3dzdElSLzRyRjNoNWp4TFdy?=
 =?utf-8?B?bXJJdFN5WHB4YzByVTBiQUJPZWpSdmpNUmtPWlQvVVRNL3JURFhsN1VNOElk?=
 =?utf-8?B?YmthYTNJWm9wcWdjQmI3OU9NS0dLTThTSG1sNzJxSTMxTWFwcUx4NUNaVW44?=
 =?utf-8?B?SVVUNHp5Q0lRTmtGcXNqL2t2V1hmUlQ4Z2VCZW1CRUdXaklEL0Z2ZmxyRGFJ?=
 =?utf-8?B?eVFqMC8yTnBjdzBQSTVVZzB6VGxqbWNXYWhWNXo0MXlnNjdCaDcrK2NieUEw?=
 =?utf-8?B?bVk1RHdrQnhYY1lNM25rTFgxa1pONHBDdXlQNzQ3MUFxZUFWN2QzVkxmdnFR?=
 =?utf-8?B?RVBRZGhiSHgxRE84cGhIZEZxVmUrNTBtcXB1UXNFNWR6bU5oZlYxTVVweUdy?=
 =?utf-8?B?RXNabHRNajhvcjlUb2hlaEdIam1ncmx1V1RkeDR0OHpkQk42SkVQNi91ZVFJ?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ITOg5casl78EXE5zUbKjpeDQN8o71cp6TSM8vkrDLYCcTlaR39WRMV7i6kMU0JlQgU7KEuGbgF3Wn61fpKz2fPxTDVl7H/6uR86bPgJfFnfr9jDQxY8KKnt68jI772iJepkPo/WKie0//aXj5lRsl1CzaPu4pTjch89zXVCHiD0fd4WUQ3XROB2Y0tqVrCE8xL/QWliBciRMliQUIQplEfEAbdZ97B7W0vZ/fmFqfL+gI0NqiDgySGL2j/0lam6odcc4a6HptqY6kuwcFp2gLAsRrU7Qik5LdRfioP59d5J5PpHngdHHH8hUWXX4cI/z0odXPYjN0bWRDZ/rCVP2Ug/OjujC5VWR3TqPv/7yWysJaNxhzZRQiOmqJaP2bX42MkUGn0uQM8iPzQ9Q5qMJOSHu2RvewhLsnp4RIbsz2u/kio58opRFux6jGDXMsy5Xi7wwW8+sFr5Urrtt98+KJD6YAFMj0i3RbVPbuI0cwI4ReOnjUVQAIW8LQe0HoLE+uzxy8Z7IntiQt6PRx0UK3R1LTcguplvoCcWEX9IykNI5gFQ5TlnKQYkin40+aNwoQ/QKiEDNFvR+r3h5u31hv+P0afB5Qubu3AHAKWXhfpQmbGns9i6D4PVGgP/XH8NdNo5ol43L7SH0cIRV8WCjvchmNN/ur6Wb5Iil6cNZFF4QqLUQHqNlrpn+KaQejoDcwel6bVAh/jezqeBCRY95u+ghKraguCNX2XUEddv/CriMuMJf5x2sgmbiIOiQu7zwJa/m5LhtvCt5BuFduGEkOUZCnVsic1jGjae8TJK/nFtAdkc/aPpWM4gJR12eh5GLaC61JBx8bdCNMUBQ0wkGO2GCPoPzZNrK8yEbKFHvXLiZIBAtpiL8CE5xybyW8DUOa1Fh6dUs0dtDhrEYgmP06Dp/PinCnb/fo7RQab6byPY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adea02f-478a-46d5-1028-08db40c2dd0b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:43:08.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9Kass2sEkgzOSqmunKs2iZl+cPyZAD9Q3mMj2AMs9DbSewPRSbe6GphSA732jwOQDficbTB+VwDDuF7Ig7XkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4989

On Wed, Apr 19, 2023 at 12:11:09PM +0200, Jan Beulich wrote:
> On 19.04.2023 11:41, Roger Pau Monné wrote:
> > On Tue, Apr 18, 2023 at 05:12:07PM +0100, Andrew Cooper wrote:
> >> On 18/04/2023 5:02 pm, Roger Pau Monné wrote:
> >>> On Tue, Apr 18, 2023 at 04:54:49PM +0100, Andrew Cooper wrote:
> >>>> On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
> >>>>> The addition of the flags field in the vcpu_set_singleshot_timer in
> >>>>> 505ef3ea8687 is an ABI breakage, as the size of the structure is
> >>>>> increased.
> >>>>>
> >>>>> Remove such field addition and drop the implementation of the
> >>>>> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
> >>>>> value just inject the timer interrupt.
> >>>>>
> >>>>> Bump the Xen interface version, and keep the flags field and
> >>>>> VCPU_SSHOTTMR_future available for guests using the old interface.
> >>>>>
> >>>>> Note the removal of the field from the vcpu_set_singleshot_timer
> >>>>> struct allows removing the compat translation of the struct.
> >>>>>
> >>>>> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
> >>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>> While everything said is true, this isn't the reason to to get rid of
> >>>> VCPU_SSHOTTMR_future
> >>>>
> >>>> It 505ef3ea8687 does appear to have been an ABI break, that's
> >>>> incidental.  It dates from 2007 so whatever we have now is the de-facto
> >>>> ABI, whether we like it or not.
> >>>>
> >>>> The reason to delete this is because it is a monumentality and entirely
> >>>> stupid idea which should have been rejected outright at the time, and
> >>>> the only guest we can find which uses it also BUG_ON()'s in response to
> >>>> -ETIME.
> >>> I agree, but didn't think it was necessary to get into debating
> >>> whether it's useful or not, since its introduction was bogus anyway.
> >>
> >> Well - the reason to actually make a change is that (older) guests are
> >> really exploding on that BUG_ON() for reasons outside of their own control.
> >>
> >> And the reason to fix it by ignoring VCPU_SSHOTTMR_future is because the
> >> entire concept is broken and should never have existed.
> >>
> >> The ABI argument just adds to why the patch ought to have been rejected
> >> at the time.  But it was done, and the fact it has been like this for 16
> >> years means that the ABI shouldn't change further, even if it done in
> >> error in the first place.
> >>
> >>>
> >>>> It can literally only be used to shoot yourself in the foot with, and
> >>>> more recent Linuxes have dropped their use of it.
> >>>>
> >>>> The structure needs to stay it's current shape, and while it's fine to
> >>>> hide the VCPU_SSHOTTMR_future behind an interface version macro, we do
> >>>> need to say that it is explicitly ignored.
> >>> Oh, I think I've dropped the comment I had added next to
> >>> VCPU_SSHOTTMR_future that contained /* Ignored. */ (just like for the whole
> >>> flags field).
> >>>
> >>> I can elaborate a bit on why VCPU_SSHOTTMR_future is not useful in the
> >>> commit log, and add that Ignored comment to the flag.
> >>
> >> The important thing is to not actually change the size of the structure,
> >> and to change the commit message to explain the real reason why we need
> >> to make the change.
> > 
> > Why not revert back to the previous (smaller) size of the structure?
> > 
> > That would work for guests that have been built with Xen 3.0 headers.
> 
> Are there any such guests known to still be in active use? Linux iirc
> requires 4.0 as a minimum ...

That would be something from the pre-pvops Linux days.

I looked forward a bit, and I don't think the introduction of the
field was an ABI breakage, because it was done a day after introducing
the original hypercall, so no released version of the hypervisor
headers contained the structure without the flags field:

commit 505ef3ea86870bb8a35533ec9d446f98a6b61ea6
Author: kfraser@localhost.localdomain <kfraser@localhost.localdomain>
Date:   Sat Mar 10 16:58:11 2007 +0000

    Add flags field to VCPUOP_set_singlsehot_timer.
    Flag 'future' causes Xen to check if the timeout is in the past and
    return -ETIME if so.
    From: Jeremy Fitzhardinge <jeremy@goop.org>
    Signed-off-by: Keir Fraser <keir@xensource.com>

commit eb1a565927c0fdcd89be41f6d063c458539cca8d
Author: kfraser@localhost.localdomain <kfraser@localhost.localdomain>
Date:   Fri Mar 9 18:26:47 2007 +0000

    xen: New vcpu_op commands for setting periodic and single-shot timers.
    Signed-off-by: Keir Fraser <keir@xensource.com>

So I think my proposal is to declare the flag as deprecated (and
effectively ignored in the hypervisor) due to the bogus usage of it in
Linux.

Thanks, Roger.

