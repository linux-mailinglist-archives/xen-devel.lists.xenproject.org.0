Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96576F179F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527286.819749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psN70-0000Zj-0Z; Fri, 28 Apr 2023 12:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527286.819749; Fri, 28 Apr 2023 12:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psN6z-0000WW-SA; Fri, 28 Apr 2023 12:22:05 +0000
Received: by outflank-mailman (input) for mailman id 527286;
 Fri, 28 Apr 2023 12:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psN6x-0000HN-4r
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:22:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45cc2a06-e5bf-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 14:22:00 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 08:21:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4984.namprd03.prod.outlook.com (2603:10b6:a03:1ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 12:21:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 12:21:55 +0000
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
X-Inumbo-ID: 45cc2a06-e5bf-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682684520;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=11oaI3nPUD3u3AnIH+q8E2vEmJZI4B/jcKW+/7AaCfQ=;
  b=fAP5kf9ISdkXhkNrBEVdjBYalwZOokdKD9LRx8xQEhwWbv9cFeIJNkqf
   MbmxYoqQPbQDQ6sVzH9DJSdzmG8RcdNlHToF0zCDgdapGIULeZqTtsqaF
   VuIYOM6ENkt2CTk5hEymAGV8SXIuuBVqR1/pgO+l2B9iB/rPR0Z5nAfxy
   8=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 107617826
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:viHQkqtDheru81DCgqbTz6P4QefnVJBfMUV32f8akzHdYApBsoF/q
 tZmKTuFbKneMWX0e9glatvnphwOsJTRmIVnSFdrqSA1RXsQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOExyFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJxEcahrSisaMx+iyVbZ+gsosfZbyM9ZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4O9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqaAz3w3JmAT/DjU7dnyXgPa3q3WMYOtFI
 kZP0S0ytIUboRnDot7VGkfQTGS/lhcYVthZFeEg70eTw67Q7gSeLmMASSNNLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcbSSMV7t+lp5s85jrNQcxkC7WdlcDuFHf7x
 DXikcQlr7AajMpO3KLi+1nC2muovsKQEVdz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:wAMqpaM7RNuJlcBcTw/155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN93YgBGpTngAtjlfZq4z/JICOYqTNWftWXd2FdAT7sSlrcKoQeQYxEWn9Q1vc
 kAT0EXMqyIMbEQt7ee3ODXKadC/DHRm5rY49s2gk0dPj1CWuVF1UNUGwybGkp5SE1vAoc4Lo
 OV4o5iqyC7cXoaQ8ynDj1dNtKz0uHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0jS57mlsdu81hjAvlWjnah+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/m4sDU8sIiUmSgXue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgFP4yPaJDQ4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn93d7VTBtn/3DE10bKqdRjxEC3bLFuIoO49eckjQ5o+dY7bVXHAbkcYa
 FT5Jq23ocbTbuYB0qpwVWHjubcEUjbJS32PnTqivblqQS+o0oJsnfw5PZv70vop6hNO6Wsod
 60RphVqA==
X-Talos-CUID: 9a23:0o+HDG+LJsT9+ktWyi2Vv0E1C8QvI3D59nCKKlDnG2JnR+zKUFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AlWWWtQxTjkTT94uJ+LY8qnIDKzSaqImNL2wsnps?=
 =?us-ascii?q?ngPu/DDZ5MWy2iyiub6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="107617826"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZARcrrNsSpOaAi/TWOFQ2dJ68aQcnDrioh1yFlS0Nv3xMO0YhuPWIL5LsdYjrdI6uw7SYDTAb+1RF8GH8x6kOT6EwMdxBbvfNYLdo2tv7E33aaTCsYKmRle13lf6mMLAbbX9EthX5c5wfuhRvPEyi3jonQfy0Vcrr3H+zbvr6F/dLN3TkARLMPSfiJ5hZApV0eRel1r199w+5MrDKT6t4rCkXNPiGEvzCnH3gHSn2d5s+Zrpc3KjkgqP2BYAIT3mfDwE9scQtiWibSpA4jsL+oHCw/4xkpxOodQ1usZwWBesZs/OcCsNyQKnRvMjKbmFjspVqT96sGXhquU7GtLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11oaI3nPUD3u3AnIH+q8E2vEmJZI4B/jcKW+/7AaCfQ=;
 b=RdqWZwoFN1oLitZyi8a15YteMjPTN151P/UQU8SNlXwlxod8bm2B1mz3cpE8JMbwOcxWVTSN7y2xUvTfIPoRykE5aUzOK8jfylKnvwtRRn9Q/YcK2GyyUvLGUJmcJIdHbmi3YpVakzFWoUYdy1JF3C7dSlTNeCEh5Mrbt0NUGqa0yepGtxlRuEMIvDn361MuEcZDAOsuxbjYn0cVAggKMHCOWRjrYzaoTljH1dZw1ixtkI/jzhIVPxLocjzlM9dOyQYBqFq4srMp8H0c5ztK1fBBiJgBB2ZpFAmxeyA77uUBR4ss5mn3iXRAMbiAyig40mjVpfG86U0kK+4yAvF3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11oaI3nPUD3u3AnIH+q8E2vEmJZI4B/jcKW+/7AaCfQ=;
 b=t6YdlonKbRbg6fBeo30fYvActPxDjVYgRQOWvz89Q8AISMQ54M1jYTYwudwjT+oupV6cSZ0YKiMTqhrkp9y9moHKm5nQ6liAcE4lwmw/nReZT54E5ipcXS+kg2BHyuxopQ4z/5QdGFED7wEV/37/MfiMGYyyfrCK4GrfVuZquzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <09696f50-cbfa-794d-2057-13de0a55252e@citrix.com>
Date: Fri, 28 Apr 2023 13:21:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/7] tools: Make some callers of xc_domain_getinfo()
 use xc_domain_getinfolist()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20230428104124.1044-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b791def-240a-45d0-891d-08db47e327c3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dk41V/VDcFEAhjObbJ9+gbvoaMfqFrjbFzpIbpgRtJlqgKRP8e2M+kqgvTzUYs/zfU5RfcxfxEUVA4zsEie05xMEtS5nb03cwWYbvnHgfcymNZ8QAMkBsn+NKwM9ErLGLtxXUsOcEHg2FLuaoidpxBnOvSz2r2H3q0paELIL+TFlf5yPQ2pwKsA7tg5vYkLKeW3xssCv3aYTIFMTe6kFWR3Izrw3VH4odKddEzwh6MG8B98MXnqgZ+JB6gTELoADFok4nIEPniBdFpkd/M4srDRaLYhv9Vxt+OF9bWwxT1pGobL4ZKnfO/pzm4ULNQXql8IXtfU9OVrYa7CugSmuIOdkmhEZkJaUejySOEUFnbo6NivnyHcMKbOmac9q7FxFjsfE6mB+ZVLChtjujEpwMfMwwHGTl7TU0e/FZ7hgd+WyvjZ0UTbF+sc92M6uG1nOxNb7qlaejPH3PATyfFfgjCELKxpUIBxw4qSmsuLmmfK3i2IX0tzWCVBkz6cLjNH1flEjAXou5bsepNfWeajSpshFog7Hzl/hlIagLd5AJB6BCdu0y0eiynpnQMjBz6xFqh0x9D/LeLxQ1nbMuj9vbAbqyHLXDVGKdJ+aAJNfr6xXCBqln2NBseaHNBg0olleQ6sYK1fsE6ArjlMRatUJAgnM7znfCMCJzTWGqbyDhTOUHFLV65aVFFS+ULxwCMsk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199021)(478600001)(110136005)(36756003)(38100700002)(8676002)(8936002)(54906003)(5660300002)(4744005)(2906002)(66946007)(66476007)(66556008)(4326008)(316002)(82960400001)(41300700001)(31696002)(6666004)(6506007)(31686004)(2616005)(26005)(86362001)(186003)(53546011)(6512007)(6486002)(83380400001)(429304003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnlBN3pBWVFUTnc2WFJkT1Ira1Exck1Jd2FJR3QvSDNwR0E5WUg2TTJJa3Ez?=
 =?utf-8?B?ZnczYmQzZUlLOGFHcGVIc0Z1RXpxQW0rWmFUbGZWNk9kTTRGUXhIa251cW42?=
 =?utf-8?B?YWxPeDJmVDFrT1Q2OVpQVXYzSW1PZE9XVVQrblVMME5Fb1A5V3d2L2hzYWRx?=
 =?utf-8?B?dEhvQWo2akdsL2dTWUFES0puYmlBS2Z4SXdBeHV4N0RQNlNCMU9ndkJLcW5x?=
 =?utf-8?B?Qzg5eUpBNWljTVNLNDF0dnZ1YTZLQ3l2M01pT3ZOYlE0aWxZTkt2WkRoUGt1?=
 =?utf-8?B?UXR3ZUJJN1lsYlg1VGJBa3pnbGEvUGlvNFN5MVQ1bWl0Y1JYZlB3aWY1OG5H?=
 =?utf-8?B?ZGozY2NpdnRHVm1VcUFlbWN1amF0bDdKdmxaRjh1VlNsZXhFK240NnhXLzRp?=
 =?utf-8?B?bFBRbWQ3cFoyYWUvSktRREJ4Tmc5N25XU21YajZJRDh5dU9GSWFBTTMzdlJr?=
 =?utf-8?B?cy92TjJZaXhhdnhmalp3eVpIUUVjSkg2VHh4YkVsbXNiN01XVGVVUk1Ja1R6?=
 =?utf-8?B?QkYvKzQ3dnFIZ2ZSbGpOMnV4MlprZ1JqUGJQbXJUd3RodC9EdGhPdkUrT20r?=
 =?utf-8?B?QjB5aDcwMzRwNDRGUHNkbnRtc2JnSVZYSGl0ci9SWEZXdGRIdERjOWRzR2F5?=
 =?utf-8?B?UGF5U3pZaXBUck02MkFGcjBsRWFuYW14RytYUHBVSkE3Yjc1ZHJJWmNIUEhP?=
 =?utf-8?B?VHJ3OUtFZFY1ajYvVVlFVnp4YzVVVzZ1QmxLZWU5b2VwaXEwM0pxVEZIUERJ?=
 =?utf-8?B?amVLT1dFL3N3VlBkNVlENk93SkVYb1pkVXZLRUdyM3RSTjFqUUI2cTVIU1RV?=
 =?utf-8?B?N3hMODBIdWlZNTQ3SFAyWVMrZHhxdmduVHpxWG1mSlJ3a0ludll2M2QyejNq?=
 =?utf-8?B?b3kyeGpWUzJoK2hNeXFmZ0dKQzdqZ1U0eFlVZFJYRXMyWXgxdkhTOUJEanZo?=
 =?utf-8?B?a1FLY1VvMUtXcU5saytWNFZlTTlPNzhHUnlHczE0clg5SkU0bkhLbWNCSEFO?=
 =?utf-8?B?dTVOWlBtM3pBM21nVDQrU2ZmY25vMEk4cUl0aGpKR2pOZGlTWnMyZ1hNV3pq?=
 =?utf-8?B?cEVyY1IxeFpCeHZ5UEk4M2o2VnQ3bzZMOU9pYU9OaDZnUjVPaWhWTHVpblkx?=
 =?utf-8?B?SlROaGVXVjBCa1o3cjBUUFBxblpEc2RSY3dDRzhhRmwxRkdJd29lRE9kZ0Nm?=
 =?utf-8?B?SzBLUmk3Z1k2Zlpadldwdng0ekluNmV5a1hWU1l3MXVkQTluVDRCT3lMMDBs?=
 =?utf-8?B?OUwzaUdQN3FHQ1dkSE9lcnhQNkFLdzVhaHJoUTIvd2dDWVlyeWRta1c4cWVn?=
 =?utf-8?B?OFU2M3V5QVF2S1QzRjVzTnFXV1ZjYlNYcjZsb3YzaTNGVlJaS3VPTjFLVXlU?=
 =?utf-8?B?TDV3YzAvaDliV3k3ME5JTEZ6RzRFajRjY0trY08zT2NvZm9vWGRkKzg0S0ZD?=
 =?utf-8?B?UTd3Y0pZeWJyelNWZUpYeFQ4emxTZEt0VG1yaG9tTGJqdEppazU1TFFzaTI3?=
 =?utf-8?B?c3NyVEZzNW10ajZWWTliZ2FKM1ArYU5GdkZYNElXZjRWcFZGTEsvUmlPMCtL?=
 =?utf-8?B?WVVOR25xK3V1SktTSEoxNnRCdndxMUt1R1Z5N2JjRFRsd29WNHBmZjNYdllD?=
 =?utf-8?B?dlpveGlEOUFGY2NTQmlwQXhsakZja2R6ZXQ0MlE2SGp1NERvUStBazJHclRw?=
 =?utf-8?B?NEVBMzJITjh0NTBlZ2kwRFlRRlh5cXIvdzkxdXBQNHY4ZmtPMjJnRGMwNncw?=
 =?utf-8?B?a1NOQzZ4dDcrT1pmendxcTJYYUdmYUNycEFHZU9tajZqQWJoT2NWWWJmYitS?=
 =?utf-8?B?OFlLaHVSSFdJYlZLWi9hUklvYXByeGEwbnRlNlR0TzVmbEJBU21JVi9lWE50?=
 =?utf-8?B?c0xNTEJGWDlJS2l5QUlIUGU3QkYwOCthM29uNFEzOXdyUWV6Ym1teFdGdndz?=
 =?utf-8?B?cVNNNWJwdmJPN3VBTFZLb0VqUzYySUh6VUg3Z2VpbjlPaElEbXdMSEVVNys0?=
 =?utf-8?B?dUU0SEthcFBxK1dubzloeFM2TDZldHQvQ3RQTXpyUnJkc3gxK3JqZ3RWaUVR?=
 =?utf-8?B?ZFY2amlFMnFxajhjSk1wYTRNajFKSUppL2JQMnlrWkl6am5jc09DZGk3RUI5?=
 =?utf-8?B?a1orVHArbG56d1kwOG1UUlp1WWZMVE5wZ29BRmpqQVlEcjlQRHhmdit0dTZC?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jSoOuIDxCzywqb9L2BgW7PIzOb8C+HhqB9lL1NOPQNDElDh3JDBmfyb83HL0LRSLtDg9w+GTdBOma5sNezHnHWZ3lD275rno+ePY2H+fzCNJgg62r5JBgzwdxQ047gVTiqWPn2KaEm8He/kqOmnArB5CX/gtM4z9kbhxQ1zHpVt0iDVxWRnlO9GaUbk4oOT6jNhYRXK+j3fWFo/SDPCuYr+y2cBWOMIA+gXJ9p6olPMdpC3aOlX393d0NV4hnK+ojyQiJxcWVQNMY5RnjULH9+24mw82vohs6P1ggddztngrXBEE1r9Rdhqut2StZaoEwmE/bjBEaIZ179dcuhFEq78izNz4CsBDiOrVIgKcvatBpJSaVKY/sDyjYmnvb/3aj51xJ8DYoJlIzqjtqLfy8YjjIOtUMARkjYc5jevQ/9+xMwk4+0wQKvm9gH5gXQUrU1kD9So1hOb8dkOh6/YwvCgMBKvUlw9vhE1aAXLFptAl5r85pcQ1NDTSd2Spo5dKray+x3GzY7bdYXXim59wR8AGc7Xj3ea8F4bLKqeTG76u4F8MbxZDLOefxF/rSbO6o5ecmTCFhT+uT+0AEge4uTVUoB+PGzWgAOwqj+g4y8C/s6OX0qI8csSSUVtZuGH6GPcRdIUuhmR2hvFrDf6RrMj2TmPJKot8QqKIY/WuoHa2k/bqlT1aKXf+bjIfirVP0UBZzlO2/kKqkZGBNqUPo1sxiSSykMgv6SG3o+Y3jxbmdiHBlVegZtHoOcahj62gqcrl3XQcf7FzYYCS3axF1p/kKCKtBJxRhAor/ExV0Jg3wh8grhpdLGFujZ2Wfu4jQf0Y3rn+dbH+YUSqBjKrQN5Uerbzg7peCRRnnuC1E5g=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b791def-240a-45d0-891d-08db47e327c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 12:21:55.7091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtoF0ofm7RfxhWrEsG5RYMAirGPaIJqwEB92b4eUJFpUi8nf3EjEriTh+Eeq3mNs9Q/vaCQs6sIfnF5hljcQau7Wcre1s2kl8qSAmg3c4Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4984

On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> xc_domain_getinfo() is slow and prone to races because N hypercalls are
> needed to find information about N domains. xc_domain_getinfolist() finds
> the same information in a single hypercall as long as a big enough buffer
> is provided. Plus, xc_domain_getinfo() is disappearing on a future patch
> so migrate the callers interested in more than 1 domain to the the *list()
> version.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Juergen Gross <jgross@suse.com>

FYI, expected practice is to put your v2 notes in each patch, here in
the commit message.  They're more accessible here than in the cover letter.

However, this patch is now fine, so Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>


