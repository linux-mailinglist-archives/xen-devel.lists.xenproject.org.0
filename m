Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DFA6B9840
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:46:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509693.785951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5ur-0002nH-Tn; Tue, 14 Mar 2023 14:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509693.785951; Tue, 14 Mar 2023 14:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5ur-0002kt-Qz; Tue, 14 Mar 2023 14:46:17 +0000
Received: by outflank-mailman (input) for mailman id 509693;
 Tue, 14 Mar 2023 14:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXSW=7G=citrix.com=prvs=430734c92=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pc5uq-0002km-OY
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:46:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f74d44d4-c276-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:46:14 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 10:46:07 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6533.namprd03.prod.outlook.com (2603:10b6:a03:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Tue, 14 Mar
 2023 14:46:04 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Tue, 14 Mar 2023
 14:46:04 +0000
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
X-Inumbo-ID: f74d44d4-c276-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678805174;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Fldugdz+tA4Jk2t97s9FkSrjmJzoFdJF5BaKUOgmP9I=;
  b=MzB4xQmDTpB1l8tlRgT7wnyEot/CtaZn25iWZEttHXBK347TXNC+B2WA
   PSUFc9E93EsHkk+/HxdNu4JKOK8+ldJRjN7MsGl/do6Vl0F+pQyeCgs/S
   Avd0kl/diWQpjGOosQhAcu5F5MPMY7oWsExSp+nLBfXz9QKQTiHE1LFCZ
   I=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 100162219
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ggDKZK6K4aX8p/GEHaG3OwxRtPbGchMFZxGqfqrLsTDasY5as4F+v
 mEbDWzXaPyMYTP3fNt+PIuw9xkPu8LUyddmTwtlpSA2Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 dcgIQA9Nku5qLya26ipW6p03s4uI5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+SF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXuiBthITezQGvhCvWCR5jchAwIvBAG8mvO8oVaDWsJ/J
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN0uYdUj0qy6+RXLhmyqr52QFAotvFyIAiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:ykXjEapvwkQ6JkHc7J6AJUQaV5oUeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc7Qx6ZJhOo6HkBEDtewK/yXcx2/hzAV7AZmjbUQmTXeVfBOLZqlWKJ8S9zI5gPM
 xbAs9D4bPLfD5HZAXBjDVQ0exM/DBKys+VbC7loUtQcQ==
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100162219"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYowJDhPg09v7ujnOy9ts86NZeTV2QL79034ZsidL+oPP05/pWz1I+akPe9qrdz+xrpFHv6lV3Ci/kymAiqR19AWcTbIpYzmfeMXdP2kVPznK+/LLS8SWIMOkDqO1MAF23v/KqhSar1Ivx9PlA2DmQz1phHvtloZiGjgHO7RS9Jh2JNGeygfwcXWVtqAl72dXckR8RCZrZHoSxBwk+6z6RcMVgqIHLbzjoJIJeylACaaCA+Eyb8eo+8C40p4z2EISU5oh5K7dJFvk3iItkwYnWpOrmloQ1pkmQiqYKTdX5qeuSXYhzZnjngh+2ptWr7NrBKVbSW/8xTptraXbTl4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ph0kf1lCPA0v2FrHdKIo6TYHCvEsqesDTotqITrfcY=;
 b=gqQVE0s9P7kDJsiH5C9kv/WkiU5azaQ/Q+1yFgZ1MbMulfGVvvcqmI0IDxQjG+0su8i3WPjfD0r96W0Yvaw0up+vjJYFQrcg7eQ0C5ChgUKLpkTgSlGRFRXoXD/t9WA2cdA9CGnECh4lF7Dgq2avSz/vv9odDPEB6tXrQip47LzQcSLdFGk7Mm63wt+v2FdVvfflDhmGIL0qbVGCddNAdpXO/QkQjjX3HTMqN9ULOAw3KDcQlpndaOcxMdE8nWVUB0FYVBDGCzBSlnSjjcOZonf6thiRk+uTvQ3a8BNkZ0E3xRO47s49hIEqwppFKtILOcH/FA41fpU9OjZW4ZlXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ph0kf1lCPA0v2FrHdKIo6TYHCvEsqesDTotqITrfcY=;
 b=vUGul8A0RIaUzwX7KHPRTJ++7VQJy5Iql0DOKoGXz7mt+o0tBctMate9wd/a8m8gpG510c9kjLuyY4jb6dQ1P6j4P3bz65f2C/ia1lzO4VyAa3AZ/G/SKik8HP+FZ8RAuBTPTajkXG8ESwF6J02wXAAvI1sX4esa1RXufsfG86U=
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
Subject: [PATCH v2] xen/grants: repurpose command line max options
Date: Tue, 14 Mar 2023 15:45:53 +0100
Message-Id: <20230314144553.8248-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ff6e49-c9a1-4082-0236-08db249ad64b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TpSVzB8pQVbYV1o2WzDN0qnuNZsTt8mpXtS9RpHBOmcvwNpcV06sWQuI+7a0mqqGxM7xGFdxX8slH4EmZzajibmB+rDrm6gemvZqZLicPtkHok0MW8M7a2Hfv43QAURBMt59PY8nza/A8hDRfdVm6PD2/0iKFtlNvWvi3ZM/+9oBAqdZUbcftri2XqLlN1zQO9TDf64y4BWWFIG8znB+TaJebV14sDzV7qp5SxUGQZfGMYNdQn1lU3m2yugY4qGNWN2GRIMjQ7YrpB4VthpDX05dLJo1shy2IiTFA9QglnfTk8ziS4OY2NejGyRFystyPuNTopJG9s5urFvDTsngeeTp63j/OQbXlF04fNu7yAqw3uCweYOYh8WmBg1vDfZV4wNG0GyvpcGh5c+O9vQ+T18REHGXg1ePn/mkJKulhmxQPA+mo6OJMCzrewvKMFVcBYgTLOaA1LJEur0Q59CgraqavlX+s+rOgf9pdrfSBPAUNyeTvxSKQPH/IO9b0TbbrrweQnOsLZkajBUT8rD/vXhq3JmipBN43ky/X0NkpmzPACdYzFVCXCl9uj8geRsYq63T1AAHR0F9wgTuArzf23WM64qBO6ZdPvXKQfILUe1elXHW+QFasibvmkRTSnyRI3sDIfaXCSvH1irr2jf/eg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199018)(41300700001)(8936002)(6916009)(478600001)(66476007)(66946007)(4326008)(8676002)(54906003)(66556008)(36756003)(86362001)(38100700002)(82960400001)(26005)(6506007)(6666004)(186003)(6486002)(1076003)(5660300002)(2906002)(6512007)(316002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVBpbURaRDdlcmxSQnZnck5tZzRwMXgyelQxK0RXVXI1US94eEJxcXg1bVNo?=
 =?utf-8?B?TXlDbmRjU09IcXowTmR6amFXb0xmUUhXRllCcS9KRFdGSjNTaFlSaUkzOFo5?=
 =?utf-8?B?bGRtMWRGS1ZJODVzUUNGQ3FMUmNXN0ZoaWc1TWpwL3orZDhVczhpWnE5ZXRZ?=
 =?utf-8?B?Qkt5MkYyTGRWbFJnYVBuTDFjUGFpQTRIUlhRRkVNbFFhNFJkOXdWNHNjemI4?=
 =?utf-8?B?ZDlyTGtpamRaOUZRek1VZW5pMldxVzgzK1l5UW5oWUUxaVl6eTF2eE83SVBi?=
 =?utf-8?B?ZStiSWRoZmpGbElQOWNTNytMVk0xUGhnalcxWEw1Wjc4MldhcE90M2JUcW9o?=
 =?utf-8?B?U0xNSENWZkRNVVYzQlVXaERTZm5rRzVqalU4U2NrQXdiRENkbTY3M0craU93?=
 =?utf-8?B?a09DZXVxSjAwTS9DSWRuK2xZWVNpSUNocVVRTVA0NU50dFZBMkVWY1dGd0Rh?=
 =?utf-8?B?NFowTHZMdUJKYUdsaGtnYTRrTWpUNlhTM2REVWFidVZia3hhNjFOWjBKKzJS?=
 =?utf-8?B?bzFaSUJsNEZudlZrbUJUdFpIK0RUQ2REbTAwNUxWUFBUcXlzRGl5ZlBRZm5v?=
 =?utf-8?B?TkNLWkZSTGxoRERzVFdadGZyanU4Y0xlcmphU3YvZFBNbFR5NDRRKzdycnAr?=
 =?utf-8?B?Rk5ldzMyeFdWclNjMW9Ka3hzNDhjSk5tcFdDOHhkTW9XSldiajJ2aFNUZ0Na?=
 =?utf-8?B?bHhIdlNjSit4M2xaMWJNK0ZKMEtWcGhtMUpKaDFqamt2U0srck9iQ0FVSi9X?=
 =?utf-8?B?L3gxQ2NwbHl4WmhlanhtWCs3d01SU2liR0NXQ3B3aC9rNFAyd2RabGMvcWVN?=
 =?utf-8?B?WElPdy9tLzRFZnZzd0k4L1hackp0NThZTWJMaUhkQ21jMDdacHdTWEpvTVpm?=
 =?utf-8?B?L0wzVTRJNkp2dG9aRHVmQW1WK2RRekJBTkVjMVVSMnE5WUhoajR4c1ZKaXBE?=
 =?utf-8?B?MWJIRjc1UTRmVS82ZTFTclpaa0drTTVxV280SEZIWndOY21qeW5IOFBVdUhy?=
 =?utf-8?B?a01rdkVHSk1HNExTWW05ajhza2E0aEpVMzFQeEw5bmY5WXdVMkQzRXNPUjN3?=
 =?utf-8?B?dVNzM1pXcVgwRDN5dDNqa1E2THA3NmxQcjNQMnlLdnZHbTd4ZUNYSktHeG9v?=
 =?utf-8?B?NHlWNnBZMHh1b1VscUVSYVZPd2JBR0x3dXpLTGp3ZFYwK3Q3Y2xXOEo3dm5r?=
 =?utf-8?B?SVZEQitQZlplQ2tWUkhNTER6K0YrZTA3OGFHQ2hncXVUZ2M4TWdzNFBKSkZl?=
 =?utf-8?B?WjBXSVdGNDdTQVhEL2JCY29LaENaLzVseUhjU292V3U3UGVnNVBMQms4bnRq?=
 =?utf-8?B?TlJkWnpoYTM0ZzVOV1pkTTg4U2hEaTdCeDZEdVhmZHZ6bnFHT2tXZjN4Q0lW?=
 =?utf-8?B?ZGFQSzhOdjd4N3EvdVg1Sk85ME4wYU02RFMxQVNrUzJWTUdURjlCYU1aOGpM?=
 =?utf-8?B?OGdvKzdmTUEwc0owTE45OXFxazNkUWs5MExhQUhZczBqZ0pBRnd6UGFncXpS?=
 =?utf-8?B?UlJ5RnRHOVM0aU5wRjFhWkxZcDcvb2hDekpjZUdid3NJaDF0YVMwTm8zeEhX?=
 =?utf-8?B?STJJeUh2YXR5cUV4eFA5a1A2NDV2UFprdzlTb0twUzRsV0Y4UGptUlR6Q2JQ?=
 =?utf-8?B?cmxJZzFXSmNmNnNPRWpDRlhlbDU3WlYvbVZzWFd3U2NTb3ozR0FqbHJsaDNT?=
 =?utf-8?B?STBpekx6K1FUeHVIb0VTYkVjUGR0OGtaTTd0VFdZZmlnYUFQcXdDNlVhZmc5?=
 =?utf-8?B?eG94cG1BZHdwWFE2OUIzZ1cyWkxNZjlINkh3UG1lTDRaeFovLzY3dDB1Nlo1?=
 =?utf-8?B?TEhINmhPLzBpMlVQWHpGQlZUSyt1WUR5UlNxNHBwaFl5Z1ZESSt3emxSNlJu?=
 =?utf-8?B?MU9DSCtJc3dDRW92RGhuS0tmNlpWLzd5UzVLV2g0L1hqWUhOMkl6Zlh3R1RF?=
 =?utf-8?B?OTd5dWxNZkRpYUxhdVQvT3kydGVxb3RpRXZ2N1ZFRGRzTndxdHlnaUQ4YjNp?=
 =?utf-8?B?SlpRZ3pSZkZDYTN1UWd6VGF4SFVCNEtxWVM1WTdYNm1uRXpnZVpXTnRLNWdi?=
 =?utf-8?B?ajFad0g2VHZoUVJxa0NnZ2s4aWx4QkNnVlNFc1BLaFB6MG9vWlNTZk5DQ3ly?=
 =?utf-8?B?eUdManhiRFFmNncwcUllKzl0RTdtcUdPc1ZYRy85bEF3VlR5L005NGU0YmpV?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bkGAqK7nNOBqvw/G+1FViOwbi7rdCAaJBJhl4kX//kYGO39ryw7R6lgH21u2ZpnJV2+UxlKvR8GzmRcQoSCrB48XvVfoItP86AxcBzA7p1N99ecs3pp8TuBA0IUdG42ijSobSZnHUO1gKuuisG+5unKbZXc8MaXkPm4OmJEO4Ow3x/RDvBog1qi/A9oEL9tt7IgW2XQodG9A5QIkxp8QS3eLsamGRM/0k6vAoCwMhSwIbY1CGqmEzSphnFFUZDHColEd0jnMEGayCK2gbXi6O7vj7zzs+2XRPr7nIaPXkm/sfWSgnyc1rwAkWy2hnKW5zqOj78hCIYsbX4dwlCqVEn0OhUEfNo3MK19uo+S3DsHcKwvEP1pYEdrhzDUU7Bv92TEA0CzCD7/Qo3ZRLiWqmlXtO7zOhDXv8F1RMwHK+/plOdoWltX9j8zNTdiSe9UCaZt78D3Pc4Gyi6Yr3+0wpSEPjHPi4YjvUZyOCjYbWtANHq7tVb5A2huaeLLHO8DaZyoJi7exzkOgJ8hGdkzOcIap1iNpp6TKlxahdVOfHv8qMBWRKFWBJAqsJHJnPqLSQWjtvTbIUWV9X2zcS3pWEoZ38T/wtUggbN+dnkQu86YVQ8oees/M93i7F9kOa31DexmBIKujnnCNSASlgUbvwWPfd6JCYT9rZZO6wTGXsPH7wD3PeIt28TE3u1mQhSivfbijWK+/Q+N6+sH4hCCp+PikmxBx7jA4NxKVWiDEAjtel6V7hlSv0rzbURhq+wE+VMGx+cnIzD1+DPH8AuASok78Ahap8dvPmujnKsjeb4aQmTh1romizn9jRnRPH+rChOyrKFaPHZWKPGmN51Zpy0aRc4nS28k2K2LUis1Ymdc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ff6e49-c9a1-4082-0236-08db249ad64b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 14:46:04.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/PlN7O77WHvPTvZUWqBu8zIXtZtuVSWMjElxXuUpoSkPtL4MXNFMWIMyXLHwLnRLm4MX6+9kLfLqmsiI2K66Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6533

Slightly change the meaning of the command line
gnttab_max_{maptrack_,}frames: do not use them as upper bounds for the
passed values at domain creation, instead just use them as defaults
in the absence of any provided value.

It's not very useful for the options to be used both as defaults and
as capping values for domain creation inputs.  The defaults passed on
the command line are used by dom0 which has a very different grant
requirements than a regular domU.  dom0 usually needs a bigger
maptrack array, while domU usually require a bigger number of grant
frames.

The relaxation in the logic for the maximum size of the grant and
maptrack table sizes doesn't change the fact that domain creation
hypercall can cause resource exhausting, so disaggregated setups
should take it into account.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Expand commit message about disaggregated setups implication.
 - Reword documentation in xen-command-line for the affected options.
---
 docs/misc/xen-command-line.pandoc | 16 +++++++++-------
 xen/common/grant_table.c          |  9 +++------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f68deaa6a9..e0b89b7d33 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1232,11 +1232,11 @@ The usage of gnttab v2 is not security supported on ARM platforms.
 
 > Can be modified at runtime
 
-Specify the maximum number of frames which any domain may use as part
-of its grant table. This value is an upper boundary of the per-domain
-value settable via Xen tools.
+Specify the default upper bound on the number of frames which any domain may
+use as part of its grant table unless a different value is specified at domain
+creation.
 
-Dom0 is using this value for sizing its grant table.
+Note this value is the effective upper bound for dom0.
 
 ### gnttab_max_maptrack_frames
 > `= <integer>`
@@ -1245,9 +1245,11 @@ Dom0 is using this value for sizing its grant table.
 
 > Can be modified at runtime
 
-Specify the maximum number of frames to use as part of a domains
-maptrack array. This value is an upper boundary of the per-domain
-value settable via Xen tools.
+Specify the default upper bound on the number of frames which any domain may
+use as part of its maptrack array unless a different value is specified at
+domain creation.
+
+Note this value is the effective upper bound for dom0.
 
 ### global-pages
     = <boolean>
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index b896f9af0e..627bf4026c 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1956,18 +1956,15 @@ int grant_table_init(struct domain *d, int max_grant_frames,
         return -EINVAL;
     }
 
-    /* Default to maximum value if no value was specified */
+    /* Apply defaults if no value was specified */
     if ( max_grant_frames < 0 )
         max_grant_frames = opt_max_grant_frames;
     if ( max_maptrack_frames < 0 )
         max_maptrack_frames = opt_max_maptrack_frames;
 
-    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES ||
-         max_grant_frames > opt_max_grant_frames ||
-         max_maptrack_frames > opt_max_maptrack_frames )
+    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES )
     {
-        dprintk(XENLOG_INFO, "Bad grant table sizes: grant %u, maptrack %u\n",
-                max_grant_frames, max_maptrack_frames);
+        dprintk(XENLOG_INFO, "Bad grant table size %u\n", max_grant_frames);
         return -EINVAL;
     }
 
-- 
2.39.0


