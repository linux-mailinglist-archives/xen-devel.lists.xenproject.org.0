Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264326D0048
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 11:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516555.800856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phozH-000425-Bg; Thu, 30 Mar 2023 09:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516555.800856; Thu, 30 Mar 2023 09:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phozH-00040O-8S; Thu, 30 Mar 2023 09:54:31 +0000
Received: by outflank-mailman (input) for mailman id 516555;
 Thu, 30 Mar 2023 09:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiWc=7W=citrix.com=prvs=446b09b9a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phozF-00040G-H0
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 09:54:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da0d6308-cee0-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 11:54:26 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 05:54:14 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5385.namprd03.prod.outlook.com (2603:10b6:806:b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 09:54:12 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 09:54:11 +0000
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
X-Inumbo-ID: da0d6308-cee0-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680170066;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8XG9dPAsH3OTDtiUthCKw6IMShAyGZeZthTCrFfSAmQ=;
  b=LYyT7oI1RY/d8iBs1ITZcZQr7j8rL8FthcalgzvIuusNxZ1/r4z2U7Y1
   ArfhDh5TMHTOtiprVqPSM0Y5KjovYDnBvc6c6qN3OE1MQJCxEtnQfwLuu
   wIMmk6m89N8vqMEptSxc0oz9B3+zvWEfEc4z88/apkX8bgqMILrd9OmOC
   A=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 103017855
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JVHmL6I0CleoIATbFE+R9pQlxSXFcZb7ZxGr2PjKsXjdYENSgTNVy
 2MaCm+APq2LM2bxLopzOoSw8x9UsZLTmNIxGgBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QdmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pXlES9
 PA3MQkwLRWS2Ou87ZKmZMxz05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSPpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr33raQzX6mMG4UPK3lx64yim2N+jA4FjNIDHyq/8O3oEHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoHenUCRA5cud37+tlv0lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:T7qnC6s1RaVra4ACZle1okEM7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103017855"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1r4UrcfsOw09T/DYeg6k5NLe7ZsJRBoQ6R1gNVFjAw83DCBCFcMCUJw3Jm7I/MxdMNvWWFCNyTn/lnfrG9L5HHWUjEs0ykSqqOrnUSmZ3sNxRQs8cxAoyDSz2B+AY0MOT/T35aN2gM/djbQZgNZ6mxIV3jV2Ss/d3IVGab6Id79w4bthxsrCNR3eDWZc9jgh1BDc5WR+Z/BH2fOX72VpmCY+rmvfdovmYIpDY0NsK7mTfIdYezV4/0uL2RpHfw4b3nGMj1q7HJGre2E/t5lBWCA3lAEbUIy6/KqeMZYm4Cl6vqKF/WchDCX1cK6ipR4+m3DFh6PQF2IVWN9B/44RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IxSEg8DkVUQNEGQHlPB8+9xYjyZBvOqPYorJiDMMTo=;
 b=nubaI1nOtVQCu8ryhybxggn52G7GDk8cE+mphrQPLbJlCQ8drrEpNjoV8Tr37nhH+oedVeUrsIwc0hAdwRBvwkF66YjFSOqkWDMSoGHWRUEtSbuvyamoo7xrFVe05vQjniQdK6QQcb85rUEvyWQs+JnC+SuhhVmCJRAgCXvNTJ6jDSHrlesQCoDJUg0eN3iGTPBLiZ1lIOyXe/J7p21iB2ZsIPHDEcwVvnc4QLzyxYT9W9+JabzH8Q8KQ2senAMc+3peLB05p2WNvRRZMZMDeL2pZszOoYi0yVqDuKcpMlPZ9PzDIcAii3KucAv86cJM7OCtiStCZ43McrRVHTnQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IxSEg8DkVUQNEGQHlPB8+9xYjyZBvOqPYorJiDMMTo=;
 b=TX8uURfNCW6b0DD1BFOqJPmnhi4PiVaxRqHWkns2rvMnauy5bznWogJB9GsZRemaixN8W2eIiU3PSDR3rinLEykP+8oMgZh2NsU6ixeRPrdoouPnm4Q3RJ6+e9dvgjnvb6/fNg96WDdecpkTMWDScy6ZGmRg1ZtWTofd5x/d9Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Mar 2023 11:54:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Message-ID: <ZCVcPQNBS3bjVF+W@Air-de-Roger>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <ZCL3W/HrwLANuE/0@Air-de-Roger>
 <40d58ac1-d0bb-afed-c0ae-c545c7bff30c@suse.com>
 <ZCRIbKcfi8hn1m8Z@Air-de-Roger>
 <600f8643-fddb-e9f8-3d73-41eead3d7cfa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <600f8643-fddb-e9f8-3d73-41eead3d7cfa@suse.com>
X-ClientProxiedBy: LO4P123CA0591.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c53f17-84a4-4adf-4dcb-08db3104b66a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0/1bDrz9HJqHL8lDvLwSXyyEE1w1pWmOzKPs/WbJ+o0tu+xSCxLyLf882F7OVeEjjk6A+THevFllxiJX/DlgipYrS0nbvuaoq8szvii4XiUcjZjCZL1tM7qEq8BBVl7IHyja9/iKr/VVfpQhPna6O02p/opJ/fK5YCWnX58b9sYxW7RFsGKHWCcbpLRLjwjpSM9m9rz9qJCBxTxlSXBd7elIE+1TlDfxZTy93jqoFP5F0pDuRO3LqHQ7vLL8XqoozEy3zhztzgJsC5H30wrgvH4jYBMgpS/O0aECic2AwFtcWzvgm3B8pSc+AwfudOVCYP7nKunX9EZKRQ7MQCuq66ml+6TaGVJJo1ljUO/CTDmBG/no/V+aTa1i/NCrDW0HpA35QiaI2h+p9c8jW4aZnY4SEvMiUaAOm/VhbI0CjMucgzTNODsDu0V8lGb0VKzhFO9hKRrmbCpU04S6lUIBMUoriqgOq4UcOMhKwE4RHcqHBQweklNLvYDIJjVxOvQd0B49IY5NhVjiycZjciZxRDehULl4cEFP1+5fIlFqr+Y3EUHgwg28A/KgC3u5iupe2eVxcpBnuvM7ofOC2b7rBqIlqXO0AikRXcuYGIycVW0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199021)(53546011)(85182001)(9686003)(6512007)(6506007)(26005)(54906003)(478600001)(82960400001)(86362001)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(186003)(316002)(41300700001)(33716001)(38100700002)(6666004)(2906002)(6486002)(8936002)(5660300002)(83380400001)(66899021)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUQwdVZlLzVZV3FDS0RhTE44QUtXVndWSmVRQWFoRlpQT25TTlRtazFmd1NV?=
 =?utf-8?B?VHI5S0JianNYZlVreFhJUHhici9lTHpTalZCM2VjWUsxSUd3cFArTCtaWUdT?=
 =?utf-8?B?cXIwaUtuK3RYREg1WFg5UzBrbzVjN1AvNHRqK3hqZ1lFbHYvTlMrNTl0VGdH?=
 =?utf-8?B?RHFXSWx3U1RtWlhQdUpJVnhOYlIwS0pqWXpyZkRvckZ6NCtCdEdTbkVoTWx1?=
 =?utf-8?B?N05Xa0oyYTNsT2xULzZTb1ZteS9pUGg2NHVpR3ZkbUxXQ3RTRnNtSVlkditC?=
 =?utf-8?B?UzVUSktEa3RSLzV6VkN2WEU3NmVPQURpUGVYbENLZjVzaHVJcTdxUVJkMlR3?=
 =?utf-8?B?SFJCMHdyOTNqT3R6ZmN1YVBwdHYvRkVZUVZXMWY3L0RJUm5PZ0p5aE9iY2pM?=
 =?utf-8?B?dHJ0NHM4QUJGL0Mxb3FzN0REMGVNelQrbGJ3S1NocHdSYUtaQzl4Ykg4blVR?=
 =?utf-8?B?K2dVL3hoTGw1N1Iyd05CbzVRZHBieDd5MTM0S3VKYk9PaFZPd1ltMTNIUUt3?=
 =?utf-8?B?djNlNnNWbWdxdjcwLy93UUZjSXU3VGJlaWFnUEJFVE01TDl6LzVwRXJyVmFj?=
 =?utf-8?B?UzFEcmRMUmZJNTNaU0xSdGlYOVI0TjNYdjRXK1IxV1YzNEk2TkJETUNzZVdM?=
 =?utf-8?B?SzlZSGlzaURjRUtFWkUxOElxdmQxUTMvdXBOQWRWVmVKN1pWcFR6TTZSUTRP?=
 =?utf-8?B?Y1BQS1hMeFk2eTE3ZGk0eVFLYkhMNE5iQXhHZzI4Q1Nwdjllb095K3BhQVJC?=
 =?utf-8?B?bGlsSGI4Smw0UFhzYlloMkZwRFlmYndybHBDUXQ1Ui9aLzFaKzcyMUdsU2Rx?=
 =?utf-8?B?VmwraytoZWJwZGU4QWNRL2hUeHRLWWxEemlFdzk2d2k4aldWV3JYcC9PYmN0?=
 =?utf-8?B?UmxUaUEwcjhkenpKQk83bTlhYWd6RnpYM2diZlBkb2EvbVZkL3RnaDJ6QWo3?=
 =?utf-8?B?d0JpUFJqcEp3RTRuM0gyaVFneVJJQ1NhYldTNHJJUW4zYXhROTdsRDRhaktY?=
 =?utf-8?B?RmZPRUtzODFUK0JRWmdmZkw5allUdmluUVhKU3NBdldEdGhROTFrdTN5eEpr?=
 =?utf-8?B?OWdjMHM0V0l6dld4czRiWHdNRkd2N0VMWG8wN2tsMTlrYXI5d3BzTGJUcy9r?=
 =?utf-8?B?dmxySzJFSEVXYTVQanI2WlR5UUw1azIwTHU3ODhEUTEvRFVEVmRhQk93bnpY?=
 =?utf-8?B?THJRWmJmN3I1UjZWZjluanFlNnp1ZkFjbDZSNFpxVmpranZqNnhrVmNabVF5?=
 =?utf-8?B?ZUJORjZXL1VrUzMycDFuckExelFEcW5PL1JyTGJKczZUT0Q4WmpvNmxPamVM?=
 =?utf-8?B?SGY2eXByQlF0SWhoNzFoeVVneVZxV2JudVJoWGM0U1Z1MzZ2NjJjNDJvMVFP?=
 =?utf-8?B?ZGhBUElzdm1hQlNGeHFsc0dQeEVwSStrUlEreW45d0ZTRGV2S0EwYTBYWWdy?=
 =?utf-8?B?eUNIaEZhQTFxdlVlcnRhK3Y4SjV2Mm9rZHg2MnBwV3lNd3VSWFRod2dERzNJ?=
 =?utf-8?B?c0JEWXFRMmdhR0RlRzRVNlBpN1M3eFZRUWZIU0hzUmJLYmtzYmsyaU1vWG5N?=
 =?utf-8?B?TjFxZnd6M3RNc0hDeFIrNWE0ZFpmcUcwSVFmVWFEcjBVL0NFTnkzSkFab1gr?=
 =?utf-8?B?SmxWckRWOFNFMU1pOTdKSUYrRGZQOGtPV1JDTS9IcGhZN00xUTJiNlZQakdM?=
 =?utf-8?B?THFCYWJ6bHJTUFNsWWpYeTZLcW91cnVPTnhWYlZVU1FYV3UxQ2pEQUQrWUtl?=
 =?utf-8?B?NkhKS0E2RlNaUms3SjNkZXQvRGRMWjVvbEVyV3ZNbndWaUh6Nkw3N01pVGhr?=
 =?utf-8?B?aUk5RjFUT0paT016c0czYVlyWHdkNmI4STRJSHQ2VnFneDdTbDM3V0hxamZM?=
 =?utf-8?B?a3lzZlhmbjl4VXVjclBvbWM2QjZHR29mWVZjSXdLRnpneDl5d29TbFZ3UUo4?=
 =?utf-8?B?ZmlSRE02Q0pVL0dOUXdiMlpOUi9EUUNyY3RBQTJyZHIrTTlNbS9jT1B4U3Fv?=
 =?utf-8?B?SXZ5RUVvVEYrKzBqb2pqQ2g5WHFSaUtRdEdoY0owT1Z1emJFalNXSmE5Y1gz?=
 =?utf-8?B?ejJWZm1OWFJLbjRZNm9SRUFmNVVIZW1JREZkcEpKR0N6S0Exa3hFQzJrS1VC?=
 =?utf-8?Q?WpOdB1zABeXb9y7VhZfcgMVVA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ttppVgmQUiTKv1ua5RphFfFJw/MqZoIxmNutMnuKqHfRhb42AOr9hWtA0gL4djLDfJopX+DByGY8WSeA6yuifIEms7uFYRY2JMI5JpQNwsvE1vKL4XuPc+mvi+OBXpmIy5Dd/Mw0LTLblskC023AAS+K18sABjba6KOvcNpeK5hlEHQVbvQQGAft8Ah5p/iaY/DIfeUUNPffra33uUSvvTYFpZHYGWudjUr4RDvYw2x9qLdpg75KtMCpeQ7h+EWK2oQJzCpKVuB6uZ5w01PRIOh4pjw6/2ozkljf+tsd8XOANZgzsm4amlYu6JxQ236CjnaVn0wFVba6EtFIdvm8QoS45hyDI5L7I+Xm5eUY5S9XRwwrAfoXZdQ2rUdpwUvd3iDkGZ6Kl6GZ3MfA3xHRPLd9Dh+bSeq4LbQ7eECGJj7hOkZsIDM7Y3qpDYlHJcJDrRvXHGJxC6ovr/3VCbxeH7gqRsnTKjxMaV9puCWmLpup4OvVR7Pajginu3zDrR7529k+e9wlw13PwTK9FfgvSyV5n2cujahcWEs/SWmPbCW0JaoV3JIlm7syRJq12X5xXLJ/tel7+u5dIOdxuFcRhzQphCb3ch4IAdCFRWR0iCTzplYH0zgZpWNLXhPt5dyZ+j45vr5/TcsQWooHvBOrBV4u10bnX+jce1eBNbbuJa364rQ0dLAZHmGX9yJWN7ek+DqUuzf41STKhqrvzsGXdA/azbxhTtDnUj+63UGq62rmPCae9wjuROX45THIpl+rfFFHgRrbmHIaSwJ1+9rK8IXRcw7dn/fX5VUZC3ewDtci8CM+x+qIcGDM9vb2Af0O
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c53f17-84a4-4adf-4dcb-08db3104b66a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 09:54:11.7325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9P+QB/MlWg8vpXSaG6ckpVS2Elk2cpdYdQ8hLmXe2UYFydCpjsdLUu6KtQg3cpn2rW523wBKcNlUXmUe6wkuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5385

On Thu, Mar 30, 2023 at 09:53:23AM +0200, Jan Beulich wrote:
> On 29.03.2023 16:17, Roger Pau Monné wrote:
> > On Tue, Mar 28, 2023 at 04:48:10PM +0200, Jan Beulich wrote:
> >> On 28.03.2023 16:19, Roger Pau Monné wrote:
> >>> On Wed, Jun 15, 2022 at 11:57:54AM +0200, Jan Beulich wrote:
> >>>> ... of the huge monolithic source file. The series is largely code
> >>>> movement and hence has the intention of not incurring any functional
> >>>> change.
> >>>
> >>> I take the intention is to make code simpler and easier to follow by
> >>> splitting it up into smaller files?
> >>
> >> Well, I can't say yes or no to "simpler" or "easier to follow", but
> >> splitting is the goal, in the hope that these may end up as a side
> >> effects. There's always the risk that scattering things around may
> >> also make things less obvious. My main motivation, however, is the
> >> observation that this huge source file alone consumes a fair part
> >> of (non-parallelizable) build time. To the degree that with older
> >> gcc building this one file takes ten (or so) times as long as the
> > 
> > I wouldn't really trade compiler speed for clarity in a piece of code
> > like the x86 emulator, which is already very complex.
> 
> Of course, and I specifically said "main" motivation. The hope is that
> by splitting things become less entangled / convoluted. I guess fpu.c
> is a good example where certain non-trivial macros have isolated use,
> and hence are no longer cluttering other parts of the emulator sources.
> 
> > Do you have some figures of the performance difference this series
> > makes when building the emulator?
> 
> No, I don't. And the difference isn't going to be significant, I expect,
> as the build being slow is - from all I can tell - directly connected to
> the huge switch() statement. Yet the number of cases there shrinks only
> marginally for now. The series is named "a few small steps" for this
> reason, along with others. See below for a first bigger step, which may
> then make a noticeable difference.
> 
> > A couple of notes from someone that's not familiar with the x86
> > emulator.  It would be clearer if the split files where prefixed with
> > opcode_ for those that deal with emulation (blk.c, 0f01.c, ...) IMO,
> > so that you clearly see this is an opcode family that has been split
> > into a separate file, or maybe insn_{opcode,blk,fpu,...}?
> 
> Hmm. For one, "blk" isn't really dealing with any opcode family in
> particular. It contains a helper function for code using the emulator.
> So it falls more in the group of util*.c. For the others may main
> objection would be that I'd prefer to keep file names short. At least
> at this point of splitting I think file names are sufficiently
> descriptive. Nevertheless, insn-0f01.c or opc-0f01.c may be options, if
> we really think we want/need to group files visually. However, I don't
> expect there are going to be more files paralleling 0f01.c et al: The
> opcode groups split out are the ones that are large/heterogeneous
> enough to warrant doing it on this basis. Of course new such groups may
> appear in the ISA down the road.
> 
> FPU is isolated functionally, and I'd expect a simd.c to appear once
> it becomes clear if/how to sensibly split out SIMD code. Unlike fpu.c
> I'd further expect this to (long term) consist of more than just a
> single function, hopefully replacing the massive use of "goto" within
> that big switch statement by function calls (but as said, plans here
> - if one can call it that way in the first place - are very vague at
> this point).
> 
> > I've noticed in some of the newly introduced files the original
> > copyright notice from Keir is lost, I assume that's on purpose because
> > none of the code was contributed by Kier in that file? (see 0f01.c vs
> > 0fae.c for example).
> 
> Right - 0fae.c contains only code which was added later (mostly by me),
> if I'm not mistaken.

OK, just wanted to make sure this wasn't an oversight.

> > Do we expect to be able to split other opcode handling into separate
> > files?
> 
> As per above, "expect" is perhaps too optimistic. I'd say "hope", in
> particular for SIMD code (which I guess is now the main part of the
> ISA as well as the sources, at least number-of-insns-wise). One
> possible (likely intermediate) approach might be to move all SIMD code
> from the huge switch() statement to its own file/function, invoked
> from that huge switch()'s default: case. It may then still be a big
> switch() statement in (e.g.) simd.c, but we'd then at least have two
> of them, each about half the size of what we have right now. Plus it
> may allow some (most?) of the X86EMUL_NO_SIMD #ifdef-ary to be dropped,
> as the new file - like fpu.c - could then itself be built only
> conditionally.

I don't like the handling of SIMD from a default case in the global
switch much, as we then could end up chaining all kind of random
handling in the default case.  It's IMO clearer if we can detect and
forward insn to the SIMD code when we know it's a SIMD instruction.

I guess that's for another series anyway, so not really the point
here.

> > I wonder how tied together are the remaining cases, and whether we
> > will be able to split more of them into separate units?
> 
> That's the big open question indeed. As per above - with some effort
> I expect all SIMD code could collectively be moved out; further
> splitting would likely end up more involved.
> 
> > Overall I don't think the disintegration makes the code harder, as the split
> > cases seems to be fully isolated, I do however wonder whether further splits
> > might not be so isolated?
> 
> And again - indeed. This series, while already a lot of code churn, is
> only collecting some of the very low hanging fruit. But at least I
> hope that the pieces now separated out won't need a lot of touching
> later on, except of course to add support for new insns.

OK, I'm a bit concerned that we end up growing duplicated switch
cases, in the sense that we will have the following:

switch ( insn )
{
case 0x100:
case 0x1f0:
case 0x200:
	x86emul_foo();
...
}

x86emul_foo()
{
    switch (insn )
    {
    case 0x100:
        /* Handle. */
	break;

    case 0x1f0:
        /* Handle. */
	break;

    case 0x200:
        ...
    }
}

So that we would end up having to add the opcodes twice, once in the
generic switch, and then again at place the insn are actually handled.

So far the introduced splits seems fine in that they deal with a
contiguous range of opcodes.

For patches 1-7:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Patch 8 I'm unsure, I guess it should be up to the user to decide
whether to use -Os or some other optimization?

I expect introspection users likely care way more about the speed
rather than the size of the generated x86 emulator code?

Thanks, Roger.

