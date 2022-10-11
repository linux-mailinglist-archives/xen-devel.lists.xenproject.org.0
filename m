Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A302A5FB7E5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 18:04:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420397.665228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHk3-0000oo-H3; Tue, 11 Oct 2022 16:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420397.665228; Tue, 11 Oct 2022 16:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHk3-0000im-CG; Tue, 11 Oct 2022 16:04:27 +0000
Received: by outflank-mailman (input) for mailman id 420397;
 Tue, 11 Oct 2022 16:04:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHIK=2M=citrix.com=prvs=2762267ab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiHk2-0000XF-9u
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 16:04:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ec56c10-497e-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 18:04:24 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 12:04:15 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 11 Oct
 2022 16:04:12 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 16:04:12 +0000
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
X-Inumbo-ID: 5ec56c10-497e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665504265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=dGqvoHEhrk9uigp6ebhzbUXR8uqFN8JqnXryVWBtyfM=;
  b=Wax/K7jYJN5nNBRUV9/L5dcduegXgmtHAVw3CJ1daoIIpnIlgK+BxLcA
   ZhttLtRblFZ+fXnOAk6RzhNwm2M4I+tuLbi6TqGrvET/3E1d8SGj7ZOGa
   qDBpvxUdNYF+gtYDh2ThyY7aV7haJvsKe+z6h/fpeE7pqR5P7ctG6t1iZ
   o=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 82497052
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A7MPMSKvJ6HapvVm7EUP75dsNn+fnOphVZkK7n?=
 =?us-ascii?q?cifNrXfiXmJ3RbKv53rLJtujFZ2djzeF6albpmDQlW6GbJGpuSZ81+gdvYUU?=
 =?us-ascii?q?cCbsp2Rci4ADJQz5KxWHqycTEAhj6Qu1YD2XPEqi4EHTiggwQoAnDHA8389W?=
 =?us-ascii?q?shYBmgwtZR8SZnqDVkaKxyZFD8SDormiG1OYSxZFBVuFjkN0Z2UKGdtCmepj?=
 =?us-ascii?q?5MgmeKyPrCPpadJJ5zy6XpBDB6FTXykKqRrEfssoWexd/PkyzlqnTB6yY8ac?=
 =?us-ascii?q?MjuxjAXDU8H0e9vbbpapJLTM6dUYX5kZlV5ajwNuqaiOycm+75YBLBWs2p0H?=
 =?us-ascii?q?8GOHYyGKcTXRaQv7qm1LQZTqFT7zl2cDR1DxcD6wqVK80G8RUxOVm8L04K9/?=
 =?us-ascii?q?pwD82HdBdz9eet21AjQ7cGsflkSsTNMEM1ojNvRRy8fegFTn7GsZazsOFxWY?=
 =?us-ascii?q?vMZ2PqiPgL4692dxOt7Ewgl20yo7KYVEPL7SCt9tdqUHCYmlWd0aiIfgCUl1?=
 =?us-ascii?q?U0a5ihjSihSWYj3JGTUWAulhccE/Z7a1A5M92Tc8dw6sKLqMRXZgVRby2vyD?=
 =?us-ascii?q?W1ZqLZz7MZs+BPbi+BXNxJ485vKShaoqHpj4ZheC6tNQTBlmi9HNXlCpOjVZ?=
 =?us-ascii?q?gywU06UEiPgYN0ez5oHPKk4V9gLVgcxXsnIySf+gDj28T4RzBrU6TdvcrKiC?=
 =?us-ascii?q?jmHSacT30jwmPv9zuSTZ3NgN5X9WuSM56vo5dSKk+vLYvpRtcr2/7Rn85FcW?=
 =?us-ascii?q?Ed7xHvYCfcUPcwkmUjyXXVNb6Vh8fQ07OILSQe9kalcHmuLsXWVGTrCHywlS?=
 =?us-ascii?q?oVjjrt+DatQANJFJcmgd3O9waIwuCIpfKVcSbaEI+jor36eQ22LcJR0HFNJP?=
 =?us-ascii?q?qipvmukOcfChETgR5SF6FE7BU+XJVgeL2pT87Rro48YSIJGY4nHrq4z+Drx/?=
 =?us-ascii?q?ZzPN2FMmGfmO+1maG4evJsCGUgQBnWB+9fXzBEpeMeyiWSYPOvfnDzNZPD6w?=
 =?us-ascii?q?sUaqUv0R7Et+/aJCzhcEZS5M+l8y9HtYqMyVwWccV5wTwz6MsQC7h924xoqs?=
 =?us-ascii?q?nBafjiLyTiVzcl9Z19LmTgXajZcp3PXPiyMcoeSCJaafJZiYicXz64sJ8Tjk?=
 =?us-ascii?q?QddRgrPqYkZ8yyBM+iLtgCtDuSZgVKLWkC0s1FI35KWri0fM8Dv77XUz1wI2?=
 =?us-ascii?q?kFKRisFlz2ywhswL0LZrcmYUVLfj92w2wnch8V/vhn9B4CoUamOpDOWHvMy2?=
 =?us-ascii?q?Zj3s12VCmz2SEddw9RRALjU4aNQO4jgFlhgVrGvFwHJQPE0bDfdRqVIqxda3?=
 =?us-ascii?q?3Y0soOdadXq1xvUWp4GbEEkaDWfLqovfcdmq9lOIPvv5jEmhsJNrQ9ZutLd8?=
 =?us-ascii?q?p/h044rWebcOVODUPkSemQXzYrKv+apWcvautoulH0jCLlpFXA8SJtDd2Aff?=
 =?us-ascii?q?/DlmrVS6slLARFtDB32YExN05VtB5iOdfD1hUSKEZWUf+JO1dYgOqawWyujX?=
 =?us-ascii?q?6DftFN5Q4JFnaAcMqWBvEl4GVoZlkWGiDWCwLpfMH74RdpDeCCujwEyGVbAc?=
 =?us-ascii?q?MFgCckfgnC5iEQQ8QerUEmanAlK1k9WFrPZMxXJCE0ClfRCcDPAKfEwxAulb?=
 =?us-ascii?q?IbM4L/tLqMbiq1QvcNJNnj6usBgSHrZRbE1urGRGzg3+4NX+oO50huJZPIc+?=
 =?us-ascii?q?aYayW5yzgOkIm28yMvrHveG9txQ4GyYBQpz8TambhwDUj4CW8m7bPRfTU6rU?=
 =?us-ascii?q?KA9iJjcGkOOSAU2jri+MYWsZ3l2ellYFo5PD2b8lU9a4lGquvINz6p+IGXP5?=
 =?us-ascii?q?1CN/i1aTcHes6TuKshoM+RpCUkgnXrR2IPJzepNFQ1CaGMSeuqrq7hHfQJmI?=
 =?us-ascii?q?T2IlLiwnRiu+9jHp0p9G31zxSv+8h1Dfr/rCBFDCyR+6x/isVrhjEzeJTymk?=
 =?us-ascii?q?w5Ks7RbQG5w8s16pFAdDE9Zk1oe9Fr7nTXgaKDRJ8E9Ps3OYje1NdzuIdDyy?=
 =?us-ascii?q?O6bVg4msv+SAJCDPussrFRwoJ0w1vj5R2RwGl6U2U0wGLSWErCJUwhDu8j4z?=
 =?us-ascii?q?BrXS+GrTlKN16YmpEcW1cPcQYfVh+mrVZ6FwM3iR7qNC4CUw7EzChDlkjhDn?=
 =?us-ascii?q?zOx/oJQfxMThTUu0IQ6gXa0w3crT4s4JlELoLrBIc5hwQwLqO3v646ThsEF4?=
 =?us-ascii?q?G+vVi/yClW/ScbeBXuF9vGE4guyl9zlakjDsWN8rv7gPbtE3ftaLy5rbbqkH?=
 =?us-ascii?q?td3bikft6WzWVL6ER+oRxDE70FyiG+aVDVM5tmHw5oqoytNDdXWLj5cFud2h?=
 =?us-ascii?q?/3lvs1A8NF06xWaZucufSnisnff2/X54NLU2FbenI/IxFWfj6SZ1qGs8PRoe?=
 =?us-ascii?q?U0lUcVNqllGN+IzoK1ykIpXyGxRBoYuW0OQeqdHvI8L4I8NtopjhysdA9MKI?=
 =?us-ascii?q?2GueVLOMziumSlpuLe1reUuxANeluoZavfc5UTz5g+dcuwkp5DnDmUNYCBej?=
 =?us-ascii?q?hexp6MsonqgENaANm8=3D?=
X-IronPort-AV: E=Sophos;i="5.95,176,1661832000"; 
   d="scan'208";a="82497052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEhkBnZmCWeIVJ8G7xcK5s2JGWxzr3aJWqsbR1c8/xvDr36GSCBKUTXByF7Io4fI+/EbK2TMLR7RJ42swHK5oKK3BoKgjKjtaxa4jsCXxLb6ffVq6xzL1TCQI6Zh8WboHFZaHmxmkUJOlFySiCb+9UFkAUd0IKbAaQH8x2o3duvhMIgBFQCsyDQ6gm3hDWFGVSmZN17Kvq1Gji80RtHXKb7OXWWbsUw04On0ceV7OLTHd03xNKd2Iv6FytAZHzIpopd1TkeoxWyHGHnFhlwt7Q0uKetWGOprZyxPlT/BQBwoGEiMPOt8vVEklsFif9DxybnQoqKl5+OullBF73p6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVBkPo8rhBfvYMAMsLwRzoqZwqTHfHHJ+OE47LmFpUc=;
 b=g9BlfC1711NwbNs1++vxCAFS3byz0XpvB4v9cen74Oxh+IdHxn8PwmSipJmbOqrEoWNPJI6Fbc063QDP5rX+XegGikyeBI8f74UCjjSrfs+qpP44mMlse/AEzrFMLDx1pQBaZ2JE+T3U+LXgsTrZB9heMoIWNwXEFUUfigKd1GneOE8RgWfjEa6PYX2fEgq/5R1DuaY3WIs9ywMgbKOPb3yvaFucIWbO2+ywA3bJEsLD5/z3OqW9cWtgoHjsJHQlvDUYjJbna7WBewQUuf+eXVtZFydnwDYqbe+EWagOnUDs4b4V6hS0HJ4EdxbtqCDSA2p6C7Oqje88H16z/uZHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVBkPo8rhBfvYMAMsLwRzoqZwqTHfHHJ+OE47LmFpUc=;
 b=hk9UcBSEKL8yEkVJJfQNbshBTJthac3eSI+xZ4sEq5dWxfygTCH8VjUDJBy0n0NsRc8yyfCy9SSAJJ5mgl1GTdXn8cM7IpW7gCsbBMOrjGVTAjOvt/ooaOA395EceB0coBVgKqMd5VICJKPeNEA682Yz58C5yOOHUZ7uumg6MnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 2/4] amd: remove VIRT_SC_MSR_HVM synthetic feature
Date: Tue, 11 Oct 2022 18:02:43 +0200
Message-Id: <20221011160245.56735-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011160245.56735-1-roger.pau@citrix.com>
References: <20221011160245.56735-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0035.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::23)
 To SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c9f1ad-f2c4-4a28-f277-08daaba23cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PKsXHCw05MYbPQwt28LOUmRWNkjg1JKNM03mC7FUYchg2FS/z6ZyJeWRmgTzSlw+A4Zpg91bHuDhRR3P17dQtmB9nONtxZj1KA2kXNN3RFdWD/YXtsCi0A2VxdKR/HM7ZU+Afwyg1FGVhY0y1+3KOx7xYh3H8UNwBb/8LQcn81S69kU3B0qE/Hi4ODfn4oSyvvDOdvUhjmK1f9JOhSh7wFnKRyHE6vTwjkZGbQoqetrejn7z9bIZO5mVPTKKbmFQVAo0HzJUhNwvDHZ03o+1NU+sBgDKCXu4tglqt1bhbwshK9n6QKOchwkrBI0h8smHzsivHGpjH99MK0XJM0BXMYl5VNhJrUDoaOaQeBpjAejSl6VQ5+afCqQEdh4t1jFky9xJb43jJl7vlbdb+PHW4a/1UnyDY7qiElnpQXPNW8rkhppkayEddvRe0MruDEQJrR6+L6DziDvdyIQrG/c2UxZwb7fjVgP50HUoKmFESpMwOoPK0sTwyMMnJvX6lz3wSEQhHOaw8cMhtZDpOBVR/S77gsXl7BdziVX+ZNaksaL8z2vb9xcnlEh4Xp+aEe9HcjdByYwo31YkhrNQM9QFp/3DMqOTj2LdrOp10cwAKg19ywxE9sM2E5jK4DXmrvQ2uDed+PywbIqcrDWwYmRdjQhIJ8xucJYvS0FN0vGC5YH/j8r4g8uwgfZlv5UwJjV3ovDqL1HcbyR8tT/A8Re9eQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(83380400001)(5660300002)(38100700002)(82960400001)(2616005)(186003)(1076003)(6512007)(6506007)(6486002)(6666004)(26005)(478600001)(54906003)(6916009)(8676002)(66946007)(66556008)(66476007)(316002)(8936002)(41300700001)(2906002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3J4aG02SDNCc09mMkpzNUlKandjREEya2NmTTB5TDU5SVBQOHpVRE9ydHRk?=
 =?utf-8?B?dFVLOEM1VG5uUWI2MStnZ0szUTNQTkI1bkhaVWJrZDFOVWVYMUM0M2RiUVd6?=
 =?utf-8?B?L3J2dDlsdzM4K1ZtVklMSVh4MUJraWgwS3hmNFBjeXg4YVlUcmx5MUd1eEgw?=
 =?utf-8?B?akxjYzZyVmxzVHVvWldoQldCU1dQRFBHMDdFc211aUhnYTF0UGVCb3BBNHdv?=
 =?utf-8?B?b3ZydGVMazh4KzJsN0lDdDlBelM0b0hJb1R3SUVodnV3ZHJJR0Fyd3BGa0JJ?=
 =?utf-8?B?bHhLVkRFdjk1MCt2aHhUSlh4ZGtRd1ZQWndmdGs4SzIyUVRrRkNwNGU0Ylpw?=
 =?utf-8?B?bzBGd0UrMlUyV055TDRISXI3cDZnOWJtWEplZmNEWXkwQlBPblpwalc0czYr?=
 =?utf-8?B?S1ppK0ZBaDZXR3Z3djNyUDBLSHZtNmpQc1Q4WURVSTdMOHNKdW5TT1VWcHB2?=
 =?utf-8?B?K214T1ZodjBxeEVIOUNjb0lJVllTWGNWRW1IbVRhTWo3RWtaKzREWUZvclc0?=
 =?utf-8?B?eVBJWkxMM0ZlVXNHNm52bERjajkzTS9IV3dpQWZaRTVIWHJUQzNMZks5dStR?=
 =?utf-8?B?b2lNV2lJcVk4QnIwSjA1RlRlVmkxdDZsK2pXelo4TlNoNUx6aWxVVEJwVVNG?=
 =?utf-8?B?UjFXVVA0NU04dnpZakMvSXFaNmtETkx4dFU1SzRNbnhnQmhOYjNETFpxOG5S?=
 =?utf-8?B?MEp4ZC9YamVKbmp0bXI1N2JRY1lYNnVUdm9VUnlzbVFQMDByT0V6ZXJjSHlj?=
 =?utf-8?B?TTNrQ0ZOaXJyN3VpRGhKVEp1MmRsZUkrMXl2a256cTZVNmdSdzh2NndiSVRK?=
 =?utf-8?B?SmFiYUlsZktWcGlKS0p3Z2NsYWFZWWJlWXJLV3NCTTVzZVgycmpNVmwxaEJw?=
 =?utf-8?B?dEhWT2dXNFVUekZRMlUwR2lrdEhjUWxQdmNJZkhJTjNmQXNDLzc4Ny9nNUFh?=
 =?utf-8?B?ajg2NlU2WnJ2THVLTGJqMzgyclBIMWt4VUQycUhXeUlCVjJYQ25LN0N1NVdP?=
 =?utf-8?B?RkUweGlPdXFtN2dQcFdOdXZ4ZGRhVnpGRXhJLzJHam43SXRkcEFRSVNjTTNm?=
 =?utf-8?B?MzlOTW5kallUY0tBSEgvdHlQTHpmMEtaNzRaWEM1SUFDWEZweUdZcjU5UFFW?=
 =?utf-8?B?eE1jMnlyK3lHa0R2eENDOEJ0YmcwcE1xS2RmQzk5MytmTGNOeFVFcDVqbnRp?=
 =?utf-8?B?MXA1YTh0dWsrb2ZCOEhyK0J0NndDRVBReW1KbURMK2lzcUJEc2I4MjVHM3Yw?=
 =?utf-8?B?Sm9BdEtXeTIxQkNVSGltdVVUMXNyenUxOEszUnFNQzYrRXRIS0NJajAxeWI1?=
 =?utf-8?B?RElaNjdIM0hMQVk5L25ucW9nTSs2dDRrVjEwR0VWQ1c2d3FRam16dFVlUDR2?=
 =?utf-8?B?ZkRkK0dZenhiSGVSOXR1RWxVbTNhcDZiY25Da2grSlNCOERnWDhyekpJMzVh?=
 =?utf-8?B?QXVxTnJXNklGVG12OVhuN0xQVXBEbU15ZjRQbzVmemdjZU5wTUFadlBQL0Vn?=
 =?utf-8?B?STVZMXJYakYxZW00bU14ZE9oTEJ0dHZDV2xONCtFOFpINkVxSGEydTBtcytS?=
 =?utf-8?B?YklLQUxsdjFnQ2RSUkdZUlVERmJUUGFoUy95NEtYVERHWk16eklFRUZlNFUw?=
 =?utf-8?B?Q3U0a1JUd0tSZGNxS3Y3OVJhbVNlWDc2ajNOTjJKUDM4aXM4R1lhMU9BcTNV?=
 =?utf-8?B?cWx2S1BMNWV1UkJmZE16c2hSK2Z5aUU3TkIwT3VvU2toT3c4YmlBU3ZFN2Nw?=
 =?utf-8?B?eUplK3R5SmxxVytDc3NTeHJrbFluckh1cUEvYTNDeGUrMGdQM3dKaWlDREhE?=
 =?utf-8?B?NlNXOEN5TlNTemp1eDRKWnlrMUozWG5rWnVkdkQxSkhvOHhYOWdzZHU0b3hQ?=
 =?utf-8?B?d2tDaUwwcDVhOUdjUEtIWTFQSWJ5eTgzMGo0TmM1cFFGeUwyV1NkKzRkR3dn?=
 =?utf-8?B?U1pnbEwxbUgwd2xEVDFLYUtMMUZ3eGpjTnprTjgwUGhPNDhkZ0tDSzVZZUgy?=
 =?utf-8?B?ZUEwTnRVaHNDTTUrTTA1NnBzeThRSzA3WGJYbWlCT0RIUmhTc3pwTUtlRit0?=
 =?utf-8?B?UnRhY1MrdFN6cUdvVy9OSjRtU1A1aWt3L2Y4WDVkSHFvdm9uMDZiM2dGRmxB?=
 =?utf-8?Q?EDBhZ8sbkCNPAVd9FNQHeDkCL?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c9f1ad-f2c4-4a28-f277-08daaba23cd7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 16:04:12.4283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwrwBFVLrI0umlA1XE0Yp1wQjMyQwpUqNukNTQvZrRivjkCjha1o1ca56DjbWPX/vD04ps1SaSR4EWdaTTORAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769

Since the VIRT_SPEC_CTRL.SSBD selection is no longer context switched
on vm{entry,exit} there's no need to use a synthetic feature bit for
it anymore.

Remove the bit and instead use a global variable.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c                 | 1 +
 xen/arch/x86/cpuid.c                   | 9 +++++----
 xen/arch/x86/include/asm/amd.h         | 1 +
 xen/arch/x86/include/asm/cpufeatures.h | 2 +-
 xen/arch/x86/spec_ctrl.c               | 8 ++++----
 5 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index a1582e1cc9..c28f2d5220 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -49,6 +49,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
+bool __ro_after_init amd_virt_spec_ctrl;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 822f9ace10..acc2f606ce 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -3,6 +3,7 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/nospec.h>
+#include <asm/amd.h>
 #include <asm/cpuid.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
@@ -543,9 +544,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /*
      * VIRT_SSBD is exposed in the default policy as a result of
-     * VIRT_SC_MSR_HVM being set, it also needs exposing in the max policy.
+     * amd_virt_spec_ctrl being set, it also needs exposing in the max policy.
      */
-    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+    if ( amd_virt_spec_ctrl )
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
@@ -606,9 +607,9 @@ static void __init calculate_hvm_def_policy(void)
 
     /*
      * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
-     * VIRT_SC_MSR_HVM is set.
+     * amd_virt_spec_ctrl is set.
      */
-    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+    if ( amd_virt_spec_ctrl )
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     sanitise_featureset(hvm_featureset);
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 81ed71710f..5c100784dd 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -152,6 +152,7 @@ extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
 extern bool amd_legacy_ssbd;
+extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_ssbd(bool enable);
 
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 3895de4faf..efd3a667ef 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(12)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
+/* Bit 12 unused. */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 4e53056624..0b94af6b86 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -514,12 +514,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
-            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
+            amd_virt_spec_ctrl ||
             opt_eager_fpu || opt_md_clear_hvm)       ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
-            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
-                                                       : "",
+            amd_virt_spec_ctrl)                      ? " MSR_VIRT_SPEC_CTRL"
+                                                     : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_md_clear_hvm                          ? " MD_CLEAR"      : "",
@@ -1247,7 +1247,7 @@ void __init init_speculation_mitigations(void)
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
     if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
          (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
-        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+        amd_virt_spec_ctrl = true;
 
     /* Figure out default_xen_spec_ctrl. */
     if ( has_spec_ctrl && ibrs )
-- 
2.37.3


