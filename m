Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209636C6E5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 15:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118499.224667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNcc-0006EC-Aq; Tue, 27 Apr 2021 13:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118499.224667; Tue, 27 Apr 2021 13:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNcc-0006Dn-7L; Tue, 27 Apr 2021 13:19:26 +0000
Received: by outflank-mailman (input) for mailman id 118499;
 Tue, 27 Apr 2021 13:19:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbNcb-0006DS-7C
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:19:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a978bd86-e563-4be9-9554-89b549adaaa8;
 Tue, 27 Apr 2021 13:19:24 +0000 (UTC)
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
X-Inumbo-ID: a978bd86-e563-4be9-9554-89b549adaaa8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619529564;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uLUd233mBG+Fxusj6Unmqf25KWhNUEn6J+kWJNxNvnE=;
  b=ZkGxbj0WBSkbii5s4zQb9Z1VYrlZakLvfM6IaMfCVZ6bSkDwnKAsL6Ee
   dNnxnLu8XHUGzAB1zJ8cWnEMwgOVkDZUfSiwpbF+w2Ca8kTUw3Z2RHgpY
   9P7Y14kmbJzyoBJjFCYW15mEWdS1emCCszOMYkcgiLxm2d16PfFTiMO9Y
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xA+Z6CCxRfCk3vZec/6D9OT+IP636IA7xA4aetobkVGhZ1XPqdqYsiy1fpuafObiYd/vG3LeMN
 Qohy1xsIA6JgaXFIemkiEC8uT80rOTJZLyEIPQOSPv/lp3rJVcOmMcf/eiRC7/k67/SN/VuWa5
 abk4xIfW4P9BKSUsbevwbyK1NEOskqrlM95f6HEA8DglimdQZR7se4N85f0RccDKtKiBjOwHn/
 IxyLFv/iomn0TJwDNgk40br9PJbdQ6UsHBOtNISRdB2z1yJB84n0cf/YHamBeUzI+1TzYHpUwh
 ozY=
X-SBRS: 5.1
X-MesageID: 42514110
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hiTniqv3yYOZw2ZA+p9hSD6s7skCB4Mji2hD6mlwRA09T+Wxnc
 qjhele8BfyhioYVn1Io6HlBICrR3TA+ZlppawYOrm/VAfr0VHYS71Kx43k3jHmBmnC5vdQvJ
 0QCJRWJdXsATFB7frSzxK/F78breWv0KftvuvGymcocAcCUdAE0y5cKiK2VnJ7XxNHA51RLu
 vn2uNiqyC7cXoaKuSXb0N1PNTrnNHAmJL4bRNuPXdOg2OzpAil57LgHx+T0g12aUIs/Z4Z7W
 PHnwblj5/Nj9iHywTR32KWz5NalMqJ8Lp+LfGMkcQcJ3HQjB+pbu1aNYGqgTZdmo2SwWdvtO
 OJgh87e+xv9nvafwiO0H3Q8jil9Axr1ljP5huzh2D5rcnwWTQgYvAx/L5xY1/e8EovvNZ1za
 JN0SaYrvNsfGv9oBg=
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42514110"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GN+gth6KhphB4YNH1tYdRwOLcugsFdn8yLJfGto6rionXuvfCsALdPnJx7PHaHWlE/vP7WwyUXh9eOhLjvxT6iryTEN8GxzDqbmejrUTPGJJ+vEY16IbUO031sRZvH7jhY4+vtMJJIKVjcyCASyyPvUEWcVXOdPUhOpMdIkV9X+vomcUPHct//Jcilc96uKk8C4kthCfc8LswRj8mKVul39J4h7s7p5d89e4oHQfhlfg4WcSk4SP84dNcvsNMwC+Zml5+EHyLpmrQQgEHGRL0kYmPa9/LT3novFWdZKiJ8f3aBVIz9AJ/sKoOS862c3bXZ67rIPRk7lIqs5G+bGQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLUd233mBG+Fxusj6Unmqf25KWhNUEn6J+kWJNxNvnE=;
 b=ct6mlNU/80axlN0gssutBp0PzR8RuvWaavWzwfc7M0CaqcQcqWO9vQyt3spXoM/6YtDpCkPMTECVdr8AUH+hWszRZLU2lZZeww8OnL7NjwXH1bwHjGlOZw7W4cEEKoiU3hfxNgIafpXKm5+OVIHs6RiCMZW5NGPcHbNZVRrndQAUwdd4vAwAA6y0D7RvN+l3tgreufKrKw6YZ0ZvAH31PrJoMhMGDWY2nhfxZvffHMQKodMmc93UD5fNsY8EG6y03A3ysDeEzrVer2nue193WFzx97t1hy4u+1xFFzdTWftqDq2nczIQnLMN4BNbrLfzAvTAfavwQzQ9zwUrkYUzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLUd233mBG+Fxusj6Unmqf25KWhNUEn6J+kWJNxNvnE=;
 b=xBYQn+mg/4BYNL0HWRzmfGRi+EzBA/p5t9pVbhYt+IhzTITuyE3opW6DatsnPc0/csfLNQ6wGC6OmxhsPqKroItr6+QKk0JnJ3JHpT6We4s6Y2s8ZDnUqwgFaE9OklELal3UTZZpL8B4k+4p1RyCTNEqBlbx+vPCLDR+5/TSmUE=
Subject: Re: [PATCH 1/7] x86: correct comment about alternatives ordering
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
 <e6f362b3-2339-c5cb-362b-743271dbe826@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c826609f-e4ba-f598-1519-5387e3d632df@citrix.com>
Date: Tue, 27 Apr 2021 14:19:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e6f362b3-2339-c5cb-362b-743271dbe826@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1217c668-de5e-413f-c458-08d9097f0fb5
X-MS-TrafficTypeDiagnostic: BYAPR03MB4295:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB42955EDF0E53C4522F092C6CBA419@BYAPR03MB4295.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /lbBqRvmTlJBXl6G5DGiVrTAyu4q8gpBFy/3aVnZBQWeb4v5joBzpz/ttWbUCd1ilZYgK6mZ5bryz8+H+Sz3dqJqYWHDIXlwq6cPHdL3aU/vRAgYUas//SyN6gEu42y+ntNKpRvjSCxs06JfKmFEa4NOyegGoAoK7juRh+qMqgh9tArsD0DQ97zUd441HHf0liVxJmP67ifbHRwAtrC19grfaDV1VeD0mQk9ax8uEtZWo8GArwE7Rrivz2qSvJ4yIsI7/pliSmDFH5iMUuylaNue2tpCxSOzAHD3WWQpvDeigvMHAb710PIfi3ROx3JUhWgSMO4suG58Rsr9AhLrCiCgECrbeL7vcElIVsE7Isow/c+iq8u2plynPAR4Iw7Mlk4K27dLdw8SMpuM9PGzltiXsjac06GxaD7TZkUrBY5tuNNOz+aHWWSpM+MpGtB3LwNuUVkHuZ2SYyOE94e7c8h71u6jVpvU4MY6TE1kiL9oTc0+GftIR1E0C0aEjUz9aKDGslOG1msC5RltoPCwON739zqmEhDb+BjeWCK9f1Vop33e/HZgMXIZM8E6FS8ww3yij7JlhPGsmRgIaSsDcKTxbVhkbm2wOUxS/899t3UdLNmyz3TbU/rC3pET5JN53NdG0rWx4vL9hj5MnkD4bXWJVhfG2KtSebT7aU9+xhs4CjFBGERowVoaAr2NcK9s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(66556008)(36756003)(5660300002)(66946007)(6666004)(38100700002)(4744005)(86362001)(16576012)(66476007)(110136005)(316002)(54906003)(31686004)(478600001)(6486002)(107886003)(956004)(2616005)(16526019)(53546011)(8676002)(186003)(8936002)(31696002)(4326008)(2906002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2Z4dThBNWdoMjQvQ3pqendVbTdCQkR3MjB3WTVhNGQ1a3kwdjJzUUhGbTBY?=
 =?utf-8?B?SWZvSEZWRDFDYTgyaGtSem4rNXVEcDQ5bzc4akt2eS9TZnFmVUw5Z1Y1MVdU?=
 =?utf-8?B?cG05NitNN253bU44Y21KOGZmcE91SWRQZnlhUTg0Mlc3QURabkdKaXRKNjZr?=
 =?utf-8?B?c3hqWXNxTGljV2h6UG5KR1NFcTNpZWNFc3BQSmo5VXdZaTl4YU82S2htbUhk?=
 =?utf-8?B?OVUrN3FLUE9GcThCQWJZbk5aVU02emt5cExDRWMxVExKQ1ozcVhPekJyL0VI?=
 =?utf-8?B?VjN6RHlaSkZKQzZOTWMzWTVqa0U1WUt5b3dzbmpYVzdaNzlUTXp4NzBvTW02?=
 =?utf-8?B?N1JyR1FFaGdDM0N0ck1aWEtQMEg0L2VzTC9tVXpCSVpiN0FseWZUMjUvTXRR?=
 =?utf-8?B?WEdqU0VvUmx4bTZrRFMrM0lvYkZpdDQ3WUFOdCtURWpIYmVZYUdicnBRTkZY?=
 =?utf-8?B?b3RVTzJIdjVvam9nUjE4b2NQM3RxR2VrYk12MXZNK2JCSzlZOUpFOURxSWQv?=
 =?utf-8?B?Q05wVnQ2eGNldDNFSWlRWkN3NTE1OXZxZEVEdGsxZjNwMm1CODBpM2NuQ3Vj?=
 =?utf-8?B?aG1CaDdNQS8wRUFpYzVzbWkvR0hoNmluSmltcWd1VFI5UTlHa3NiSURwNEc3?=
 =?utf-8?B?bmRqeVBKMGhrODI3YmN4am55cnc4S2NPbkYrTnplSE84MHR3bWxESUZHNjI1?=
 =?utf-8?B?VzhPNDdVWGR6Vzh1eEQrb014aTM4bnEwa01rajJ1VHAxdXFPMTZYQTBUU2Jp?=
 =?utf-8?B?Q0pXNGw2dmcyYnBsR3dXTzJSQlpqY3N0bHc3blB4VVRpVHpRNnZQNHhOaXkv?=
 =?utf-8?B?dHhielRjc0RTNU5aZkY3TXFoZHFSS1lIQUV5czdLZUxQUC9vbi9tVlB2OStK?=
 =?utf-8?B?QUx2ZVd4K1BKNkUrekkwdmdEbUgzSlN3WFUxM0JBdDVUNDhiRkJoRUdxaW5m?=
 =?utf-8?B?UEtxTlhXN2lxN0xpbXMzT0JTdnJIUEE1WngxSWxHbkRMWEhLZUNJTXV6MnJI?=
 =?utf-8?B?SFF3Kzl3aFArNVZZRlZ1ejJ0UWgxL1dTY0FtTURYUW1kS2k5T2pBNWo5anhr?=
 =?utf-8?B?SUR0emZGcXlqdkU2RFJ5YUM3VnJKY1hvQ0ZtUXpxcHZGU3Fka1NzL1dqZ3BX?=
 =?utf-8?B?YlFpb3orcnhBWG5oa0p0Ukl3clA0NWN3S1NrRWF5ZjNBNXJ3bjgvN0t3d0VD?=
 =?utf-8?B?a2VRc0c4OU1XaDUvYWUxZmcyWlE4cnFmS2hJZGdkbndJcDM5SlhQZ0RUVUtV?=
 =?utf-8?B?QWZaaUJDQUVqV2krdW8yUTVWSFpDaXozVWFGZnF4UHV6ZDNxd3RBZWlPY3du?=
 =?utf-8?B?dG91QXYvR1F4NlZ4TFhaSkppYlI1ekVub0ZJS3VJKy85UFp4VGVsdG1PWUNi?=
 =?utf-8?B?Qkt1L1llcHNIT2xOOFdmTXdyTlZncDUyZVJLU1ZPLzMySVFIbnRZb2wwdm5t?=
 =?utf-8?B?dEJxclRWOUw4Qm03WWZZVUFrYTFLQkltZWNOTUQyL3ZrOG9DSjllQkVnUmdo?=
 =?utf-8?B?UEg0b1RTRTNkUStKckN1NXB2MmsxY2l3cHE5eGxmTVhUSEcySGFWQ3dwOUhH?=
 =?utf-8?B?Qzg0ZnBEb0VPY0owT0o4RVp1Y29CTnhrWjVHN1VjSVRtMU1iK3BCWFN2MnJN?=
 =?utf-8?B?L3dSVXR0OFFlNkZaeGZMU1NNcmJuYzVPODE0d0pBZW5OMXlrbGtZd0xiVk9Q?=
 =?utf-8?B?MFRDOGNXaGh4blVKVnNOMWtqYWdZajI5Z1hPdW5nZ2NMT3NRVzZ0WkdZeXJr?=
 =?utf-8?Q?ISu+lJD4JJhwkALQzVQQnn5h1HAmXOR0bTo2zuk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1217c668-de5e-413f-c458-08d9097f0fb5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 13:19:18.0391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGhCp9e50HWocXe2LBb+oGL2WNjwI2bAY0hMxMmfxP1rxIvaTwN0HNJI7NbV+2jwQTpHIT08FxtNkPgUM0nilLzjGjQw0EywYg7VSFZIl0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4295
X-OriginatorOrg: citrix.com

On 27/04/2021 13:53, Jan Beulich wrote:
> Unlike Linux, Xen has never (so far) used alternatives patching for
> memcpy() or memset(), even less such utilizing multiple alternatives.
> Correct the Linux-inherited comment to match reality.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

