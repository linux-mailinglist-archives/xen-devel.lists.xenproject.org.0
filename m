Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5EF50B473
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 11:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310785.527700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhq1I-00024H-2W; Fri, 22 Apr 2022 09:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310785.527700; Fri, 22 Apr 2022 09:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhq1H-00022D-V3; Fri, 22 Apr 2022 09:56:07 +0000
Received: by outflank-mailman (input) for mailman id 310785;
 Fri, 22 Apr 2022 09:56:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ8Z=VA=citrix.com=prvs=1040bc4e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhq1G-000227-TI
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 09:56:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b6d5764-c222-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 11:56:05 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 05:56:01 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3351.namprd03.prod.outlook.com (2603:10b6:910:57::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 09:55:58 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 09:55:58 +0000
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
X-Inumbo-ID: 6b6d5764-c222-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650621365;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=g9a957wLIr9qdQJBMWI6OwIVOkd+Y3rhznLifd7+Tyw=;
  b=I3tvZQC1e6VtICDiHVDBqCjiR2PhsXHdJZBAmVG3RiHo2ZYZoPXV9QzX
   NvPBUZHjDPMj+/udulHdSWMlNAzhA1fWlMbmwudt07sA0sUUe/IXCAvmw
   YBUfPjRYfML1IKvT5YIx1M/SE05Mu3nrpmvFZIAgdLplvptVwX/h8jJ6q
   E=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 70091864
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4y48L6yt8t7osKnWOUJ6t+dDxyrEfRIJ4+MujC+fZmUNrF6WrkUDm
 DRMDTyFOq6NZTakfNkiPd6xoRhQu5OGydUyTVBsrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024LhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplurebYkBuMZHwlekcdEdoLHtyE6Qa0eqSSZS/mZT7I0zuVVLJmq8rJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHuOTuocwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgK2UJ8QLL+cLb5UD80iot3IWzGub1e4e2fvlMwwW3t
 3LZqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWMwkQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO+gz6QXIwKyE5Q+cXzIAVmQYN4Rgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZowL/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:VLDouKsq3tUTkBpJKrI/z+/s7skCJ4Aji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKdkrNhQotKPTOW9ldASbsC0WKM+UyZJ8STzJ8+6U
 4kSdkCNDSSNyk6sS+Z2njCLz9I+rDum8rE5Za8854ud3ARV0gK1XYfNu/vKDwOeOAwP+teKH
 Pz3LsjmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgHfIBej8AreSIrCNWkH4oN69PFkWwHE5UQtpsxx3Z
 RCwn+QvZtSARTcqj7w/cLJURZdlkfcmwtTrccDy3NYSocQc7lXsMgW+15UCo4JGGbg5JkgC/
 QGNrCQ2B/4SyLsU5n1hBgl/DWXZAV4Iv5GeDl1huWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKfsVPpZPfeKnTmjWBR7cOmObJlrqUKkBJnLWspbypLE4/vujdpAExIY73J
 7BTFRbv2gvfF+GM7zD4LRbthTWBGmtVzXkzc9To5B/p73nXbLudTaOTVg/+vHQ68n3wverEs
 pbFKgmdsMLd1Gea7qh9zeOL6VvFQ==
X-IronPort-AV: E=Sophos;i="5.90,281,1643691600"; 
   d="scan'208";a="70091864"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmwjwAyTivmZWVxdjV12zNpEyuCbUBE6RqvWijMTOrveP6D3EoPGlvgCa/44EtDy3VPjSmySFUh2xQqw92mo8EgPtxY+m3W3yyHawk1QKcXqBmToNfgY5bbycntaFqogXuI0vzACL72Yq4eS7GcHkebRH8zsAX99CnoQh3g73B8mp9/U7Xfgz7iqKm08O9rNioGc2MKqKxwTsZBzyyJuC6cAXutXcWCm32hOu/DVMsi+ko6lROYWvGIR7LI7IhRqSYKCNE8xP/ckzcq2pk5un/IgEcn2luC54YEyxAbnZCqC+CcqG3WADInx6R3fjWWQaNDsbfvgwr1wmfkeKSuj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a04gQxjp43IJV6/yDVIkrX8c05kdMCFzPAj6huzj8to=;
 b=dCUZvGi5maHmHd6wTRdX4PcJ2xFLIsLkEmreG+C6qW7C6ckLY7nkYGslAd231s/s0g5PaNGUKPbIuRiTsgJ/CaJCh3BTACHo3ZG2LrMD+yIG9LqdjBzGxFd7hhietuY8C/HOYlqYE3e9SubjzPhVw7m8b7oEEz0VhlAZtTdssSY2PgBE9MRXQRwtsbcAcbDSPMHeKgaDA9cWhvbas111JrePRKTE6KT2lO7Rs6n2ymxZIAVbGSsUdZxBFSuf0jcrPo6pFamosiaHidk9Pm1tOM+15NptUeX08eLQH3tY9qTtPvreXhFrYshYc7GfqkIssz2Y/g61qz9xDUJkjkB+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a04gQxjp43IJV6/yDVIkrX8c05kdMCFzPAj6huzj8to=;
 b=ebDRpmZEJo4FrWG7ZtpmzqSErRjmZxQ/FW5KH1Vmoyjxsl3A5WLFEZr42ep5OCami2mP6xG6v9qc+qgd+oQrAqLqK9W5PoVYNj8dEcW5iU7RSPp5DUdFfflvh/cJUfA6HlhRJWPTONrkQWCAtkM2wA7rk+M2pmK/0VN/j3GPGcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 Apr 2022 11:55:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Message-ID: <YmJ7qr6W7cFkwV6W@Air-de-Roger>
References: <20220331092717.9023-1-roger.pau@citrix.com>
 <20220331092717.9023-4-roger.pau@citrix.com>
 <0bb48681-a78f-d32e-f989-822dd5e54b70@suse.com>
 <YmF2Zw13O6oaAT0k@Air-de-Roger>
 <b7e3ecbe-6c2e-94f9-58c6-ae49652e6a29@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7e3ecbe-6c2e-94f9-58c6-ae49652e6a29@suse.com>
X-ClientProxiedBy: LO4P123CA0118.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89aad3ce-c02a-4bca-c984-08da24464cdb
X-MS-TrafficTypeDiagnostic: CY4PR03MB3351:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB33512515DB36B924395D3CE98FF79@CY4PR03MB3351.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1UWwypnkDKvZgFNPu5WS9YtMS8ZKplSkYsoBp0XRG4GoD3ZDpUHKBmbJVPfEYynduvaJETI2lL84MVP857qFHydWFzB1goZwBMNkWcyo1A89fz67nTbyVvXqp8/lLxkiBrmDggRJG83ChYMqfXAbrks1zy1qX1uwYTLXe3fJATXMiAfzWGftWEtiSs4GnwK+zdg+cJm3l/IIzB9HOYKOAQEEj+GPJGUNVhbdqIjLlpTiKJL3QgUEt//IuP97bRo5XRqnQbRAQ8XHV+7HCpYfZt6vIK8gO8uRtNn99HmjfXiLEcuaBNhkX1HBynehdgbrLCH+tZxWvRxDgWB0BrzQXrN5cyXdOmTrR8hzIq9/G2e5fq7n565Ajc/SO3Y0nNYq/fSGkhE2jc7V+Dx5cy6ssl4bbHTFwMLoLnWZJ+1qkdQFHeuuePrlf0oxWn7F2f2hgMhJFGk9XGR44ILvBClYEwVxuXUOjwkEbe4NPDNkqvPJHphHd8gB3wDpyR+aWORFRkhrtsDNBvWm8qN31V4IsdWABOHIFyYt9eXlrWi/FHLLZwVuT+cdBAFE41i9GPxJugDH/vQqv79gs/nbmYOTpHdHHVSWxmSTa3R1mwTxCpYbSrajRAqkLvjLVUK+fwrJgGP915ouKrEtMOldbujNmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(4326008)(8936002)(66476007)(186003)(82960400001)(66946007)(9686003)(53546011)(6512007)(5660300002)(6666004)(86362001)(26005)(8676002)(6486002)(66556008)(6916009)(54906003)(316002)(508600001)(33716001)(85182001)(2906002)(6506007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHJCNGs5ZGprMmhMbTdkOFBqVlpuRFJWeXdzUzFFVVhFM0UzL0xFcG9nQnU0?=
 =?utf-8?B?UkoraTA0dnJLZU5XSU1EYWs1QUNyTFFCM0NaSEtQUWdZUHZRZGovY05POXN2?=
 =?utf-8?B?cEVZRlpJK1pMMGJHK3Boa2RraVZFcDZiK2gxbDltRnA5MUJQVU9ZRXhPN1pl?=
 =?utf-8?B?VDBIdnRxcVl0Z25hUk9DS1lGOXJGdVlBNDF4Y0ZGczRBU2hYNlJTOHhkeU81?=
 =?utf-8?B?OEdrZHRqRmE0SVcrWmNuMzExb0tiYWRhUGROa3RmRmpTMm1FcWpPUEZxY1pL?=
 =?utf-8?B?akJMTWNCUjVJb3g3UWVIUjhBd0QxSXhDNXpUUHZBbElxcE9EQXpZUnlVNlhi?=
 =?utf-8?B?SlQyS3BaU3JmWG1jQVN0bzVObDk5bHpIamJSbTFZM0JxUEhtZFVITTZVVHM0?=
 =?utf-8?B?aGNNWWVWTXdBNkpYNEVHNlhkdk1YRVlrSWFManAxTHVBNDBkNzZrZWdSNHo3?=
 =?utf-8?B?SWtOWWlMQ09EcWFDUTR5ZjFBN0JkV05NSlpkVXN5Si80NFlzdDdOU21qd0F0?=
 =?utf-8?B?NUwzWCtpbVI3dzR2S3o4L2xRNEJFTFJyU3N0SFRTYTJZTldRcmwrOVdXOVBG?=
 =?utf-8?B?RWh5TnZkdTJUWnduQWRNdXAyRFdJOVdtYmlsbzVBSkkvcVFrNUhCZWVqL0FT?=
 =?utf-8?B?Y3hQYy9CcjdBTFIrUzlyUlVFdEJmckFYdGgwSXJLVFhDZGh2MTdYSDJvUjFv?=
 =?utf-8?B?MnM3aDgwR0lpb2wvQXI3TGpaWitrOW1qVXBqajB5SnJ6SmNBa3F5Q1VMNWF5?=
 =?utf-8?B?MWd2aFVzNERaUitiR2tiRStkRldMM20rcElmVXRtM1ovMUEwSXhJWUhPWXds?=
 =?utf-8?B?a0JFZnJzZGxBeDdwSDBvZVl3SnJCOFRMeEdZTldoVWFSNm9rdHlSZzg3bHd1?=
 =?utf-8?B?MFBUdEdzcWxpTFMyZDVwYkxsZnlOR0g3RjZ6Y012V1FOQmVEeE9mTlE3dXRi?=
 =?utf-8?B?MHFXQkczREdoL3N0VFBHcEU4U0k3ZkwxcmRiaytmUzhYVnFHZVp5Q1huMlU4?=
 =?utf-8?B?U0ZvT3JtbytaUmNndG83UG0vU3dkS1BEd1NBU0tRRThVYWJaZUtmdFZidjhZ?=
 =?utf-8?B?YkszZ0tMazZoNUo3UFJxcGNCdVlSUzdQVk1BSlkrbDlnZVYzUTkzcnBDWmxz?=
 =?utf-8?B?c0xsUEphOU1wOEt6Q0lwMVd1MC85YVRZK2lPOEUwdk9OMXU4bFpWYjA3dElI?=
 =?utf-8?B?cmhLdDZvV3RKYUpKbnhtZ3Nwa2ViSkYzbWNwdzRVSlVlN2ZZYkFzWmtjZVNF?=
 =?utf-8?B?elpqWDQ5ZUFIY2ZJTzJQRzBNYndCRGpNOS9JVitWZlhQeWI4aExLdFJwaWVa?=
 =?utf-8?B?VU1DeVpVZWc4OGJ0UzJKd09uU0RZZ0JQekZmSVJLYTlkcEJRaFNOekRYT1NO?=
 =?utf-8?B?a3h4VmJxMEhkSDJsU2R0YW9odFpXRmtLbW0yZHlrczltdUl3aHFhZ1BsRkhB?=
 =?utf-8?B?a1lhK3dxRXQrRGFmRDJabkZUNjhIZUpLV3Z1SmNYdFF0RmNVNVA5aFN0dU10?=
 =?utf-8?B?Y1gwRGtuSmw2eUN1S0NSN2pJVnhjYVlsRmlVOURZL0xnN2htekhyVkpMWFMv?=
 =?utf-8?B?bFF2TlpvN29FK3hQY1J4L1NQeHFOd1hNOW1xbldhdnVRWk9BNWVEZ3k0TmRN?=
 =?utf-8?B?TnViOFRsMzVrbncyNThyN0VPVFFYOW5GZ0lHUTQxZURveGlGa3A1TVowczJR?=
 =?utf-8?B?aUZtbTE4M2p6UnZZczUyV2Q0Q0xsSm9md0FVdmZQNW0yWFVNZW5tVEswMXFQ?=
 =?utf-8?B?bVE5a3JnS2VVYmRvMEt1NlQ3bzZTMG01NXp2Yk80TVlBaXN0NVZFbDRkL1FR?=
 =?utf-8?B?UTRBOTZzWlRNMm5uemNaZlhGSk54U0VoeHkwVE44NHhncEJ1QVZNblVaYmtY?=
 =?utf-8?B?QWJ5MHE3MllFN3UxMlFYSnBRUUhhcnhDdTdYZnRQQmd4SVFXbWR3NVpXTFht?=
 =?utf-8?B?cHkybk1waUp3YjZpNk9JZzF3U1BXQXZpbFlkM2xTQzhMYVFHTjlMcG5WUk11?=
 =?utf-8?B?bmVmaFM3eHhZb29oSmtsL0pubHV3RCtOTG1ZNmRhaFdLTXNxd2hPNjk0c05I?=
 =?utf-8?B?YlVIUVZRRXdUZjhuNGZWWUJDajBhZEdwV08yZm1jdWZ6dkxFdEJNQkZFVGhU?=
 =?utf-8?B?bG5icm42a3BBekpNdDE0NExzQUp2MnpvWHU3bVc3Nzg5WlU1aDdINXF2RGFE?=
 =?utf-8?B?VTZSOThJcE9sUGNXZ01UNGZXWUtDNTVMdW1IMVdQbkRSSEJzaXFvNlQ3Y1Bz?=
 =?utf-8?B?eU9UK2ZaQ2dOOFlMOHlwUlhPcWt2MFFTQ3FTd2pEL0pWNHJ5SFNvR284VlRF?=
 =?utf-8?B?SWJpOVVxOTdqd3VvbGwvM0RKZk1YaWwycXVzM2NFd1JtVS9HcFBqcVRWQitk?=
 =?utf-8?Q?6jDn+gmAS15CVsYk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89aad3ce-c02a-4bca-c984-08da24464cdb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 09:55:58.4462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61CuB/SgDpEz/0tx7CLzETattXD+gYnHBVKd3Wd+91n39u6akTCu8u8HsFxCyFGZZtl/Kn/3f21ewGnD8qqS8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3351

On Thu, Apr 21, 2022 at 05:27:18PM +0200, Jan Beulich wrote:
> On 21.04.2022 17:21, Roger Pau Monné wrote:
> > On Thu, Apr 21, 2022 at 11:50:16AM +0200, Jan Beulich wrote:
> >> On 31.03.2022 11:27, Roger Pau Monne wrote:
> >>> Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
> >>> the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
> >>> families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
> >>> allows for an unified way of exposing SSBD support to guests on AMD
> >>> hardware that's compatible migration wise, regardless of what
> >>> underlying mechanism is used to set SSBD.
> >>>
> >>> Note that on AMD Family 17h (Zen 1) the value of SSBD in LS_CFG is
> >>> shared between threads on the same core, so there's extra logic in
> >>> order to synchronize the value and have SSBD set as long as one of the
> >>> threads in the core requires it to be set. Such logic also requires
> >>> extra storage for each thread state, which is allocated at
> >>> initialization time.
> >>
> >> So where exactly is the boundary? If I'm not mistaken Zen2 is also
> >> Fam17 (and only Zen3 is Fam19), yet here and elsewhere you look to
> >> take Zen1 == Fam17.
> > 
> > Right, but Zen2 already has AMD_SSBD (ie: SPEC_CTRL), so it's not
> > using this logic.
> > 
> > The AMD whitepaper is more clear about this: any Fam17h processor that
> > is using the non-architectural MSRs to set SSBD and has more than 1
> > logical processor for each logical core must synchronize the setting
> > of SSBD.
> > 
> > I think just dropping the mention of Zen 1 in the commit message
> > should remove your concerns?
> 
> Or keep it, but qualify it by saying that Zen2 isn't expected to take
> this path because of having SSBD. But iirc SSBD was introduced to
> Zen2 only by a ucode update, so such a description should not be wrong
> wrt such not-up-to-date systems.

FTAOD I've worded this as:

"Note that on AMD Family 17h and Hygon Family 18h processors the value
of SSBD in LS_CFG is shared between threads on the same core, so
there's extra logic in order to synchronize the value and have SSBD
set as long as one of the threads in the core requires it to be set.
Such logic also requires extra storage for each thread state, which is
allocated at initialization time."

Which I think is correct in all cases.  Iff Zen2 was to resort to
using the non-architectural way of setting SSBD (if that's even
possible) it should synchronize it between threads according to my
read of the AMD whitepaper.

I've also added handling for Hygon Fam18h, seeing as those also make
use of the non-architectural way of setting SSBD.

Thanks, Roger.

