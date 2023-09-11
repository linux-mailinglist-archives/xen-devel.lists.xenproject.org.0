Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9A79A6F7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 11:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599209.934516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdXP-00037O-5p; Mon, 11 Sep 2023 09:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599209.934516; Mon, 11 Sep 2023 09:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdXP-000352-35; Mon, 11 Sep 2023 09:48:59 +0000
Received: by outflank-mailman (input) for mailman id 599209;
 Mon, 11 Sep 2023 09:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwba=E3=citrix.com=prvs=6119d0f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qfdXN-00034w-Uj
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:48:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b266496-5088-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 11:48:56 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2023 05:48:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6929.namprd03.prod.outlook.com (2603:10b6:303:1c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 09:48:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 09:48:42 +0000
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
X-Inumbo-ID: 6b266496-5088-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694425736;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kKhN96lExVErb2BpFiOgGjhJ2571Gd8roofWV8Rs25Y=;
  b=SSoJOeGwBjkBUhvMvWd7AKNuZEZVCrY4TTmmq4FcjTJDhsFuHeb/RnZM
   SSYI0h3YUkMWr4N5x/ZZMRO2ern1LXokXE9RBDXebRmky8eMJsWMVI8/v
   2Xnp7jUUv385D/B2T+6QkYVtKF/Ni6G84t1vL06oY6OXFO3E5B5aYW0qY
   U=;
X-CSE-ConnectionGUID: BUh22HNqRGGUddDEGsbflQ==
X-CSE-MsgGUID: EhQYV6B8S+WuAvSYHgCKBA==
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 122659801
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:0uOjD6wTLr676uUwoJl6t+faxyrEfRIJ4+MujC+fZmUNrF6WrkUEz
 GBJW2iGO63bNmP2fdB2PNu39RsBuMOBzdNnHgM+qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRvPKgT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUtz9
 aZCCBYUVD+suu667J+UUeNigv12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQruFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAthMSezorqcCbFu762wqOSNIfwuA4sako1CFavJQA
 G8+0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L84Q+HBy4BQyRAbtsOv8sxWDBs3
 ViM9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LD6qdntDzXzbqz
 FiivCU4wrkek8MP/6G65kzcxSKhoIDTSQw47RmRWXiqhj6Vf6agbo2srFTes/BJKd/BSkHb5
 SBe3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxezO
 yc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:Mfr54an+r4Ea3ZJgBXcUjg/mGZLpDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-Talos-CUID: =?us-ascii?q?9a23=3Am+6sNmjVtarw5zN7NnQ1+amqrDJuWEDdli3wBVa?=
 =?us-ascii?q?CJklURLG5ZHCL8q1gqp87?=
X-Talos-MUID: 9a23:DpTuCAphE697/IUTP1wezxxiDfZWvY7+MwMyjLwYgPikOgdTER7I2Q==
X-IronPort-AV: E=Sophos;i="6.02,243,1688443200"; 
   d="scan'208";a="122659801"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQJtaOPTrYHJHip4uNSnSbWtmqoys624PqBoykKECkWV/ufX2O0RLX+2N/awjWA5lO3BCt99jdxzlhAJLc6zcP2ASQwvLx7dfqa19kj1yHEnGBZn+BiXb7fUii8mXblaadj6v1S/5zG7hRdLpxFYHlrfKIJ76JDEcHgbJWvYTdL0bXFx8uzFsna2K5urUza0FWXhmu2CWUvhk4VvOF1DvqZbZ0LcEFYWnBwJJwZbv2ORpOTE12HrHPpcOXr8kqhdUSTSqTtBdT/4huoq0yWdmDvNFfPiBrjvgQz14DayelY/PBRZ91NduBkcZKJjiGsyc0mEcQ188I2lSgPf3/BP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4z010ckneWoQ/A6gRHVXyG5/QDC6JofM0AtgN0BeO0=;
 b=FkvasmuDCf1Z/DOnyis6gdNVNDOTn3Bcm9wO+HPHRGIs3/HaN2+vnIKyRKETw8z66tflSkoIu5RFS420m7sTu9NWzPnZE0STVrA/r7NSIYtGzYSliCGYiLE2IYLmnhi9fiG8Lg0U3n1vYYmiRxOVUAdZBa8tibP8qkA1NQBQ6RyMHfYqF7h/w6KfIMB+ZWf2LAofQT7G5+VPK7cZefeni71ZDg9ANc/fI6cJsx0vmNrhMGT70OMitN/uJRZWP71jZJqAEtsyJmHmc1NANAzaeTt5/Lu+4aM9sH9fQE4CvlxpxIF7kZ8LG6h7QhDLrVjFgjVnl7mVVOwxznlxxfbi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4z010ckneWoQ/A6gRHVXyG5/QDC6JofM0AtgN0BeO0=;
 b=ZGiOXh9FuXiaDoKGgkF8dKeaXGP1C1qC9LyFJYgb9YZTwYQa8MmmELxvUEuTu5/YT4b8VNKHbOTGTMRFaPKVVAkd0prl73h/tByjIPifYHLIGKqF0UdQcj8ERS/4dCPVwhpanhhUSA8VHMwJNV3ZizPHR+U7VEepEkUJHVKjR18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4073db4a-0ccd-7047-4d34-25ad18100f12@citrix.com>
Date: Mon, 11 Sep 2023 10:48:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 1/2] coverage: simplify the logic of choosing the
 number of gcov counters depending on the gcc version
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Javi Merino <javi.merino@cloud.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694189143.git.javi.merino@cloud.com>
 <f40f16bad7553f63d81574eac39e1fddaeec0be4.1694189143.git.javi.merino@cloud.com>
 <93c7ff14-2aa8-09a6-f04d-9dbb3969f470@suse.com>
In-Reply-To: <93c7ff14-2aa8-09a6-f04d-9dbb3969f470@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0485.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 9911a567-cfcf-4c4f-173a-08dbb2ac47b6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xCXFQ6fONcjZ2SLLss4Xq2I8lTS4owKPlTIF2n8qAmVKglGqf299urU+zc5piI7ZWCFFQpj2IEOsnPvPaDylw+z6ZX54eHW2+dSrhdctto14fcwggV01QmDmzlDEutAOYZBqbDcc8sXH27N1JFHpq9yF+MFEPHjNpM2U59myKhmPJlw9D4Z3piyCKGDtd/ID+BvkjniMquXXJoSq1xVYNVu3/0CerkemtRUG4t9VQlByjXGRGuOHA6xg8h/i8DB1q5kMDyW62mC2D71A6TyUDIfjDKQ6OOEnL0nrV6OX2UlW43w6Mo4Gl7m2Nf1c43NKHXrhjRJYUE9ZYzXKU1xgHz9iqrQyARQRo1mqPAXbaa/CQs6E5Iu6J25oimkQO2kJMkoJ/GSpfOiKyNPsRpJJZTGq1WY2wi9Z6OuNzu+/CWfbLfufqjLLkCd/2ZfsnK2Y4ivgxZWFpnhg2KTjYa+XX1Ge6KRzMCCk4QIju+zlIfjJmMCA6gMwi89mlJR1Zv635zlEsyFmXC9E+RAd46efhQedyeZDS2SZwpeDtCqThqNZvwVRwmYswRZW9zBohgimDkYcMAvN5FUsT6WqG1Sqbdce8OXYx4Wk8yRhfHyH0mvQVmfHwKMJCyQ9hcCOE8t/H8amzpkKRrMKoeCY5T1/Gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(186009)(1800799009)(451199024)(41300700001)(31686004)(6666004)(53546011)(6506007)(6486002)(86362001)(36756003)(31696002)(38100700002)(82960400001)(26005)(2616005)(2906002)(6512007)(83380400001)(478600001)(110136005)(316002)(8936002)(8676002)(5660300002)(4326008)(66946007)(66556008)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy9VRHVnOVNiS09LbHRmUzB6Zk5yN1lyeVBSa2pFL3kvR2tlU0tpU1NHMTll?=
 =?utf-8?B?QzVPZVM0OUY5NVdsK3N5WERhRW5BZlVIQ3NybGRxREl1bW1uZlZCNVVpTnZU?=
 =?utf-8?B?NUU2Um12UWJvdkVDdXFuV2EyKytrSDh3dUNCZU5ER2hHQmJzSHhiYzYwbUFq?=
 =?utf-8?B?RUttMzJzSHBjK2NKOTNZZ2hTYWRrRkZTSFljUlpDeERudERWWHFXMG14Y25k?=
 =?utf-8?B?SEhxT1NqN1o2NW1DUlZwZGVSY09XeitrMzAwMjU4V0EzZlEvUktnNWJuT0pP?=
 =?utf-8?B?UVlXcUJvYno2OWZVQUdSZEkzNFc3WGdkZDZxamNPVFlwOHlYSnNyQ1JvRlZ4?=
 =?utf-8?B?ZXcyVkswZnpGb2FjSEFWbml2eXdrTUFPRFVPNFFrM2dnbmJtZnVnZ2dpTENw?=
 =?utf-8?B?cGFwZ01jWkNrM28wZ3ZGczZZQnNjb2VKVTVLN3ptNkNQa0x5SDZZNllVampo?=
 =?utf-8?B?Z1lpcTY0Y2lFL0FLVGVRN1Rlb1AzOWZMTVRmc3MvSjdFTERJSml3N3pFMUk2?=
 =?utf-8?B?SHBrWStwTXpSYTZBamdxakJFYStBTU1jZ1g3T0pLdjJMVmR2YnNQMFB0QUUr?=
 =?utf-8?B?bEltbGNaM1VFWEVpT0h5QUJiRytkNG5PWWsxYm9oMGVkWFRTdDhqTm9mWDlV?=
 =?utf-8?B?L052cTZWa1lsRG52RG01bzMwY1AyRCtKRG54WTVvYnBubmNLZU5uZE5yK2w0?=
 =?utf-8?B?UmdKN29JZk5PYXdoMVJZVUJTdG9EdXVCOGwyamhPZmREOUdUbWszcWk1WVR0?=
 =?utf-8?B?VEJPOCtBTEZiZ21EUHlDU3ZRYmJ3WDZEM2prYkVSQWNIblZrYTJ0V2hIejdX?=
 =?utf-8?B?OWtwUWtEdFNTbVpWbXlwU1lXdEkva2JHSnpYZVYxWk1NdUk5cjhzZXovWTkr?=
 =?utf-8?B?L3pUOE5rM3JqRUNyckVzUy9QblptN25rOWhpMnFtbFB2YkU0UGhMM2JZbWZM?=
 =?utf-8?B?K09nOHNjblJGN3hiTTIwb3V6ZnlkeG1kYjJ1YWRRWk5uTVlrTnNBL1NmVU9K?=
 =?utf-8?B?cFUwbFFPNXRCZk9FWGluNEt3dkdxckRqS1hDdVN0c1c5M2g3cmlVOW00Smg0?=
 =?utf-8?B?ajBydExwM2xHZUVZVG90Yi9qZEVtWTd0d0hPdytyRE4vOTlib2NHMFZBYmhl?=
 =?utf-8?B?UnFBak5CK09XOFVZSXFHczg0NGdSUlYwbUNXZEYvZFFQa1hVc29yTzZrZUVm?=
 =?utf-8?B?YkhucE9MZ3FubGZEdXFQVWdOekNNQ0FiRytyY0ZVNVdSNEhjSTdGNjFMaDUx?=
 =?utf-8?B?WUVsVzNJYnM1RWMzZmpXRlg3U2NVa2w1WXYzNlM1QW0xd0tCM21jN2JTZlN1?=
 =?utf-8?B?djRhdkNhUUdFdEI5RW93V09WYmtjVU94T2RhOXZwanQrd2UvcS9HQVBxUXFF?=
 =?utf-8?B?Z0p4Y0FMaHFDaC81VTVOakJXa2hQRHFSbkVHK2lhd2xpU0RnUEdaYzc0eGxW?=
 =?utf-8?B?ODJ1NzUxVnJYdnJUQmk1dTc3MTQwaTBRU0lSMDFzV1ROOUFRaHBnckpTeUtG?=
 =?utf-8?B?Q1QvMm01ai9uT3J5UzJ6WTFUaTBPT2x5K2RvaXJLdFliVCsxRDBSZTJ2ZHhu?=
 =?utf-8?B?RE8wTmtPSUg1MzYvcHR4OHlYSlN3SzdkbklnMkdack9vMGlkQzZqY0pFWHlQ?=
 =?utf-8?B?RGg3amk3b2RvYmtTRk4zeEVQcXpoQ3BEdU12SU9XdkxFcUJjT2tFWkJ0cU8y?=
 =?utf-8?B?MHVOWjhyTXFoVkMzcDNUUjBQQ0hJSjQxdHViNk5lVFlCMittVk9paVF3Yk05?=
 =?utf-8?B?aFUwTUc1NlFDUEhtUk4wbFRmeEZ4RXcxYW4wV1pHb1UrOVl5Tm42a2pSQm1L?=
 =?utf-8?B?NDBGODFjb0ttWjJ6RG5wcmNYby9qMzF3K3hwc1hEZitUMWw5V0g5UGdXZUg3?=
 =?utf-8?B?dDRCQXB6Y3d4ZjhiU3JnckNnOHo3UHRRUDZiUzY3eGFSOUM0SStMejJ3Y1RL?=
 =?utf-8?B?TVdncmdFT3hSTTY1Yll4OEJkbkRDYm16ZjlrSWI5RWhNVVVORDBmRlpsVWJn?=
 =?utf-8?B?Rm91U1pWeUFGRUVNdis1cjY0MVpSVHVGQUlSZmhQNllTNTRhSTN3cnpqZ1Y1?=
 =?utf-8?B?c3VjWEFOcTU5UmYrSFZMMGNLWXR0d1BadUs1TDdoOGtNWGl4YStPRndjMHVN?=
 =?utf-8?B?akRlYzNkWERXdm9HdTQ2UFc0cklsVlJyazdnUkpSeHVSTUo5NXZnS1NETVVT?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p2HORQsrvp4BByCs5Ssblp8j5ASwS/BxXJu7jXLi51QAP7qyQy6kqeMGBOzBZpjOILL+IqJyFDHeFlikS7N+xgBQnD+0EsXqy/PsHXLiVC2WhjV9VoywGmlSJ0qBpHIUMe+tgdJXQPmUUDZ56f/6G5Ewa99Vt4ERy5BkoSDJXj7IWxKr3gcg9rX8YnyRKLStjbjv+kog4Lu5UNFn8quYkNuBq7HHm9D1QdqGeg8USfeexZ+H0k2VgLrrXopLN0VaThJtzy2IiAi+IPrqj2R+pP8DCMRMHjF4uGBpmzVaQauwNU9C8ZJZAUcgi2TlijXbZYzF9QBiGs2LcdGJfTHYKxPfBJrqUiEwtXqBfaRBvg+uz8ZD/u/5W5o6d7gsw0jxse33Y4E6HRZo4JI/2lxWPtlp3kyU7COfsp+G4UnZPuHT1HlYYy/CbSkNMvmsVOUZ57GniMUrAJ7Au8PoS8qW5svbu2zqvdBut5MhODyYdbhU0DE6j/fSeP/PrH776r/M+Xy/hL0Ds5jL2SKDwVgXTvMAwidd7ZAVK5K+8Gyl9APzEuqu4bn9E4z7mJUQY+BYcX73x75On1G4NyvxW2H0CdarwEMW8DGFVei6KnEUs9c2Yv+8AxINaq3NFhPjFlD+U43/Lg984bQXE0qAnED/XS4xwkX2W+VM3N/1Qz1qEBVTE3BKJ5YH3ayCIdBmLhF0CVPEOckblWk8UJkjL7mbHhA/CDnsRQetTtNI4RIZwFAy0AqKkp6GSv6AeOiZS6mBny1PiGKrAxBJxgorpIjENIdfLU5KTWa2sB7v3C0c3xaamCuphyHj5ojjJWmUoHzQHkLPd5Dts9NPWpXnUvBBXFf7+yQAk4k8wbZKHHPXekn9UJ7yFXyZ64cRoSTK6cmf
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9911a567-cfcf-4c4f-173a-08dbb2ac47b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:48:41.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YC6DqNhSwOhYGbXB31mZ93QVvgUGYePUCY70jYXI6+P/ksJUMslU9lHGNYxRMRzSPw0hQYY4ANZCymD/4aNnTa3wkjGRVk3qoBYpbt9pIRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6929

On 11/09/2023 8:54 am, Jan Beulich wrote:
> On 08.09.2023 18:20, Javi Merino wrote:
>> The current structure of choosing the correct file based on the
>> compiler version makes us make 33 line files just to define a
>> constant.  The changes after gcc 4.7 are minimal, just the number of
>> counters.
>>
>> Fold the changes in gcc_4_9.c, gcc_5.c and gcc_7.c into gcc_4_7.c to
>> remove a lot of the boilerplate and keep the logic of choosing the
>> GCOV_COUNTER in gcc_4_7.c.
>>
>> Signed-off-by: Javi Merino <javi.merino@cloud.com>
>> ---
>>  xen/common/coverage/Makefile  |  6 +-----
>>  xen/common/coverage/gcc_4_7.c | 17 +++++++++--------
>>  xen/common/coverage/gcc_4_9.c | 33 ---------------------------------
>>  xen/common/coverage/gcc_5.c   | 33 ---------------------------------
>>  xen/common/coverage/gcc_7.c   | 30 ------------------------------
>>  5 files changed, 10 insertions(+), 109 deletions(-)
>>  delete mode 100644 xen/common/coverage/gcc_4_9.c
>>  delete mode 100644 xen/common/coverage/gcc_5.c
>>  delete mode 100644 xen/common/coverage/gcc_7.c
>>
>> diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
>> index 63f98c71d6..d729afc9c7 100644
>> --- a/xen/common/coverage/Makefile
>> +++ b/xen/common/coverage/Makefile
>> @@ -1,11 +1,7 @@
>>  obj-y += coverage.o
>>  ifneq ($(CONFIG_CC_IS_CLANG),y)
>>  obj-y += gcov_base.o gcov.o
>> -obj-y += $(call cc-ifversion,-lt,0407, \
>> -		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
>> -		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
>> -		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
>> -		gcc_5.o, gcc_7.o))))
>> +obj-y += $(call cc-ifversion,-lt,0407, gcc_3_4.o, gcc_4_7.o)
>>  else
>>  obj-y += llvm.o
>>  endif
>> diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
>> index 25b4a8bcdc..ddbc9f4bb0 100644
>> --- a/xen/common/coverage/gcc_4_7.c
>> +++ b/xen/common/coverage/gcc_4_7.c
>> @@ -18,15 +18,16 @@
>>  
>>  #include "gcov.h"
>>  
>> -/*
>> - * GCOV_COUNTERS will be defined if this file is included by other
>> - * source files.
>> - */
>> -#ifndef GCOV_COUNTERS
>> -# if !(GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>> -#  error "Wrong version of GCC used to compile gcov"
>> -# endif
>> +#if (GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>>  #define GCOV_COUNTERS 8
>> +#elif (GCC_VERSION >= 40900 && GCC_VERSION < 50000)
>> +#define GCOV_COUNTERS 9
>> +#elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
>> +#define GCOV_COUNTERS 10
>> +#elif GCC_VERSION >= 70000
>> +#define GCOV_COUNTERS 9
>> +#else
>> +#error "Wrong version of GCC used to compile gcov"
>>  #endif
> How about inverse order:
>
> #if GCC_VERSION >= 70000
> #define GCOV_COUNTERS 9
> #elif GCC_VERSION >= 50000
> #define GCOV_COUNTERS 10
> #elif GCC_VERSION >= 40900
> #define GCOV_COUNTERS 9
> #elif GCC_VERSION >= 40700
> #define GCOV_COUNTERS 8
> #else
> #error "Wrong version of GCC used to compile gcov"
> #endif

Forward order is the one that results in a smaller diff when inserting
new entries.

More importantly, it's the more natural way to structure such a list.

~Andrew

